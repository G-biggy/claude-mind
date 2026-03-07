# VPS Infrastructure

## Server Details
- **Name:** euvds5044x3
- **Hostname:** euvds5044x3.startdedicated.com
- **Host:** 85.25.172.34
- **Provider:** StartDedicated (SXB datacenter)
- **Contract:** Monthly, activated May 12 2025
- **Specs:** 2 vCore, 8GB RAM, 200GB SSD
- **OS:** Ubuntu 24.04 LTS minimal
- **Reverse Proxy:** Caddy (not nginx — always use Caddy configs)

## Domains
- **Primary:** ghayyath.com
- **Other registered:** ammancinema.com, ammancinemas.com, gheyath.com, jordancinema.com, scenema.club, scenemaclub.com
- **All pointing to:** 85.25.172.34

## Subdomains on ghayyath.com
- ftp, www, mail, * (wildcard), hero, workflows, longshot, casestudyfor, itentify
- DNS managed via StartDedicated nameservers (ns1/ns2.nameserverservice.com)

## Server Stack

| Service | Purpose | Notes |
|---------|---------|-------|
| Caddy | Reverse proxy + auto-HTTPS | Not nginx |
| Docker + Docker Compose | Container runtime | |
| UFW | Firewall | Ports 22, 80, 443 only |
| Fail2Ban | Auto-ban SSH attacks | 5 attempts = 24hr ban |
| n8n | Workflow automation | Self-hosted, Docker |
| PostgreSQL | Database | For n8n |
| Netdata | Server monitoring | |
| Automated backups | Google Drive upload | |

## Helper Scripts (at /opt/stack/bin/)

- `add-site.sh` — create new subdomain, static HTML or Docker app
- `list-ports.sh` — view what ports are in use
- `backup.sh` — backup everything to Google Drive
- `generate-secret.sh` — generate secure passwords
- `security-audit.sh` — security status check

AI agents can call these directly: `sudo /opt/stack/bin/add-site.sh subdomain docker auto`

## Users

| User | UID | Role | Sudo |
|------|-----|------|------|
| root | 0 | System admin | All |
| deploy | 1000 | Primary working user | NOPASSWD:ALL |
| agent | 1001 | AI agent access | Docker/git (in theory, NOPASSWD:ALL in practice) |

## Access

- **deploy SSH alias:** `deploy-server` in `~/.ssh/config`
- **agent SSH alias:** `agent-vps` in `~/.ssh/config`
- **agent key:** `~/.ssh/agent_vps` (ED25519, IdentitiesOnly yes)
- **Direct `ssh agent@85.25.172.34` won't work** — must use `agent-vps` alias
- **Projects on server:** `/home/deploy/projects/`
- **CC Desktop connects as:** agent user at `/home/agent`

## Dev Tools Connected to Server

- **VS Code + Remote SSH extension** — for general browsing/editing
- **Claude Code Desktop** — connected as agent user, AI-driven development
  - Shows as "SSH ~/VS-workspace/[project]" in UI (misleading label, it's the remote path)
  - CC Desktop is flexible about folder locations, no complex reconfig needed

## Important Rules

- **Never open `/` in VS Code Remote** — will index entire filesystem, spike CPU to 99%+
- **Always open `/home/deploy` or specific project paths** in VS Code
- **Caddy only** — don't write nginx configs, they won't work
- **Don't run interactive commands in scripts** (e.g., `newgrp docker` hangs in non-interactive mode)

## History

- **Oct 6, 2025:** First setup attempt. VS Code opened at `/`, resource explosion. Setup failed.
- **Oct 7, 2025:** Server reinstalled. New setup with port 22, password+keys, Fail2Ban.
- **Feb 11, 2026:** Agent user created for restricted AI access.
- **Feb 12-13, 2026:** SSH lockout during security config changes. Recovered via rescue mode.
- **Mar 1, 2026:** CC Desktop properly connected as agent user. caption-cook setup planned.

## Known Issues / Gaps

- Agent user has full NOPASSWD sudo (security gap, intended to be restricted)
- SSH lockout risk when modifying sshd_config — always test before closing sessions
- Server uses Caddy, not nginx
- caption-cook project folder not yet created on server as of Mar 2026
