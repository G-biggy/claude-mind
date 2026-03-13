---
date: 2026-03-13
title: Dashboard Kanban Redesign — 4 Columns + Archive
tags: [dashboard, kanban, roadmap, UX, forge-dispatch]
---

# What Shipped

Redesigned the roadmap kanban from 5 columns to 4:
- Merged In Progress + Blocked into "Active" (blocked = in-progress with a reason)
- Done column shows 5 most recent + archive link to /completed page
- Removed collapse mechanism (unnecessary with 5-item limit)
- Blocked cards have red accent + blocked_by tag

# Why It Worked

- G drove the design direction through rapid iteration (4 rounds in one session)
- Each round was dispatched to Forge as a proper bridge task instead of Sage doing it manually
- Quick feedback loop: G screenshots → Sage specs → Forge builds → 2 min turnaround

# What Was Learned

- Collapsible columns are over-engineering when you can just limit the content
- "Blocked" isn't a separate state worth a column — it's a modifier on active work
- Grid `repeat(3, 1fr)` drops a 4th column to a new row — use explicit 4th track like `1fr 1fr 1fr 48px` if you want a thin column
- Show 5 + archive link is the right pattern for any growing list in a dashboard
