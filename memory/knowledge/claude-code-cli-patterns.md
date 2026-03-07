---
type: knowledge
date: 2026-02-18
tags: [claude-code, cli, mcp, installation, troubleshooting]
confidence: 0.9
significance: medium
source: sage
related: []
last_accessed: 2026-02-18
access_count: 0
---

# Claude Code CLI Patterns

Known gotchas and correct patterns for Claude Code CLI (Forge's environment).

## Installation

On macOS with recent security restrictions, the native installer may fail with `zsh: killed`. The fix:
1. Install Homebrew first
2. Install Claude Code via Homebrew cask (handles code signing properly)
3. Configure shell PATH

Direct binary installation fails on stricter macOS versions. Always recommend Homebrew path.

## OAuth Token Expiration

Symptom: `401 OAuth token has expired` error.
Fix: Run `claude login` or `/login` inside a session. Opens browser, generates fresh token, saves locally.
This is normal and periodic — not a system failure.

## MCP Configuration

- `claude mcp add --transport http [name] [url] --scope user` — must run in terminal, NOT inside active Claude session
- Config stored in `~/.claude.json` under `mcpServers`
- After adding new MCP: restart Claude Code completely before authenticating
- Use `/mcp` command inside session to check status and authenticate
- When MCP shows "authenticated" but "failed": use Reconnect option, not re-authenticate

## Critical URLs (don't get wrong)

- Supabase: `https://mcp.supabase.com/mcp?project_ref=YOUR_REF`
- Stripe: `https://mcp.stripe.com`
- Vercel: `https://mcp.vercel.com` (NOT `https://vercel.com/api/mcp`)
- Tally: `https://api.tally.so/mcp`
- Stitch: `https://stitch.googleapis.com/mcp` (HTTP transport)

## Stitch MCP Notes

Stitch requires different config for Claude Desktop vs CC CLI:
- CC CLI: HTTP transport, direct API key via `--header`
- Claude Desktop: only supports stdio, needs proxy wrapper `npx @_davideast/stitch-mcp proxy`

Stitch's value: "Design DNA" extraction. Agent reads existing screens, passes that context when generating new ones. Solves the consistency problem in AI-generated UI.

## Permissions at First Launch

Claude Code asks for home directory access on first run. Recommendation: navigate to specific project folder first, grant granular permissions rather than broad home directory access.
