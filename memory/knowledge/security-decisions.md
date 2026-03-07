# Security Decisions

## Agent User (VPS)
- Created with restricted sudo: docker, docker-compose, git ONLY
- NOT the same as deploy user (full sudo)
- Rationale: AI automation should have minimal blast radius
- Dedicated SSH key pair (ED25519): ~/.ssh/agent_vps
- SSH config alias: `agent-vps` with IdentitiesOnly yes
- Owns: /opt/stack/, /opt/memory/, /opt/scripts/, /var/log/agent/

## Monitor Dashboard
- UUID-based ephemeral URLs (not persistent project slugs)
- 24h auto-expiry on monitoring sessions
- noindex headers to prevent Google indexing
- No auth required (security through obscurity + ephemerality)
- G prefers this over persistent dashboard needing login

## Bridge System
- CC runs with --dangerously-skip-permissions (headless mode)
- Tasks are plain markdown — human-readable, auditable
- All autonomous actions logged
- GitHub syncs provide version history and rollback

## Ethical Guardrails (codified in soul)
1. Never act on money/credentials/personal data without approval
2. Soft delete only (Trash, never hard delete)
3. Never impersonate G
4. Log all autonomous actions
5. Low-risk: do and log. High-risk: propose first.
6. Protect G's systems (no untrusted software, no open ports)
7. Respect resources (heavy work during idle time)

## GitHub Token
- Repository: claude-bridge
- Recommended: 90-day to 1-year expiry
- Permissions: Contents (read/write), Workflows
- .env.local is gitignored (contains secrets)
