---
date: 2026-03-06
task: build-planner-daemon
outcome: success
---

# Episode: Planner Daemon Build

Built the autonomous planner daemon — the brain loop that makes the Stooges independent.

## What Was Built

- `scripts/planner.sh`: Bash script that runs every 2 hours via launchd.
  - Time-aware: knows Amman time (UTC+3), only runs freely during night shift (00:00-07:59, 22:00-23:59)
  - Day hours: runs only if no G activity in last 2 hours
  - Active-G detection: backs off if tasks created in last 30 minutes
  - Queue check: skips if pending/in-progress tasks already exist
  - Creates `planner-YYYYMMDD-HHMM.md` task files for Forge to execute

- `~/Library/LaunchAgents/com.claude-bridge.planner.plist`: Launchd agent
  - StartInterval: 7200 (2 hours)
  - RunAtLoad: false (doesn't fire on load)
  - Logs to `planner.log` and `planner.error.log`

## Gmail Gap

Gmail MCP not available in Claude Code CLI. Available MCPs: Supabase, Stripe, Vercel, Figma, Stitch, Docker. Planner will work with filesystem + inbox until Gmail is added.

## Test Result

First manual run correctly detected this build task as recent G activity and backed off. Active-G detection working as designed.

## Key Patterns
- Using `TZ="Asia/Amman"` for timezone-correct hour checks
- Using `stat -f%m` for macOS mtime (different from Linux `stat -c%Y`)
- `/tmp/planner-2h-marker` as lightweight state file for day-hours throttling
