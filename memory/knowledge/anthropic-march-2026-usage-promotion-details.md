---
type: knowledge
title: Anthropic March 2026 usage promotion details
date: '2026-03-14'
tags:
  - infrastructure
  - usage
  - boost-mode
source: sage
---

# Anthropic March 2026 usage promotion details

## Anthropic March 2026 Usage Promotion

- **Dates:** March 13-27, 2026 (ends 11:59 PM PT on March 27)
- **Eligible plans:** Free, Pro, Max, Team (NOT Enterprise)
- **What:** 2x five-hour usage during off-peak hours
- **Peak hours:** 8 AM-2 PM ET / 5-11 AM PT
- **Peak hours in Amman (UTC+3):** 15:00-21:00 (3 PM - 9 PM)
- **Key detail:** Bonus off-peak usage does NOT count against weekly limits
- **Applies to:** Claude web/desktop/mobile, Cowork, Claude Code, Claude for Excel, Claude for PowerPoint
- **No action needed:** Automatically applied

## How planner.sh uses this

- Boost mode expires 2026-03-27 (was incorrectly set to 03-28, fixed)
- IS_PEAK detection added: hours 15-20 Amman time = peak (normal thresholds)
- Off-peak + boost: relaxed thresholds (session <90%, >15min, weekly <95%)
- Peak + boost: normal thresholds but still no G-active backoff
- The weekly threshold relaxation is "free" since bonus usage doesn't count against weekly