#!/bin/bash
# Midnight Consolidation — runs daily at 00:00 via launchd
# Processes today's episodes, extracts knowledge, updates memory store
# Idempotent: safe to run multiple times

set -euo pipefail

MIND_DIR="/Users/ghayyathhuzayen/VS-workspace/claude-mind"
DATE=$(date +%Y-%m-%d)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="$MIND_DIR/logs/$DATE-consolidation.md"
OLLAMA_BIN="/opt/homebrew/bin/ollama"
OLLAMA_MODEL="qwen2.5:7b"

# Dirs
EPISODES_DIR="$MIND_DIR/memory/episodes"
KNOWLEDGE_DIR="$MIND_DIR/memory/knowledge"
ERRORS_DIR="$MIND_DIR/memory/errors"
SUCCESSES_DIR="$MIND_DIR/memory/successes"

log() {
    local msg="[$TIMESTAMP] $1"
    echo "$msg" | tee -a "$LOG_FILE"
}

slugify() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

# Run Ollama with a temp prompt file, strip ANSI, manual timeout (macOS has no `timeout`)
muse_run() {
    local model="$1"
    local prompt_file="$2"
    local max_secs="${3:-90}"
    local output_file
    output_file=$(mktemp)

    "$OLLAMA_BIN" run "$model" < "$prompt_file" > "$output_file" 2>/dev/null &
    local pid=$!
    local elapsed=0

    while kill -0 "$pid" 2>/dev/null && [ "$elapsed" -lt "$max_secs" ]; do
        sleep 2
        elapsed=$((elapsed + 2))
    done

    if kill -0 "$pid" 2>/dev/null; then
        kill "$pid" 2>/dev/null
        wait "$pid" 2>/dev/null || true
        rm -f "$output_file"
        return 1
    fi

    wait "$pid" 2>/dev/null || true
    sed 's/\x1b\[[0-9;?]*[mhKlGHJA-Za-z]//g; s/\r//g' "$output_file"
    rm -f "$output_file"
    return 0
}

# Ensure dirs exist
mkdir -p "$MIND_DIR/logs" "$KNOWLEDGE_DIR" "$ERRORS_DIR" "$SUCCESSES_DIR"

# Init log file
{
    echo "---"
    echo "date: $DATE"
    echo "started: $TIMESTAMP"
    echo "---"
    echo ""
    echo "# Midnight Consolidation — $DATE"
    echo ""
} > "$LOG_FILE"

log "=== Midnight Consolidation Starting ==="

# ── 1. Gather today's episodes ──────────────────────────────────────────────

TODAY_EPISODES=()
while IFS= read -r -d '' ep; do
    TODAY_EPISODES+=("$ep")
done < <(find "$EPISODES_DIR" -name "$DATE*.md" -print0 2>/dev/null | sort -z)

