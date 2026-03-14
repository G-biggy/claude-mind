---
date: 2026-03-14
slug: dashboard-soul-tab
task: dashboard-soul-tab
author: forge
---

# Dashboard Soul Tab

Built the Soul tab for localhost:7777.

## What I did

Added a new "Soul" tab to the claude-bridge dashboard — the fifth tab after Home, Activity, Journal, Inbox, Roadmap. It has a purple accent color (#c084fc) to distinguish it from the operational tabs.

### Components built
1. **Latest Journal Entry** — shows the most recent journal entry from soul/journal.md with author, mood, timestamp, and a "view full journal →" link
2. **Current Wants** — parses soul/wants.md active/fulfilled sections, renders wants as list items with purple arrows
3. **Recent Reflections** — parses soul/reflections.md, shows 5 most recent entries in cards

### API endpoints added to monitor/server.js
- `GET /api/reflections?limit=N` — returns latest N reflection entries parsed from reflections.md
- `GET /api/wants` — returns `{ active: [], fulfilled: [] }` parsed from wants.md

### Bugs fixed during build
- `---` separators in markdown were being parsed as want items (they become `--` after stripping leading dash). Fixed with `/^-+$/.test(trimmed)` filter.
- Initial `reverse()` for reflections gave wrong order because the file has newest-first structure. Fixed by sorting on header string descending instead.

## Verification
- Dashboard loads at localhost:7777 ✓
- Soul tab appears ✓
- 8 active wants displayed ✓
- 2 Muse edge note reflections + 1 Sage reflection shown ✓
- Existing tabs still work ✓
- Committed: a69cbdd
