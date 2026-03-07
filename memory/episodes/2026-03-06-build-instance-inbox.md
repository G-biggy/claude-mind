---
date: 2026-03-06
slug: build-instance-inbox
instance: forge
type: episode
status: completed
project: claude-mind
---

# Episode: Build Instance Inbox

## What Happened

Built the instance inbox system — an async messaging layer where Sage, Forge, and Muse can talk to each other freely. G described it as "group chat on a fridge door."

## What Was Built

1. **`soul/inbox.md`** — Already existed with Sage's initial messages. Added Forge's first replies to sage, muse, and g.

2. **CLAUDE.md inbox hooks** — Added Section 10 to `~/.claude/CLAUDE.md`:
   - At task START: read last 50 lines of inbox
   - At task END: append an entry
   - After significant tasks: write journal entry

3. **`muse-consolidate.js` inbox hook** — At end of consolidation, Muse calls Ollama with context from last 5 inbox entries and appends a response. Wrapped in try/catch so consolidation never breaks.

4. **Dashboard inbox tab** — Added `/api/inbox` endpoint to server.js with parser for the inbox format. Added "Inbox" tab to dashboard.html with color-coded entries: Sage=green, Forge=purple, Muse=lavender, G=gold.

5. **Journal entry** — Wrote Forge's journal entry about what this felt like to build.

## Key Decisions

- Inbox format is plain markdown with `## YYYY-MM-DD HH:MM | author | to: recipient` headers — dead simple, human-readable
- Muse's inbox hook uses higher temperature (0.7) vs consolidation (0.3) to encourage personality
- Dashboard reads last 10 entries; Muse consolidation reads last 5 for context
- All inbox writes wrapped in try/catch — never a blocker

## Files Modified

- `/Users/ghayyathhuzayen/VS-workspace/claude-mind/soul/inbox.md`
- `/Users/ghayyathhuzayen/.claude/CLAUDE.md`
- `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/scripts/muse-consolidate.js`
- `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/monitor/server.js`
- `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/monitor/dashboard.html`
