---
type: episode
date: 2025-10-06
tags: [vps, server, setup, infrastructure, vs-code, copilot]
significance: high
source: sage (mined 2026-03-04)
---

# VPS Server — First Setup Attempt

**Date:** 2025-10-06
**Significance:** Origin story of G's VPS server. First time he touched server infrastructure — zero knowledge, learning on the fly.

## Context

G acquired a VPS from StartDedicated (euvds5044x3, 85.25.172.34, Ubuntu 24.04, 2 vCores, 8GB RAM, 200GB SSD). He had zero server experience and used VS Code Copilot agent to run an automated 18-step setup script.

## What Was Built

Full production-grade server stack:
- **Caddy** — reverse proxy + auto-HTTPS
- **Docker** — container runtime
- **UFW** — firewall (ports 22/80/443 only)
- **Fail2Ban** — auto-ban failed SSH attempts
- **n8n** — workflow automation (self-hosted)
- **PostgreSQL** — database for n8n
- **Netdata** — server monitoring
- **Automated backups** — Google Drive upload
- **4 helper scripts** at `/opt/stack/bin/`:
  - `add-site.sh` — create new subdomain (static or Docker)
  - `list-ports.sh` — view port usage
  - `backup.sh` — backup everything
  - `generate-secret.sh` — generate passwords
  - `security-audit.sh` — security check

## The Problem

G connected VS Code to the server at `/` (root filesystem directory). VS Code Remote SSH auto-spawned multiple processes indexing the entire filesystem. Result: 4 VS Code Server instances, 52.7GB virtual memory each, CPU at 99-100%. Server became unusable for any automated work.

## What G Learned

- Opening `/` in VS Code on a remote server is dangerous — it watches and indexes the entire filesystem
- The setup file was ~2000 lines (normal for this complexity)
- Copilot agent would freeze on interactive commands like `newgrp docker`
- First SSH port was 34567 (non-standard, later reverted to 22)
- `newgrp` hangs in non-interactive mode — use `sudo usermod -aG docker deploy` + re-login instead

## Outcome

Setup failed partway through. Decision made to reinstall server and try again with a better approach.
