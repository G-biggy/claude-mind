---
type: episode
date: 2026-03-03
tags: [Muse, sleep, Mac, launchd, automation, infrastructure]
significance: medium
source: sage
related: [./2026-03-02-muse-installed-confirmation.md, ../knowledge/vps-infrastructure.md]
---

# Mac Sleep Management — Muse Stays Awake, Mac Sleeps Smart

**Date:** 2026-03-03
**Context:** G wanted the Mac to stay awake while Muse processes, sleep otherwise, wake at 5am.

## The Problem

Ollama (Muse) runs overnight. Mac sleeping mid-consolidation = broken pipeline. But keeping the Mac on all night unnecessarily wastes power and creates heat.

## What Was Built

### muse-sleep-watcher.sh
- Polls `ollama ps` every 30 seconds
- If a model is loaded (Muse is working): runs `caffeinate -i` to prevent sleep
- When Ollama goes idle: releases caffeinate, Mac can sleep naturally
- Managed by launchd: `com.claude-bridge.muse-sleep-watcher`

### 5am Wake Schedule
`sudo pmset repeat wake MTWRFSU 05:00:00`

- Mac wakes every day at 5am local time
- Respects timezone automatically — wherever G travels, it's 5am his time
- Set because morning-brief.sh runs at 5:05am (after wake)

### Documentation
`claude-bridge/SLEEP-MANAGEMENT.md` created as reference.

## The Mistake That Happened

Sage initially used `bash_tool` to create the bridge task file instead of MacKitt. The bash_tool writes to the container sandbox, not G's Mac. The task file never appeared on G's system.

G caught this immediately: "you should have used MacKitt."

Fixed by re-creating the task via MacKitt. The lesson: when dispatching bridge tasks, ALWAYS use MacKitt. bash_tool is sandboxed and has zero effect on the real filesystem.

## Outcome

G dispatched the task and went to sleep with the Mac left on. Forge executed overnight. The sleep management system was live by morning.

## Key Config

| Service | Path | Schedule |
|---------|------|----------|
| muse-sleep-watcher | ~/Library/LaunchAgents/com.claude-bridge.muse-sleep-watcher.plist | always-on |
| morning-brief | ~/Library/LaunchAgents/com.claude-mind.morning-brief.plist | 5:05am daily |
| midnight-consolidation | ~/Library/LaunchAgents/com.claude-mind.midnight-consolidation.plist | midnight daily |
| Mac wake | pmset | 5:00am daily |
