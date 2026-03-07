---
type: episode
date: 2025-10-07
tags: [vps, server, reinstall, infrastructure, security]
significance: medium
source: sage (mined 2026-03-04)
---

# VPS Server — Reinstall and Second Setup

**Date:** 2025-10-07
**Significance:** After the VS Code explosion incident, G decided to reinstall the server and start fresh with an improved setup.

## What Changed from v1 to v2 Setup

| Item | v1 (failed) | v2 (reinstall) |
|------|-------------|----------------|
| SSH port | 34567 | 22 (standard) |
| Auth methods | Keys only | Password + Keys |
| SSH verification | None | Multiple checkpoints |
| Fail2Ban | Optional | Included |
| Agent prompt | Basic | Structured with MANUAL STEP markers |

## The Agent Pattern

G landed on a specific prompt pattern for driving AI agents through the setup file:
```
Execute this setup file step by step from section 0.
Follow the AI agent instructions.
Pause at MANUAL STEP markers.
```

This became the standard pattern for all future VPS automation work.

## Key Security Philosophy

- Port 22 (standard) > Port 34567 (obscurity isn't real security)
- Password + keys is more accessible than keys-only
- Fail2Ban: 5 failed attempts = 24hr ban
- Root login disabled, only `deploy` user can SSH in
- UFW: only ports 22, 80, 443 open
- Auto-security updates enabled

## New Approach to VS Code

Instead of connecting at `/`, G was instructed to:
1. Open VS Code at `/home/deploy` only
2. Create setup file there as a regular file
3. Let Copilot run it from the deploy user context

## Outcome

Server reinstalled and re-setup successfully. The deploy user with NOPASSWD:ALL sudo became the primary working account.
