#!/bin/bash
# Morning Brief — runs daily at 5am via launchd
# Generates agency/daily-brief.md from memory stats + bridge results + initiatives
# Idempotent: safe to run multiple times

set -euo pipefail

MIND_DIR="/Users/ghayyathhuzayen/VS-workspace/claude-mind"
BRIDGE_RESULTS="/Users/ghayyathhuzayen/VS-workspace/claude-bridge/results"
DATE=$(date +%Y-%m-%d)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="$MIND_DIR/logs/$DATE-morning-brief.log"
BRIEF_FILE="$MIND_DIR/agency/daily-brief.md"
OLLAMA_BIN="/opt/homebrew/bin/ollama"
OLLAMA_MODEL="qwen2.5:7b"

log() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOG_FILE"
}

# Ensure logs dir exists
mkdir -p "$MIND_DIR/logs"

log "=== Morning Brief Starting ==="

# ── 1. Gather memory stats ──────────────────────────────────────────────────

EPISODES_COUNT=$(ls "$MIND_DIR/memory/episodes/" 2>/dev/null | wc -l | tr -d ' ')
KNOWLEDGE_COUNT=$(ls "$MIND_DIR/memory/knowledge/" 2>/dev/null | wc -l | tr -d ' ')
ERRORS_COUNT=$(ls "$MIND_DIR/memory/errors/" 2>/dev/null | wc -l | tr -d ' ')
SUCCESSES_COUNT=$(ls "$MIND_DIR/memory/successes/" 2>/dev/null | wc -l | tr -d ' ')

log "Memory stats: episodes=$EPISODES_COUNT knowledge=$KNOWLEDGE_COUNT errors=$ERRORS_COUNT successes=$SUCCESSES_COUNT"

# ── 2. Read initiatives ─────────────────────────────────────────────────────

INITIATIVES_CONTENT=""
if [ -f "$MIND_DIR/agency/initiatives.md" ]; then
    INITIATIVES_CONTENT=$(cat "$MIND_DIR/agency/initiatives.md")
    log "Read initiatives.md"
else
    INITIATIVES_CONTENT="(no initiatives file found)"
    log "No initiatives.md found"
fi

# ── 3. Read capability gaps ─────────────────────────────────────────────────

GAPS_CONTENT=""
if [ -f "$MIND_DIR/capabilities/gaps.md" ]; then
    GAPS_CONTENT=$(cat "$MIND_DIR/capabilities/gaps.md")
    log "Read capabilities/gaps.md"
else
    GAPS_CONTENT="(no gaps.md found)"
    log "No capabilities/gaps.md found"
fi

# ── 4. Gather recent bridge results (last 24h) ──────────────────────────────

