# Container vs MacKitt Tool Confusion

**Date:** 2026-03-02
**Severity:** Medium
**Category:** Tool misuse

## What Went Wrong

Used `bash_tool` (Claude's sandbox container) to create a bridge task file instead of MacKitt. The file was written to the container filesystem, not to G's Mac. The daemon never saw it.

G caught it: the bridge tasks directory is on the Mac, not in the container.

## Root Cause

Habit/default behavior. bash_tool is the "obvious" tool for file operations, but it operates in an isolated container. MacKitt is the MCP that actually touches G's Mac filesystem.

## Lesson

1. For ANY file that needs to exist on G's Mac, use MacKitt (mackitt_create_file, mackitt_shell_exec, etc.)
2. bash_tool is only for Claude's own sandbox work (creating artifacts, temporary processing)
3. Bridge tasks MUST go to `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/tasks/` via MacKitt
4. Reading project files: MacKitt. Writing to projects: MacKitt. Always.
5. If in doubt, ask: "Does this file need to exist on G's machine?" If yes → MacKitt.
