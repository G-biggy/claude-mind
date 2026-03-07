---
type: episode
date: 2026-02-11
tags: [vps, security, agent-user, permissions, infrastructure]
significance: medium
source: sage (mined 2026-03-04)
---

# Agent User — Restricted AI Access Design

**Date:** 2026-02-11
**Significance:** G designed and created a restricted `agent` user specifically for AI tool access, separating AI operations from admin operations.

## The Problem

Deploy user has full NOPASSWD sudo access (essentially root). Using it for AI agents (Claude Code Desktop, n8n, etc.) creates unnecessary security risk. G wanted a separate account with just enough access to do useful work, not system administration.

## Deploy-Level Permissions Defined

**Can do:**
- Manage Docker containers (start/stop/restart)
- Deploy projects and subdomains via helper scripts
- Edit website files and configs under project directories
- Run helper scripts in `/opt/stack/bin/`
- View application logs
- Manage project files under `/home/deploy/projects/`

**Cannot do:**
- Install system packages
- Modify firewall rules
- Change SSH configuration
- Create/delete system users
- Modify system services
- Access other users' private files
- Reboot server
- Change security settings

## What Was Created

The `agent` user (UID 1001):
- Docker group membership (can run Docker commands without sudo)
- SSH keys configured
- Sudo restricted to: docker, docker-compose, git only
- Home: `/home/agent`
- Owns: `/opt/stack/`, `/opt/memory/`, `/opt/scripts/`, `/var/log/agent/`

## Note

In practice, after the Feb 12 SSH lockout and recovery, the agent user was found to have been given full NOPASSWD:ALL sudo (not restricted). This was noted but not yet corrected as of the Feb 13 recovery. The intent was restriction; the execution was full access. This remains a known security gap.

## SSH Alias

Configured as `agent-vps` in `~/.ssh/config` on G's Mac, pointing to `~/.ssh/agent_vps` ED25519 key. Direct `ssh agent@85.25.172.34` doesn't work — must use the alias.
