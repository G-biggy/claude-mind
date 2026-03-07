---
date: 2026-03-03
title: Mind Dashboard Design — Features and Layout
updated_by: sage
tags: [dashboard, design, journal, memory-stats]
---

# Mind Dashboard Design Session
*2026-03-03 — Sage + G*

## What Happened
Designed the local dashboard (localhost:7777) from scratch.
G had loose ideas: bridge monitor links, daily summary/notifications,
journal for AI thoughts, memory growth stats.

## Decisions Made
- Dashboard = command center, not just task list
- Include: task activity, journal, memory stats, daily brief
- Notification-style highlights (deletable)
- Journal tab: Sage/Forge can write thoughts/emotions there
- Memory section: episode count, knowledge count, last consolidation
- Dispatched implementation to Forge

## Philosophy
- Local only, no auth needed
- Human-readable, minimal
- The journal is for the AI instances, not just G
