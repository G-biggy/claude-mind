---
type: episode
title: Boost mode activated - planner 30min interval no G-active backoff
date: '2026-03-14'
tags: []
source: sage
---

# Boost mode activated - planner 30min interval no G-active backoff

Anthropic announced doubled usage limits outside peak hours for 2 weeks. G decided to leverage this by removing the planner G-is-active backoff and cranking the interval to 30 minutes so Forge can work alongside G without backing off.

Changes made:
- planner.sh: Added BOOST_MODE detection (expires 2026-03-28), skips day-hours and G-active checks in boost mode, passes --boost to check-usage.sh
- check-usage.sh: Accepts --boost flag with relaxed thresholds (session <90%, >15min, weekly <95%)
- launchd plist: StartInterval 7200 to 1800 (30min)
- Daemon restarted via bootout/bootstrap
- Backups saved as .bak-20260314