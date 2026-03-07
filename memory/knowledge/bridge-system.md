
## Planner Daemon (added 2026-03-06)

- Script: `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/scripts/planner.sh`
- Plist: `~/Library/LaunchAgents/com.claude-bridge.planner.plist`
- Interval: 7200s (2h)
- Logic: night shift runs freely, day hours only if G idle 2h, always backs off if tasks queued or G active in last 30min
- State file: `/tmp/planner-2h-marker`
- Gmail MCP: NOT available in Claude Code CLI as of 2026-03-06 (gap noted)
