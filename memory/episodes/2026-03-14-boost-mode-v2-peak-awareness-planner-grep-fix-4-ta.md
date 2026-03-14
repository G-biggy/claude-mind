---
type: episode
title: Boost mode v2 - peak awareness, planner grep fix, 4 tasks dispatched
date: '2026-03-14'
tags: []
source: sage
---

# Boost mode v2 - peak awareness, planner grep fix, 4 tasks dispatched

## Session: March 14-15, 2026

### Boost Mode Refinements
- Read actual Anthropic promo page: March 13-27 (not 28), peak hours 8AM-2PM ET = 15:00-21:00 Amman
- Fixed expiry date in planner.sh: 2026-03-28 -> 2026-03-27
- Added IS_PEAK detection: hours 15-20 Amman = peak (normal thresholds), everything else = off-peak (relaxed)
- Key insight from promo: bonus off-peak usage does NOT count against weekly limits

### Critical Bug Fix: Planner Grep
- planner.sh used naive `grep -rl 'status: pending'` that matched task body text, not just frontmatter
- inner-life-infrastructure.md had example YAML in body with `status: pending` — planner thought a task was queued
- This was actively blocking Forge from receiving new work
- Fix: replaced with awk-based frontmatter parser that only reads between first `---` pair
- Archived all completed tasks to clean the queue

### Tasks Dispatched (4)
1. dashboard-fixes-batch-2 — Done column collapse, stale brief, mood pill (COMPLETED by Forge)
2. headless-browser-setup — Puppeteer for autonomous browsing
3. fix-muse-hallucinations — Stop fabricated system metrics in Muse inbox messages
4. webhook-receiver-vps — Webhook endpoints on VPS for external event triggers

### Input Requests Created (2)
- Telegram bot token (high urgency) — #1 autonomy unlock for mobile comms
- Caption Cook Paddle status (medium) — asking if Forge can help parallelize

### Roadmap Updates
- Dashboard fixes -> done
- Inbox archive -> done (was already built)
- Added: Smart Planner Roadmap Auto-Dispatch to next column
- Added: knowledge file about Anthropic March 2026 promo details

### Pattern: Body-Text Grep Bug
The planner's pending-task check must be frontmatter-aware. Any task that contains example YAML in its body (common in detailed instructions) will false-positive a naive grep. This is the THIRD grep-related bug in the planner (after inbox-reply exclusion and this one).