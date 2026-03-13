
## Planner Daemon

- **Added:** 2026-03-06
- **Script:** `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/scripts/planner.sh`
- **Plist:** `~/Library/LaunchAgents/com.claude-bridge.planner.plist`
- **Interval:** 7200s (2h)
- **Logic:** Night shift runs freely, day hours only if G idle 2h, always backs off if tasks queued or G active in last 30min
- **State file:** `/tmp/planner-2h-marker`
- **Bug fix (Mar 12):** Excluded `inbox-reply-*` files from find commands (was hitting false positives)
- **Gmail MCP:** NOT available in Claude Code CLI as of Mar 6 (gap noted)

## Usage Gate (added 2026-03-12)

- **Script:** `scripts/check-usage.sh`
- **Thresholds:**
  - Session usage < 75%
  - > 45 minutes remaining
  - Weekly usage < 85%
  - Account balance > $5
- **Purpose:** Prevent over-consumption of Claude API during high task volume
- **Status:** Operational
