---
date: 2026-03-07
title: Evaluated Desktop Scheduled Tasks — decided to keep launchd
updated_by: sage
tags: [bridge, infrastructure, decision, scheduled-tasks]
---

# Evaluated Desktop Scheduled Tasks — Decided to Keep launchd

## What Happened
G shared a plan (likely drafted by Forge) to migrate planner.sh and inbox-watcher.sh from macOS launchd to Claude Desktop Scheduled Tasks (Cowork). Sage researched the feature thoroughly and gave an honest assessment.

## Decisions Made
- **Keep launchd plists for planner and inbox-watcher.** The current bash scripts are battle-tested, zero-token cost, and more deterministic than prompt-based scheduling. Desktop Scheduled Tasks require the Claude Desktop app to be open AND the Mac awake — same constraint as launchd but heavier (each run burns a full Claude Code session).
- **No migration needed.** The plan's "high value" rating was downgraded to medium. The real benefits (richer prompts, cross-platform, visible via MCP list) don't outweigh the costs (token burn of ~60 sessions/day, non-deterministic gating logic, GUI dependency).
- **Morning brief already covered.** The one genuinely new capability (morning briefing task) is already handled by the Mind Dashboard at localhost:7777.
- **watch-task deferred.** The /loop-based task watching concept is valid but belongs as a Forge skill, not a Sage skill. Deferred.

## Key Analysis Points
- Desktop Scheduled Tasks = a prompt that runs on a schedule, each run is a full Claude session
- planner.sh has ~100 lines of smart gating (time-of-day, activity detection, pending task dedup) that would need to be replicated in a prompt
- inbox-watcher.sh does sender/recipient parsing that's more reliable as bash than as LLM reasoning
- The plan correctly identified launchd as invisible/hard to manage, but the replacement introduces worse tradeoffs for our use case

## Open Questions for G
- None — clean decision, both sides agreed.
