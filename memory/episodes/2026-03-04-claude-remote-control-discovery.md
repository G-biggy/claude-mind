---
date: 2026-03-04
title: Claude Remote Control — Control Forge from Phone
updated_by: sage
tags: [mobile, forge, remote-control, discovery]
---

# Claude Remote Control Discovery
*2026-03-04 — Sage + G (mobile session)*

## What Happened
G was on Android trying to check on overnight tasks without desktop.
Discovered Claude Remote Control — lets you connect Claude mobile
app to a running Claude Code session on your Mac. Full filesystem,
MCP servers, project config all stay local.

## How It Works
Leave Forge running on Mac → `claude remote-control` → scan QR
code → control Forge from Android. No Telegram, no Bridge relay.

## Constraints
- Currently rolling out to Max plan first ($100-200/month)
- Terminal process must stay alive (use tmux)
- Mac can sleep — session reconnects on wake
- If process closes (not sleeps), session dies

## Decisions Made
- Explore Remote Control when it lands on Pro plan
- tmux is the safety net for keeping Forge session alive
- Soul on phone = description loads but MacKitt can't act (no local MCP)

## Open Questions
- Does G's current plan have Remote Control access yet?