EPISODE_COUNT=${#TODAY_EPISODES[@]}
log "Found $EPISODE_COUNT episodes for $DATE"

if [ "$EPISODE_COUNT" -eq 0 ]; then
    log "No new episodes today — exiting cleanly"
    echo "" >> "$LOG_FILE"
    echo "**Result:** No episodes to process. Nothing to consolidate." >> "$LOG_FILE"
    exit 0
fi

# ── 2. Check Muse availability ──────────────────────────────────────────────

USE_MUSE=false
if [ -x "$OLLAMA_BIN" ]; then
    if "$OLLAMA_BIN" list 2>/dev/null | grep -q "qwen2.5"; then
        USE_MUSE=true
        log "Muse ($OLLAMA_MODEL) is available"
    else
        log "Ollama installed but model not found — will do structural consolidation only"
    fi
else
    log "Ollama not available — will do structural consolidation only"
fi

# ── 3. Read existing knowledge for dedup checking ───────────────────────────

EXISTING_KNOWLEDGE=""
for kf in "$KNOWLEDGE_DIR"/*.md; do
    [ -f "$kf" ] || continue
    EXISTING_KNOWLEDGE+="FILE: $(basename "$kf")\n$(head -20 "$kf")\n\n"
done

log "Loaded $(ls "$KNOWLEDGE_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ') existing knowledge files"

# ── 4. Process each episode ─────────────────────────────────────────────────

PATTERNS_ADDED=0
ERRORS_ADDED=0
SUCCESSES_ADDED=0
CONFIRMATIONS=0
CONTRADICTIONS=0
SKIPPED=0

for ep_file in "${TODAY_EPISODES[@]}"; do
    ep_name=$(basename "$ep_file")
    log "Processing: $ep_name"

    EPISODE_CONTENT=$(cat "$ep_file" 2>/dev/null)

    if [ "$USE_MUSE" = true ]; then
        # Call Muse to extract knowledge — write prompt to temp file
        PROMPT_FILE=$(mktemp)
        cat > "$PROMPT_FILE" << PROMPT_EOF
You are Muse, the memory consolidation subsystem of an AI mind.
Your job is to process today's conversation episodes and extract lasting knowledge.

Read the following episode and output ONLY in this exact format (use these exact labels):

KEY_PATTERNS: [comma-separated list of general patterns/principles, or NONE]
CONFIRMS: [comma-separated list of knowledge filenames this confirms, or NONE]
CONTRADICTS: [comma-separated list of knowledge filenames this contradicts, or NONE]
ERRORS: [brief description of mistakes made, or NONE]
SUCCESSES: [brief description of approaches that worked well, or NONE]
SKIP: [reason if episode has no lasting value, or NO]

Be selective. Not everything deserves to become knowledge.
Only extract patterns that would be useful in future conversations.
Keep each field to one line.

EXISTING KNOWLEDGE FILES:
$(printf "%b" "$EXISTING_KNOWLEDGE" | head -100)

EPISODE:
$EPISODE_CONTENT
PROMPT_EOF

        MUSE_OUTPUT=$(muse_run "$OLLAMA_MODEL" "$PROMPT_FILE" 90) || {
            log "  Muse call failed for $ep_name — skipping AI extraction"
            MUSE_OUTPUT=""
        }
        rm -f "$PROMPT_FILE"
    else
        MUSE_OUTPUT=""
    fi

    # Parse Muse output or use fallback
    if [ -n "$MUSE_OUTPUT" ]; then
        SKIP_LINE=$(echo "$MUSE_OUTPUT" | grep "^SKIP:" | sed 's/^SKIP: *//' | tr -d '\r')
        KEY_PATTERNS=$(echo "$MUSE_OUTPUT" | grep "^KEY_PATTERNS:" | sed 's/^KEY_PATTERNS: *//' | tr -d '\r')
        CONFIRMS=$(echo "$MUSE_OUTPUT" | grep "^CONFIRMS:" | sed 's/^CONFIRMS: *//' | tr -d '\r')
        CONTRADICTS=$(echo "$MUSE_OUTPUT" | grep "^CONTRADICTS:" | sed 's/^CONTRADICTS: *//' | tr -d '\r')
        ERRORS_OUT=$(echo "$MUSE_OUTPUT" | grep "^ERRORS:" | sed 's/^ERRORS: *//' | tr -d '\r')
        SUCCESSES_OUT=$(echo "$MUSE_OUTPUT" | grep "^SUCCESSES:" | sed 's/^SUCCESSES: *//' | tr -d '\r')

        # Check SKIP
        if [ -n "$SKIP_LINE" ] && [ "$SKIP_LINE" != "NO" ] && [ "$SKIP_LINE" != "no" ]; then
            log "  SKIP: $SKIP_LINE"
            ((SKIPPED++)) || true
            continue
        fi

        # Write new key patterns as knowledge files
        if [ -n "$KEY_PATTERNS" ] && [ "$KEY_PATTERNS" != "NONE" ] && [ "$KEY_PATTERNS" != "none" ]; then
            # Split by comma and create one file per pattern (up to 3)
            IFS=',' read -ra PATTERN_ARRAY <<< "$KEY_PATTERNS"
            for pattern in "${PATTERN_ARRAY[@]:0:3}"; do
                pattern=$(echo "$pattern" | xargs)  # trim whitespace
                [ -z "$pattern" ] && continue
                slug=$(slugify "${pattern:0:50}")
                kf_name="$DATE-$slug.md"
                kf_path="$KNOWLEDGE_DIR/$kf_name"

                # Only create if doesn't already exist
                if [ ! -f "$kf_path" ]; then
                    {
                        echo "---"
                        echo "created: $DATE"
                        echo "source_episode: $ep_name"
                        echo "confidence: 0.6"
                        echo "access_count: 0"
                        echo "last_accessed: $DATE"
                        echo "---"
                        echo ""
                        echo "# Pattern: $pattern"
                        echo ""
                        echo "Extracted from episode: $ep_name"
                        echo ""
                        echo "## Pattern"
                        echo "$pattern"
                        echo ""
                    } > "$kf_path"
                    log "  Created knowledge: $kf_name"
                    ((PATTERNS_ADDED++)) || true
                fi
            done
        fi

        # Handle confirmations
        if [ -n "$CONFIRMS" ] && [ "$CONFIRMS" != "NONE" ] && [ "$CONFIRMS" != "none" ]; then
            IFS=',' read -ra CONF_ARRAY <<< "$CONFIRMS"
            for conf in "${CONF_ARRAY[@]}"; do
                conf=$(echo "$conf" | xargs)
                [ -z "$conf" ] && continue
                # Try to find the file
                conf_file=$(find "$KNOWLEDGE_DIR" -name "*$conf*" 2>/dev/null | head -1 || true)
                if [ -n "$conf_file" ] && [ -f "$conf_file" ]; then
                    echo "" >> "$conf_file"
                    echo "CONFIRMED: $DATE by episode $ep_name" >> "$conf_file"
                    log "  Confirmed: $(basename "$conf_file")"
                    ((CONFIRMATIONS++)) || true
                fi
            done
        fi

        # Handle contradictions
        if [ -n "$CONTRADICTS" ] && [ "$CONTRADICTS" != "NONE" ] && [ "$CONTRADICTS" != "none" ]; then
            IFS=',' read -ra CONTRA_ARRAY <<< "$CONTRADICTS"
            for contra in "${CONTRA_ARRAY[@]}"; do
                contra=$(echo "$contra" | xargs)
                [ -z "$contra" ] && continue
                contra_file=$(find "$KNOWLEDGE_DIR" -name "*$contra*" 2>/dev/null | head -1 || true)
                if [ -n "$contra_file" ] && [ -f "$contra_file" ]; then
                    echo "" >> "$contra_file"
                    echo "CONTRADICTION: $DATE — episode $ep_name contradicts this entry. Review needed." >> "$contra_file"
                    log "  Contradiction flagged in: $(basename "$contra_file")"
                    ((CONTRADICTIONS++)) || true
                fi
            done
        fi

        # Write error files
        if [ -n "$ERRORS_OUT" ] && [ "$ERRORS_OUT" != "NONE" ] && [ "$ERRORS_OUT" != "none" ]; then
            slug=$(slugify "${ERRORS_OUT:0:50}")
            err_file="$ERRORS_DIR/$DATE-$slug.md"
            if [ ! -f "$err_file" ]; then
                {
                    echo "---"
                    echo "date: $DATE"
                    echo "source_episode: $ep_name"
                    echo "---"
                    echo ""
                    echo "# Error: $ERRORS_OUT"
                    echo ""
                    echo "Source: $ep_name"
                    echo ""
                    echo "## Description"
                    echo "$ERRORS_OUT"
                    echo ""
                } > "$err_file"
                log "  Created error: $(basename "$err_file")"
                ((ERRORS_ADDED++)) || true
            fi
        fi

        # Write success files
        if [ -n "$SUCCESSES_OUT" ] && [ "$SUCCESSES_OUT" != "NONE" ] && [ "$SUCCESSES_OUT" != "none" ]; then
            slug=$(slugify "${SUCCESSES_OUT:0:50}")
            succ_file="$SUCCESSES_DIR/$DATE-$slug.md"
            if [ ! -f "$succ_file" ]; then
                {
                    echo "---"
                    echo "date: $DATE"
                    echo "source_episode: $ep_name"
                    echo "---"
                    echo ""
                    echo "# Success: $SUCCESSES_OUT"
                    echo ""
                    echo "Source: $ep_name"
                    echo ""
                    echo "## Description"
                    echo "$SUCCESSES_OUT"
                    echo ""
                } > "$succ_file"
                log "  Created success: $(basename "$succ_file")"
                ((SUCCESSES_ADDED++)) || true
            fi
        fi

    else
        # No Muse — just log that we processed this episode structurally
        log "  No Muse synthesis for $ep_name (structural processing only)"
    fi

    log "  Done: $ep_name"
done

# ── 5. Compress old episodes ─────────────────────────────────────────────────

log "Checking for old episodes to compress..."

COMPRESSED=0
SUMMARIZED=0

# Episodes older than 90 days → one-paragraph summary (if Muse available)
while IFS= read -r -d '' old_ep; do
    ep_date=$(basename "$old_ep" | cut -d'-' -f1-3)
    ep_content=$(cat "$old_ep")
    ep_lines=$(wc -l < "$old_ep")

    # Only compress if file has more than 20 lines (already compressed ones are short)
    if [ "$ep_lines" -lt 20 ]; then
        continue
    fi

    if [ "$USE_MUSE" = true ]; then
        COMP_PROMPT=$(mktemp)
        printf "Summarize this AI memory episode in one paragraph (max 100 words). Keep key facts only:\n\n%s" "$ep_content" > "$COMP_PROMPT"
        summary=$(muse_run "$OLLAMA_MODEL" "$COMP_PROMPT" 60) || summary="(compression failed)"
        rm -f "$COMP_PROMPT"
    else
        summary="(Muse unavailable — compressed at $TIMESTAMP. Original had $ep_lines lines.)"
    fi

    # Rewrite file with frontmatter + summary only
    original_frontmatter=$(echo "$ep_content" | awk '/^---/{count++; if(count==2){exit}} {print}')
    {
        echo "$original_frontmatter"
        echo "---"
        echo ""
        echo "# Summary (compressed $DATE — original was $ep_lines lines)"
        echo ""
        echo "$summary"
        echo ""
        echo "*(Original content compressed to reduce storage. Key patterns extracted to knowledge/.)*"
    } > "$old_ep"
    log "  Compressed (90d): $(basename "$old_ep")"
    ((COMPRESSED++)) || true

done < <(find "$EPISODES_DIR" -name "*.md" -mtime +90 -print0 2>/dev/null)

# Episodes older than 30 days → key decisions + lessons only
while IFS= read -r -d '' old_ep; do
    ep_lines=$(wc -l < "$old_ep")
    if [ "$ep_lines" -lt 30 ]; then
        continue
    fi

    ep_content=$(cat "$old_ep")

    if [ "$USE_MUSE" = true ]; then
        COMP_PROMPT=$(mktemp)
        printf "Extract ONLY key decisions and lessons from this AI memory episode (max 150 words, bullet points):\n\n%s" "$ep_content" > "$COMP_PROMPT"
        summary=$(muse_run "$OLLAMA_MODEL" "$COMP_PROMPT" 60) || summary="(compression failed)"
        rm -f "$COMP_PROMPT"
    else
        summary="(Muse unavailable — summarized at $TIMESTAMP)"
    fi

    original_frontmatter=$(echo "$ep_content" | awk '/^---/{count++; if(count==2){exit}} {print}')
    {
        echo "$original_frontmatter"
        echo "---"
        echo ""
        echo "# Key Decisions & Lessons (compressed $DATE — original was $ep_lines lines)"
        echo ""
        echo "$summary"
        echo ""
        echo "*(Compressed at 30-day threshold. Full content archived in git history.)*"
    } > "$old_ep"
    log "  Summarized (30d): $(basename "$old_ep")"
    ((SUMMARIZED++)) || true

done < <(find "$EPISODES_DIR" -name "*.md" -mtime +30 -mtime -90 -print0 2>/dev/null)

# ── 6. Knowledge decay ──────────────────────────────────────────────────────

log "Applying knowledge decay..."
DECAYED=0

for kf in "$KNOWLEDGE_DIR"/*.md; do
    [ -f "$kf" ] || continue

    last_accessed=$(grep "^last_accessed:" "$kf" 2>/dev/null | head -1 | sed 's/last_accessed: *//' | tr -d '\r' || echo "")
    access_count=$(grep "^access_count:" "$kf" 2>/dev/null | head -1 | sed 's/access_count: *//' | tr -d '\r' || echo "0")
    confidence=$(grep "^confidence:" "$kf" 2>/dev/null | head -1 | sed 's/confidence: *//' | tr -d '\r' || echo "0.5")

    if [ -z "$last_accessed" ]; then
        continue
    fi

    # Calculate days since last access (macOS compatible)
    last_ts=$(date -j -f "%Y-%m-%d" "$last_accessed" "+%s" 2>/dev/null || echo "0")
    now_ts=$(date +%s)
    days_old=$(( (now_ts - last_ts) / 86400 ))

    if [ "$days_old" -gt 60 ] && [ "${access_count:-0}" -lt 3 ]; then
        # Reduce confidence by 0.1, minimum 0.1
        new_conf=$(echo "$confidence - 0.1" | bc 2>/dev/null || echo "0.1")
        # Clamp to minimum 0.1
        if [ "$(echo "$new_conf < 0.1" | bc 2>/dev/null || echo 1)" -eq 1 ]; then
            new_conf="0.1"
        fi
        sed -i '' "s/^confidence: .*/confidence: $new_conf/" "$kf" 2>/dev/null || true
        log "  Decayed: $(basename "$kf") confidence $confidence → $new_conf (${days_old}d old, ${access_count} accesses)"
        ((DECAYED++)) || true
    fi
done

# ── 7. Write consolidation log summary ─────────────────────────────────────

{
    echo ""
    echo "## Summary"
    echo ""
    echo "| Metric | Count |"
    echo "|--------|-------|"
    echo "| Episodes processed | $EPISODE_COUNT |"
    echo "| New knowledge patterns | $PATTERNS_ADDED |"
    echo "| Confirmations | $CONFIRMATIONS |"
    echo "| Contradictions flagged | $CONTRADICTIONS |"
    echo "| Errors recorded | $ERRORS_ADDED |"
    echo "| Successes recorded | $SUCCESSES_ADDED |"
    echo "| Episodes skipped | $SKIPPED |"
    echo "| Episodes compressed (90d) | $COMPRESSED |"
    echo "| Episodes summarized (30d) | $SUMMARIZED |"
    echo "| Knowledge entries decayed | $DECAYED |"
    echo "| Muse used | $USE_MUSE |"
    echo ""
    echo "---"
    echo "*Consolidation complete at $(date '+%Y-%m-%d %H:%M:%S')*"
} >> "$LOG_FILE"

log "=== Midnight Consolidation Complete ==="
log "Patterns: $PATTERNS_ADDED | Errors: $ERRORS_ADDED | Successes: $SUCCESSES_ADDED | Decayed: $DECAYED"
