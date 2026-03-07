# Ghost Skills Crisis

**Date:** 2026-02-22
**Significance:** Discovered orphaned server-side skills that couldn't be deleted through UI.

## What Happened

G found two phantom skills in his Claude account — "bridge" and "ugverse-bridge" — that were registered in account metadata but had no backing files on the filesystem. Only "task-dispatch" had actual implementation files.

Attempting to delete, replace, edit, or merge them through the Claude.ai web interface (Settings → Capabilities → Skills) failed with "Failed to delete skill. Try again." errors.

## Root Cause

The skills were managed server-side through claude.ai, not as local files. They appeared to be remnants from previous setups that didn't clean up properly when configurations changed.

## Resolution Path

Anthropid support provided guidance: use the Skills API to delete skill versions before deleting the parent skills. The approach:
1. List all skills via API to get IDs
2. List versions for each problematic skill
3. Delete individual versions
4. Delete the parent skills

Required the Anthropic API key from console.anthropic.com.

## Lesson

Skills that appear in the Claude.ai UI may not have corresponding local files. Server-side skill state and local filesystem state can diverge. When UI deletion fails, escalate to Skills API. See errors file for the SSH lockout pattern — same lesson: UI blockers often require API-level intervention.

## Also That Day

Installed Tally.so MCP via HTTP + OAuth. Config: `"type": "http", "url": "https://api.tally.so/mcp"`. Restart Claude Desktop with Cmd+Q (not just close window) required to activate.
