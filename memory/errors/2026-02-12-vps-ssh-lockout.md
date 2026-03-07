# VPS SSH Lockout

**Date:** 2026-02-12
**Severity:** Critical
**Category:** Infrastructure

## What Went Wrong

While creating the `agent` user and configuring SSH key authentication on the VPS, the SSH daemon crashed or stopped. G was completely locked out — Connection refused on port 22. Server was pingable but SSH unreachable.

Required VPS provider console access to recover.

## Root Cause

Likely: SSH configuration changes (sshd_config modifications or key permission issues) caused the SSH service to fail on restart/reload.

## Lesson

1. Never modify SSH config without keeping an existing session alive as a lifeline
2. Always test SSH changes in a new terminal before closing the working session
3. Have VPS console access credentials ready before touching SSH
4. G has been locked out before — this is a recurring risk
5. Consider using `sshd -t` to test config before restarting the service