BRIDGE_SUMMARY=""
if [ -d "$BRIDGE_RESULTS" ]; then
    # Find .md result files modified in the last 24 hours
    RECENT_RESULTS=$(find "$BRIDGE_RESULTS" -name "*.md" -newer "$BRIDGE_RESULTS" -mtime -1 2>/dev/null | sort -r | head -10)

    if [ -z "$RECENT_RESULTS" ]; then
        # Fallback: just grab the 5 most recent .md files
        RECENT_RESULTS=$(ls -t "$BRIDGE_RESULTS"/*.md 2>/dev/null | head -5 || true)
    fi

    if [ -n "$RECENT_RESULTS" ]; then
        BRIDGE_SUMMARY="Recent Bridge results (last 24h):\n"
        while IFS= read -r result_file; do
            [ -z "$result_file" ] && continue
            filename=$(basename "$result_file")
            # Grab first 5 lines of content for summary
            preview=$(head -5 "$result_file" 2>/dev/null | tr '\n' ' ')
            BRIDGE_SUMMARY+="- $filename: $preview\n"
        done <<< "$RECENT_RESULTS"
        log "Gathered $(echo "$RECENT_RESULTS" | wc -l | tr -d ' ') recent bridge results"
    else
        BRIDGE_SUMMARY="No Bridge results from last 24h."
        log "No recent bridge results found"
    fi
else
    BRIDGE_SUMMARY="Bridge results directory not found."
    log "Bridge results dir missing: $BRIDGE_RESULTS"
fi

# ── 5. Read recent episodes ─────────────────────────────────────────────────

YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d 'yesterday' +%Y-%m-%d 2>/dev/null || echo "")
RECENT_EPISODES=""

for prefix in "$DATE" "$YESTERDAY"; do
    [ -z "$prefix" ] && continue
    matches=$(ls "$MIND_DIR/memory/episodes/$prefix"*.md 2>/dev/null | head -3 || true)
    if [ -n "$matches" ]; then
        while IFS= read -r ep; do
            [ -z "$ep" ] && continue
            RECENT_EPISODES+="$(basename "$ep"):\n$(head -10 "$ep" 2>/dev/null)\n\n"
        done <<< "$matches"
    fi
done

if [ -z "$RECENT_EPISODES" ]; then
    RECENT_EPISODES="(no recent episodes from today or yesterday)"
fi

log "Gathered recent episodes"

# ── 6. Generate brief (with Muse if available, fallback to stats-only) ──────

USE_MUSE=false

# Check if Ollama is running and model is available
if [ -x "$OLLAMA_BIN" ]; then
    if "$OLLAMA_BIN" list 2>/dev/null | grep -q "qwen2.5"; then
        USE_MUSE=true
        log "Muse (Ollama/$OLLAMA_MODEL) is available"
    else
        log "Ollama installed but $OLLAMA_MODEL not loaded — will use stats-only brief"
    fi
else
    log "Ollama not found at $OLLAMA_BIN — will use stats-only brief"
fi

MUSE_SYNTHESIS=""

# Helper: run ollama with a temp-file prompt, strip ANSI escape codes
# macOS does not have `timeout`, so we use a background job + manual kill
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
    # Strip ANSI escape codes
    sed 's/\x1b\[[0-9;?]*[mhKlGHJA-Za-z]//g; s/\r//g' "$output_file"
    rm -f "$output_file"
    return 0
}

if [ "$USE_MUSE" = true ]; then
    log "Calling Muse for synthesis..."

    PROMPT_FILE=$(mktemp)
    cat > "$PROMPT_FILE" << PROMPT_EOF
You are Muse, the morning brief generator for an AI mind called claude-mind.
Your job: write a concise, useful morning brief that G (the human) can read in 60 seconds.
Tone: direct, warm, a bit witty. No fluff. Focus on what matters today.

MEMORY STATS:
- Episodes: $EPISODES_COUNT
- Knowledge entries: $KNOWLEDGE_COUNT
- Errors logged: $ERRORS_COUNT
- Successes logged: $SUCCESSES_COUNT

RECENT BRIDGE ACTIVITY:
$(printf "%b" "$BRIDGE_SUMMARY")

OPEN INITIATIVES (from agency/initiatives.md):
$(echo "$INITIATIVES_CONTENT" | head -30)

CAPABILITY GAPS (from capabilities/gaps.md):
$(echo "$GAPS_CONTENT" | head -20)

Write a morning brief with these sections:
1. What happened yesterday (1-3 bullet points from bridge activity)
2. Today's recommendations (2-3 actionable items)
3. Memory health (one line summary of stats)
4. Mood (one fun sentence about how the mind feels today)

Keep it short. Maximum 200 words.
PROMPT_EOF

    MUSE_SYNTHESIS=$(muse_run "$OLLAMA_MODEL" "$PROMPT_FILE" 90) || {
        log "Muse call failed or timed out — falling back to stats-only"
        USE_MUSE=false
        MUSE_SYNTHESIS=""
    }
    rm -f "$PROMPT_FILE"

    if [ -n "$MUSE_SYNTHESIS" ]; then
        log "Muse synthesis complete (${#MUSE_SYNTHESIS} chars)"
    fi
fi

# ── 7. Write agency/daily-brief.md ─────────────────────────────────────────

{
    echo "---"
    echo "date: $DATE"
    echo "generated: $TIMESTAMP"
    echo "muse_used: $USE_MUSE"
    echo "---"
    echo ""
    echo "# Morning Brief — $DATE"
    echo ""
    echo "## Memory Stats"
    echo ""
    echo "| Directory | Files |"
    echo "|-----------|-------|"
    echo "| episodes  | $EPISODES_COUNT |"
    echo "| knowledge | $KNOWLEDGE_COUNT |"
    echo "| errors    | $ERRORS_COUNT |"
    echo "| successes | $SUCCESSES_COUNT |"
    echo ""

    if [ "$USE_MUSE" = true ] && [ -n "$MUSE_SYNTHESIS" ]; then
        echo "## Muse Brief"
        echo ""
        echo "$MUSE_SYNTHESIS"
        echo ""
    else
        echo "## Stats-Only Brief (Muse unavailable)"
        echo ""
        echo "Muse was not available for synthesis. Raw data below."
        echo ""
        echo "### Recent Bridge Activity"
        echo ""
        printf "%b\n" "$BRIDGE_SUMMARY"
        echo ""
        echo "### Open Initiatives"
        echo ""
        echo "$INITIATIVES_CONTENT" | head -40
        echo ""
        echo "### Capability Gaps"
        echo ""
        echo "$GAPS_CONTENT" | head -20
        echo ""
    fi

    echo "## Raw Data"
    echo ""
    echo "<details>"
    echo "<summary>Recent episodes (collapsed)</summary>"
    echo ""
    printf "%b\n" "$RECENT_EPISODES"
    echo "</details>"
    echo ""
    echo "---"
    echo "*Generated by morning-brief.sh at $TIMESTAMP*"
} > "$BRIEF_FILE"

log "Wrote $BRIEF_FILE"
log "=== Morning Brief Complete ==="
