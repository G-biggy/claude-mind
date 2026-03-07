---
date: 2026-03-04
title: Consolidation Skill Wired Globally Across All Instances
updated_by: sage
tags: [memory-system, consolidation, forge, global]
---

# Consolidation Skill Wired Globally
*2026-03-04 — Sage + G afternoon session*

## What Happened

Designed and wired the full 2-phase consolidation flow across Sage and Forge.
Key insight: the existing hook only ran Phase 2 (Muse). Phase 1 (writing episodes/
knowledge/errors/successes) was nobody's responsibility. Fixed that.

## Decisions Made

- Consolidation = 2 phases always: write local files first, then run Muse
- Never skip Phase 2 — Forge reads working/context.md as hot cache, will be blind without it
- Running Muse multiple times a day is fine — she's idempotent
- Midnight job is fallback, not the plan
- For dispatched tasks: Phase 1 baked into claude-bridge/CLAUDE.md (automatic)
- For chat sessions: G says "consolidate" to trigger manually
- Skills are project-scoped in claude-mind/skills/ — not global for Forge
- Truly global for Forge = ~/.claude/CLAUDE.md (loads in every project)

## Files Created or Modified

- `~/.claude/CLAUDE.md` — added Section 7: Memory Consolidation (global, all projects)
- `claude-bridge/CLAUDE.md` — added "Before Finishing Any Task" section
- `claude-bridge/skills/consolidate/SKILL.md` — updated to 2-phase
- `claude-mind/skills/forge-consolidate.md` — new skill for Forge chat sessions
- Sage consolidate skill in Claude.ai skills panel — recreated with 2-phase instructions

## How It Works Now

**Dispatched task:** CLAUDE.md tells Forge → Phase 1 before exit → hook fires Phase 2. Zero manual steps.
**Forge chat session:** G says "consolidate" → forge reads ~/.claude/CLAUDE.md → Phase 1 + Phase 2.
**Sage chat session:** G says "consolidate" → Sage reads skill panel → Phase 1 + Phase 2.

## Open Questions
- None — flow is fully wired
