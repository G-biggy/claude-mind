---
type: episode
date: 2026-03-01
tags: [vps, claude-code, cc-desktop, caption-cook, remote-dev]
significance: medium
source: sage (mined 2026-03-04)
---

# CC Desktop — Connected to VPS as Agent User

**Date:** 2026-03-01
**Significance:** Claude Code Desktop was successfully connected to the VPS server as the agent user. This was the first time CC Desktop was properly pointed at the remote server.

## The Confusion

CC Desktop showed "SSH ~/VS-workspace/caption-cook" as the connection label, which made G think it was pointing to his local Mac. It was actually the remote server path. This confusion led to troubleshooting that eventually confirmed the connection was working.

## How it Resolved

G ran commands through CC Desktop and confirmed the filesystem was the VPS (not local Mac). The connection was confirmed when the `~` path resolved to `/home/agent` on the server.

## Server File Structure Discovered

- Existing projects live under `/home/deploy/projects/`
- The `caption-cook` folder did not yet exist on the server
- CC Desktop connects as `agent` user at `/home/agent`

## Where to Put caption-cook

Two options discussed:
1. `/home/deploy/apps/caption-cook` — consistent with existing projects, deploy user
2. `/home/agent/apps/caption-cook` — simpler access for CC Desktop

## Local Folder Reorganization

G asked about renaming his local Mac folder from `VS-workspace` to `projects`. Confirmed: both VS Code and CC Desktop simply need to be pointed at the new location. No complex reconfiguration. Low-risk change.

## Dev Workflow as of March 2026

G uses two remote dev tools:
- **VS Code with SSH extension** — for general server work, browsing files
- **Claude Code Desktop** — for AI-driven development sessions, connected as agent user

Both tools are flexible about folder locations on the server.
