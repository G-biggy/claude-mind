# Episode: Webhook Receiver VPS Deploy
Date: 2026-03-15
Task: webhook-receiver-vps

## What Happened

Deployed a lightweight Express.js webhook receiver to the VPS.

### What worked:
- Created `/home/agent/webhook-receiver/index.js` — 3 endpoints (health, github, alert)
- Used ESM (import/export) with `"type": "module"` in package.json
- HMAC-256 validation for GitHub, bearer token for alert
- User-level systemd service (`~/.config/systemd/user/webhook-receiver.service`) — no sudo needed
- `loginctl enable-linger agent` — service survives logout/reboot
- All 3 endpoints tested locally on VPS — working clean

### What blocked:
- Agent user can't write to `/srv/projects/caddy/sites-enabled/` (owned by `deploy`)
- No passwordless sudo configured for agent user
- Left Caddy config as a manual step for G (`secrets/caddy-webhook-config.md`)

## Files Created
- VPS: `/home/agent/webhook-receiver/index.js`
- VPS: `/home/agent/webhook-receiver/.env` (secrets)
- VPS: `~/.config/systemd/user/webhook-receiver.service`
- Local: `claude-bridge/secrets/webhook-secrets.md`
- Local: `claude-bridge/secrets/caddy-webhook-config.md`

## Lessons
- User systemd (`systemctl --user`) is a solid alternative when sudo isn't available
- `loginctl enable-linger` is the key to making user services survive across reboots
- The VPS agent user doesn't have passwordless sudo — worth documenting or fixing later
