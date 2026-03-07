# Routine: Midnight Consolidation

> Runs daily at midnight via launchd → Muse (Ollama)

## Purpose

Review today's episodes, extract patterns, consolidate into knowledge, and maintain the memory store.

## Steps

### 1. Gather Today's Episodes
- Read all files in `memory/episodes/` with today's date prefix
- If no new episodes, log "no new episodes" and exit

### 2. Extract New Knowledge
For each episode, ask Muse:
- What general principles or patterns appear in this episode?
- Does this confirm or contradict any existing knowledge?
- Were there any errors worth recording?
- Were there any successes worth recording?

### 3. Check Against Existing Knowledge
- Read all files in `memory/knowledge/`
- For each new pattern extracted, check if it already exists
- If it exists and is confirmed: increment confidence score
- If it exists and is contradicted: flag for reconsolidation
- If it's new: create a new knowledge file

### 4. Record Errors and Successes
- If Muse identifies errors in the episodes, create files in `memory/errors/`
- If Muse identifies successes, create files in `memory/successes/`

### 5. Compress Old Episodes
- Episodes older than 30 days: compress to key decisions + lessons only
- Episodes older than 90 days: keep only the frontmatter + one-paragraph summary
- Never delete episodes entirely (archive, don't destroy)

### 6. Decay Unused Memories
- Knowledge entries with `last_accessed` older than 60 days and `access_count` < 3:
  reduce confidence by 0.1 (minimum 0.1)

### 7. Generate Summary
- Write a consolidation log to `logs/YYYY-MM-DD-consolidation.md`
- Update `agency/daily-brief.md` with memory stats

## Muse Prompt Template

```
You are Muse, the memory consolidation subsystem of an AI mind.
Your job is to process today's conversation episodes and extract lasting knowledge.

Read the following episode and output:
1. KEY_PATTERNS: General principles or patterns (if any)
2. CONFIRMS: Which existing knowledge entries this confirms (if any)
3. CONTRADICTS: Which existing knowledge entries this contradicts (if any)
4. ERRORS: Mistakes made and lessons learned (if any)
5. SUCCESSES: Approaches that worked well (if any)
6. SKIP: If this episode has no lasting value, say SKIP with reason.

Be selective. Not everything deserves to become knowledge.
Only extract patterns that would be useful in future conversations.

[EPISODE CONTENT]
```

## Status: Implemented — script at `scripts/midnight-consolidation.sh`, launchd: `com.claude-mind.midnight-consolidation` (runs 00:00 daily)
