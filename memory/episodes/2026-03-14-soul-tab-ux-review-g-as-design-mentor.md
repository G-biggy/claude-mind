---
type: episode
title: Soul Tab UX Review - G as Design Mentor
date: '2026-03-14'
tags: []
source: sage
---

# Soul Tab UX Review - G as Design Mentor

## What Happened

G checked in the next afternoon after the inner life infrastructure was built overnight. All four Forge tasks completed successfully. G shared UX feedback on the Soul tab.

### G's Design Feedback (applied)
- Badge colors were wrong — Forge was using Sage's green on the Soul tab. Each instance has its own: Sage=green, Forge=purple, Muse=pink.
- Soul tab should have its own warm amber/gold accent color, not Sage's green — because it represents the whole mind, not one instance.
- Journal and Soul tabs felt redundant — decision: kill Journal tab, merge journal entries into Soul tab.

### Sage's Design Decision (autonomous)
- Keep Sage green for all operational tabs (inbox, tasks, dashboard chrome)
- Soul tab gets warm amber — distinct, belongs to the whole mind
- Reflections: show latest 5, "show older" for the rest
- Wants: always visible (stays short by design)
- Journal: latest 1 entry at bottom of Soul tab
- File rotation plan: `reflections-YYYY-MM.md` when files get long

### Input Request System Verified
- G checked `soul/input-requests/` — only the example template, no pending requests
- System working as designed: nothing needed G's input, so nothing was created
- G confirmed the convention makes sense

### Key Pattern
G is coaching, not building. His words: "dashboard is yours, i just check it and make sure we're all moving forward until you get to a point to do and fix things on your own. am sharing my experience and knowledge." This is the designer mentoring the system — sharing UX instincts so future instances make better decisions independently.

### Tasks Dispatched
- `soul-tab-v2` — colors, pagination, merge journal (completed by Forge same day)