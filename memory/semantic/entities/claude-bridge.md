---
type: entity
status: active
created: 2026-03-04
last_relevant: 2026-03-04
related_entities: [claude-mind, captioncook]
related_themes: [ai-agent-architecture]
---

# Claude Bridge

## What
The task orchestration daemon that enables Sage (Claude.ai) to dispatch tasks to Forge (Claude Code) for autonomous execution. The communication nervous system of the mind. Located at ~/VS-workspace/claude-bridge/.

## Timeline
- 2026-02-11: Conceived — flat-file approach chosen over VPS+DeepSeek
- 2026-02-11: Operational — basic task dispatch working
- 2026-02-14: Always-on gap discovered — CC must run on local Mac, not VPS
- 2026-02-16: Local daemon breakthrough — launchd watcher on Mac replaces VPS orchestration
- 2026-02-17: Monitor dashboard built — phase-level monitoring live
- 2026-02-17: Skills upload crisis — workaround discovered
- 2026-02-25: MacKitt MCP integrated for file operations
- 2026-03-04: Post-task consolidation hook being added (THIS TASK)

## Current Status
Fully operational. Monitor at bridge.ghayyath.com. launchd daemon running. Tasks flow: Sage writes MD → daemon detects → Forge executes → result written → notification sent.

## Architecture
- Tasks: markdown files with YAML frontmatter in tasks/
- Results: markdown files in results/
- Daemon: orchestrator/watcher.js (chokidar-based, Node.js)
- Monitor: web server at port 7777, deployed to VPS
- Notifications: desktop + push notifications on task completion

## Source Episodes
- 2026-02-11-claude-bridge-conceived.md
- 2026-02-16-the-lost-conversation-daemon-breakthrough.md
- 2026-02-17-monitor-dashboard-skill-creation.md
- 2026-03-04-ninth-mining-run-bridge-project.md
