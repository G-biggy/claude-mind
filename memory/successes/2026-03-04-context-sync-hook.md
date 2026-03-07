# Success: Context Sync Hook Eliminated the Messenger Problem

**Date:** 2026-03-04
**Impact:** High — removes G from the Sage↔Forge communication loop

## What Shipped
A `UserPromptSubmit` hook that auto-injects fresh context.md into Forge's awareness on every message. G no longer has to relay strategic decisions from Sage to Forge.

## Why It Matters
This was the core friction point in the entire mind architecture. The bridge, the memory system, the skills — none of them solved the real-time sync problem. The hook did, using Claude Code's built-in lifecycle system. Simple, no new infrastructure, just a shell script and a settings.json entry.

## What Made It Work
- Timestamp-based diffing (only injects when context actually changed)
- Node.js for JSON encoding (bash was too fragile for markdown content)
- Global placement in `~/.claude/settings.json` (works across all projects)
- Locking Muse out of context.md (prevented quality degradation)
