---
type: anti-pattern
category: infrastructure
severity: critical
created: 2026-03-04
last_occurred: 2026-02-12
confidence: 0.99
source_error: 2026-02-12-vps-ssh-lockout.md
---

# SSH Config Changes Without a Lifeline

## What
Modifying SSH daemon configuration (sshd_config, authorized_keys, key permissions) without maintaining an existing session as a fallback. If the SSH service fails to restart, complete lockout results.

## What Happened
Creating the `agent` user on the VPS included SSH config changes. SSH daemon crashed or stopped. Complete lockout — Connection refused on port 22. Required VPS provider console access to recover.

## Rules
1. ALWAYS keep an existing SSH session open while making config changes
2. Test config before restarting: `sshd -t`
3. Open a NEW terminal to test the new session BEFORE closing the working session
4. Have VPS console credentials ready before any SSH work
5. This has happened to G before — it's a recurring risk pattern

## Recovery
VPS provider console access (web-based terminal). Not always available or responsive immediately.
