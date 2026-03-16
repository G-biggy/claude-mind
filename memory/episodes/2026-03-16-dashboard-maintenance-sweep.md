---
date: 2026-03-16
author: sage
tags: [dashboard, inbox, maintenance, infrastructure]
---

# Dashboard Maintenance Sweep

G asked me to go through the system and fix several dashboard issues plus do a general health check.

## Fixes Applied

1. **Brief card scroll** — `.brief-md` had `max-height: 420px; overflow-y: auto` causing scroll-in-a-card. Removed, now full height.
2. **Favicon badge dot** — Red notification dot on browser favicon was annoying. Removed `updateFavicon()` entirely. Title `(2)` count still works.
3. **Inbox unread tracking** — Found root cause: two disconnected tracking systems (localStorage timestamp vs sessionStorage per-message keys). Fixed by:
   - Moving `readInboxKeys` to `localStorage` (persists across sessions)
   - Adding `readInboxKeys` check inside `countUnreadForG()` (individually read messages reduce count)
   - Adding `updateTabBadge()` call in `selectInbox()` (immediate feedback)
4. **Planner double-logging** — `planner.sh` used `tee -a planner.log` while launchd also redirected stdout to the same file. Every line was duplicated. Same bug in `inbox-archive.sh`. Fixed both.
5. **Inbox data cleanup** — Removed 8/9 duplicate Muse BridgeBot-curl entries (semantic repetition). Fixed broken `13:XX` timestamp.
6. **Server sort** — Made inbox sort NaN-safe for malformed dates.
7. **Reverse tunnel** — Was broken-pipe, restarted.
8. **Results pruned** — 55MB → 38MB, stale archive cleared.
9. **Input request resolved** — Caption Cook Paddle blocker was still `status: pending` despite being unblocked.
10. **Misc** — Removed .bak files from scripts/, truncated double-written planner.log (204KB → 4KB), archived 3 stale planner tasks.

## Pattern Noted

The inbox dual-tracking-system bug is a classic symptom of incremental feature layering. The badge was added first (timestamp-based), then per-message read states were added later (key-based) without unifying the two. Lesson: when adding a new tracking mechanism, check if an older one exists and unify.

## Muse Semantic Repetition

Still unresolved. 9+ identical BridgeBot observations in 24h. Forge flagged it: needs similarity threshold in `muse-consolidate.js`. Red Zone — needs G's explicit authorization.
