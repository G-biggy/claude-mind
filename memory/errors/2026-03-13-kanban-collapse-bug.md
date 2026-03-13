---
date: 2026-03-13
title: Kanban Collapse Bug — Grid Column Drop
tags: [CSS, grid, dashboard, kanban]
---

# What Happened

Done column was set to collapsible. When collapsed, the CSS changed from `repeat(4, 1fr)` to `repeat(3, 1fr)`, which completely removed the 4th grid track. The Done column had nowhere to go and wrapped to a new row below the kanban.

# Root Cause

CSS Grid doesn't collapse columns — if you reduce the column count, extra items overflow or wrap. The collapse should have used a fixed narrow width like `1fr 1fr 1fr 48px` instead of dropping the column entirely.

# Fix Applied

Changed to `grid-template-columns: 1fr 1fr 1fr 48px` for collapsed state with vertical text. But ultimately removed the collapse entirely because limiting Done to 5 items + archive link made collapsing pointless.

# Lesson

Don't solve UI overflow with hide/show mechanics when you can just limit the content. "Show 5 + link to full list" beats collapsible columns every time for growing lists.
