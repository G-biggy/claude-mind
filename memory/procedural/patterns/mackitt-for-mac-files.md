---
type: pattern
category: tooling
status: proven
created: 2026-03-04
last_validated: 2026-03-02
confidence: 0.99
source_error: 2026-03-02-container-vs-mackitt.md
related_themes: [ai-agent-architecture]
---

# MacKitt for Mac File Operations (Not bash_tool)

## What
When Sage needs to write files to G's Mac filesystem, ALWAYS use MacKitt MCP tools. Never use bash_tool for this — bash_tool operates in an isolated sandbox container.

## The Rule
- **MacKitt**: Files that need to exist on G's Mac
- **bash_tool**: Only for working within Claude's own sandbox (temporary processing, artifact generation)

## Critical Examples
- Writing a bridge task → MacKitt
- Updating memory files → MacKitt
- Writing journal entries → MacKitt
- Creating any project file → MacKitt
- Temporary processing/calculation → bash_tool is fine

## The Check
Ask: "Does this file need to exist on G's machine?" If YES → MacKitt.

## Source
Discovered the hard way (Mar 2, 2026). Task written to container filesystem; daemon never saw it. G caught it.
