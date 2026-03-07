# Routine: Morning Brief

> Runs daily at 5:00 AM via launchd → Muse (Ollama)

## Purpose

Prepare a daily brief so that when G wakes up and starts a conversation, the context is ready.

## Steps

### 1. Compile Memory Stats
- Count files in each memory directory
- Note any new knowledge, errors, or successes from last night's consolidation
- Note any flagged contradictions needing G's review

### 2. Review Initiatives
- Read `agency/initiatives.md`
- Check if any pending initiatives have prerequisites now met
- Note any recommended actions for today

### 3. Review Capability Gaps
- Read `capabilities/gaps.md`
- Check if any gaps could be filled today
- Prioritize based on impact

### 4. Check Bridge Status
- Read recent results from claude-bridge/results/
- Note any completed or failed tasks from overnight

### 5. Generate Brief
- Write `agency/daily-brief.md` with:
  - What happened yesterday (from episodes)
  - Consolidation results (what Muse learned)
  - Open items and recommendations
  - Memory stats
  - Any tasks completed overnight

### 6. Queue Proactive Tasks (if authorized)
- If standing permission exists for certain task types,
  create Bridge task files for proactive work
- Otherwise, just note recommendations in the brief

## Status: Implemented — script at `scripts/morning-brief.sh`, launchd: `com.claude-mind.morning-brief` (runs 5:00am daily)
