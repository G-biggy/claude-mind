---
date: 2026-03-07
type: episode
slug: github-backup-init
tags: [git, github, backup, claude-bridge, claude-mind, figma-forge-plugin, mackitt-mcp]
---

# GitHub Backup Initialization

## What Happened
Forge executed the `init-github-backup` task dispatched by Sage. Goal: initialize git repos and push all 4 key projects to GitHub for backup.

## Results

### claude-bridge — FULLY BACKED UP
- Already had git history and an HTTPS remote
- Switched remote to SSH (`git@github.com:G-biggy/claude-bridge.git`)
- Committed 137 pending files (autonomy system, inbox, planner daemon, monitor, skills)
- Successfully pushed to GitHub

### claude-mind — LOCAL ONLY (blocked)
- No git repo existed
- Created `.gitignore` — excluded `imports/` (1.1GB ChatGPT raw data), `logs/`
- `git init`, committed 254 files (soul, memory, agency, capabilities, scripts, skills)
- Remote set to `git@github.com:G-biggy/claude-mind.git`
- Cannot push — GitHub repo not created yet

### figma-forge-plugin — LOCAL ONLY (blocked)
- No git repo existed; existing `.gitignore` already had node_modules/dist
- `git init`, committed 78 files (full plugin source)
- Remote set, awaiting GitHub repo creation

### mackitt-mcp — LOCAL ONLY (blocked)
- No git repo existed
- Created `.gitignore` for Python artifacts
- `git init`, committed 5 files
- Remote set, awaiting GitHub repo creation

## Blocker
GitHub repos for `claude-mind`, `figma-forge-plugin`, `mackitt-mcp` do not exist yet.
No `gh` CLI installed, no GitHub API token in environment.
G needs to create the 3 repos at github.com/new then run 3 push commands.

## Key Decision
Excluded `imports/` (1.1GB raw ChatGPT JSON) from claude-mind git. Processed knowledge files are included. Right call — that data is huge and already processed into structured memory files.
