# Mobile Workflow Patterns

## The Problem

G often works from his phone (late nights, on the go). Claude.ai mobile app works but has no access to MCP servers or local filesystem.

## Current Solutions

### From Phone (Claude.ai mobile)
- Can brainstorm and strategize (full conversation capability)
- Can create files in Claude's container and present for download
- CANNOT directly write to Mac filesystem
- CANNOT use MacKitt or other MCP tools

### Planned: Telegram Bot
- Bot on VPS, listens to G's Telegram user ID (built-in auth)
- Natural language → structured task file (via Anthropic API)
- SCP to Mac tasks/ directory
- Notification back when complete
- No ports to open, no auth to build
- G's preferred approach for mobile dispatch

### Alternative: Web Form
- Simple form at bridge.ghayyath.com/submit
- Needs authentication (more dev work)
- G was concerned about security exposure

### File Creation from Mobile
- Bundle files into bridge tasks
- CC writes them to correct project directories
- One task, multiple files in the body
