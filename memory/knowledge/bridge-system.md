
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


## Dashboard Kanban (Updated 2026-03-13)

**Layout:** 4 columns — Backlog → Next Up → Active → Done
- "Active" merges in-progress + blocked items. Blocked cards have red left border + blocked_by tag.
- Done shows 5 most recent items + "N more →" archive link to `/completed` page.
- No collapse mechanism. Content limiting beats hide/show.
- Grid: `repeat(4, 1fr)`, responsive breakpoints at 900px (2-col) and 500px (1-col).
- Source: `agency/roadmap.md` parsed by `monitor/server.js` via `/api/roadmap`.

**Routes:**
- `/` — Dashboard (5 tabs: Home, Activity, Journal, Inbox, Roadmap)
- `/completed` — Full list of done items
- `/api/roadmap` — JSON: `{ done, active, next, backlog }`
- `/api/dashboard` — Aggregated dashboard data
- `/api/journal` — Journal entries
- `/run/<uuid>` — Task monitor page (VPS)

**Forge subagents (added 2026-03-13):**
- `~/.claude/agents/qa-reviewer.md` — Read-only code reviewer, spawned after feature builds
- Delegation rules in `~/.claude/CLAUDE.md` section 9
- Pattern: 3+ files across domains → parallel agents. After any build → qa-reviewer.
