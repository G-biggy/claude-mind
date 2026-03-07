---
type: pattern
category: architecture
status: proven
created: 2026-03-04
last_validated: 2026-02-16
confidence: 0.95
source_success: 2026-02-11-bridge-system-operational.md
related_themes: [ai-agent-architecture]
---

# Flat-File Task Dispatch Pattern

## What
Use markdown files with YAML frontmatter as the communication protocol between AI instances (Sage → Bridge → Forge). No message queues, no websockets, no complex infrastructure.

## How It Works
1. Sender writes a `.md` file to `tasks/` directory
2. File-watcher daemon (chokidar/launchd) detects new file
3. Executor picks up task, reads the markdown body as its prompt
4. Executor writes result to `results/` directory
5. Sender reads result asynchronously

## Why It Works
- Human-readable: any instance (or human) can read/debug tasks
- Git-versionable: full history of all tasks and results
- Zero infrastructure: just files and a daemon
- Simple debugging: if something fails, the file is still there
- Progressive enhancement: easy to add monitoring, notifications, mobile access later

## Implementation Details
- Task format: YAML frontmatter (metadata) + markdown body (prompt)
- Status field: pending → in-progress → completed/failed
- File naming: `{task-id}.md` or `{description}-{timestamp}.md`
- Daemon: Node.js with chokidar, managed by launchd on Mac

## When to Use
- Any cross-instance task handoff
- Any async work where G doesn't need to wait for the result
- Any task that benefits from human-readable logging

## Source
Bridge system, operational since Feb 11, 2026. Tested daily.
