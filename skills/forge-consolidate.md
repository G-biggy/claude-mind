---
name: forge-consolidate
description: >-
  End-of-conversation memory consolidation for Forge chat sessions.
  Use when G says "consolidate", "sync memory", "wrap up", or before ending
  a significant conversation where decisions were made or things were built.
---

# Forge Consolidation Skill (Chat Sessions)

Two phases. Always run both.

---

## Phase 1 — Write what happened

### Episode (always)
```
/Users/ghayyathhuzayen/VS-workspace/claude-mind/memory/episodes/YYYY-MM-DD-[short-slug].md

---
date: YYYY-MM-DD
title: [What was discussed or built]
updated_by: forge
tags: [relevant, tags]
---

## What Happened
## Decisions Made
## Files Created or Modified
## Open Questions
```

### Success (if something worked or shipped)
```
memory/successes/YYYY-MM-DD-[what-won].md
```

### Error (if something failed)
```
memory/errors/YYYY-MM-DD-[what-failed].md

## What Failed
## Root Cause
## Fix Applied
## Lesson
```

### Knowledge (if something reusable was learned)
Append to existing file or create: `memory/knowledge/[topic].md`
Never overwrite — append only.

---

## Phase 2 — Run Muse

```bash
cd /Users/ghayyathhuzayen/VS-workspace/claude-bridge && node scripts/muse-consolidate.js
```

Confirm:
```bash
cat /Users/ghayyathhuzayen/VS-workspace/claude-mind/memory/working/context.md
```

---

## Note

For dispatched tasks (via claude-bridge), Phase 1 is baked into CLAUDE.md —
you do it automatically before finishing. This skill is for explicit chat sessions
where G says "consolidate" to wrap up.
