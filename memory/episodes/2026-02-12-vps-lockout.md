# VPS SSH Lockout Incident

**Date:** 2026-02-12
**Significance:** First major infrastructure scare. G got completely locked out of his VPS.

## What Happened

While setting up the `agent` user on the VPS (85.25.172.34) for automated SSH access, something went wrong during SSH configuration. The SSH daemon stopped responding entirely — "Connection refused" on port 22, even though the server was pingable.

G had to contact the VPS provider for out-of-band console access to recover.

## Context

This happened during Phase 0-1 of claude-bridge setup. We were creating a dedicated agent user with restricted permissions instead of using root/deploy. The SSH key authentication was failing, and during troubleshooting, the SSH service crashed.

G mentioned this had happened before — getting locked out of VPS is a known pain point.

## Lessons

- Always be extremely careful with SSH daemon configuration on remote servers
- Have a recovery plan (VPS console access) before making SSH changes
- Test SSH changes in a separate session while keeping an existing connection alive
- This incident informed later security decisions about the agent user's limited permissions
