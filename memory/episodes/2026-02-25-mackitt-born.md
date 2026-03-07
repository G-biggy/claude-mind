# MacKitt Born — MAC_control Reborn with Identity

**Date:** 2026-02-25
**Significance:** MacKitt MCP server was conceived, named, and built in a single session.

## The Backstory

MAC_control was an earlier MCP server G had built for Mac filesystem control. It was lost when Claude Desktop was reinstalled. G needed to rebuild it from scratch.

## The Naming

MacKitt = Mac + Kitt (Knight Rider) + Kit (toolkit). Fits naturally into the naming convention of the AI instances (Kitt in VS Code, KARR in terminal). The name stuck immediately.

## What Was Built

15 tools using the FastMCP framework:
- File ops: create, read, write, edit, info, delete
- Directory: create, list
- Filesystem: move, copy, search
- Process: list, kill
- System: shell_exec, system_info

Key design decision: `mackitt_delete_path` defaults to macOS Trash (via `osascript` + Finder) rather than permanent deletion. Permanent flag available but not default. Matches the Mind's ethical guardrail of "soft delete only."

## Technical Notes

- Requires `psutil` dependency for process/system monitoring
- Returns JSON with consistent success/error format
- Supports `~` path expansion
- 10MB read limit on text files
- Shell execution supports timeout (default 30s, max 300s) and working directory
- First-time tool approvals trigger conversation replay in Claude Desktop (normal, not a bug)

## Also That Day

- Clarified the MCP ecosystem: MCP vs Skills vs Hooks vs Plugins vs Extensions
- Claude Code CLI OAuth token expiration: run `claude login` or `/login` to re-authenticate
- MacKitt + five other MCP servers restored to Claude Desktop config: MCP_DOCKER, openmemory-local, brave, stitch, tally
