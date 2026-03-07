---
type: episode
title: claude-memory MCP Server Built
date: 2026-03-06
tags: [mcp, memory, sage, forge, claude-mind, build]
source: forge
---

# claude-memory MCP Server Built

Built the `claude-memory` MCP server at `/Users/ghayyathhuzayen/VS-workspace/claude-memory/`.

## What Was Built

A Node.js TypeScript MCP server that gives Sage (Claude.ai) full read/write access to the claude-mind memory system. Replaces the MacKitt approach for memory operations with a purpose-built, semantically aware interface.

## Stack

- Node.js + TypeScript
- `@modelcontextprotocol/sdk` v1.x (stdio transport)
- `js-yaml` for frontmatter handling
- Pure file I/O — no shell exec, no network calls

## 8 Tools Implemented

1. `memory_recall(query)` — manifest-aware + grep-based smart lookup
2. `memory_write(type, title, content, tags?)` — write episodes/knowledge/errors/successes
3. `memory_update(file, append)` — append to existing files
4. `memory_search(query, scope?)` — full-text grep, 20 results max
5. `memory_context()` — return working/context.md
6. `memory_update_context(content)` — overwrite working memory (instant Sage→Forge sync)
7. `memory_manifest()` — return the full manifest
8. `memory_consolidate(title, content, context_updates?)` — one-shot end-of-session consolidation

## Key Design Decisions

- Multi-word queries split into individual words — each word checked independently against manifest rows and grep lines (broad match strategy)
- All paths validated against CLAUDE_MIND_ROOT — rejects anything outside
- `memory_recall` does 3-pass lookup: manifest parse → knowledge grep → full memory fallback
- `memory_update_context` auto-adds YAML frontmatter if caller doesn't include it
- Slugification: lowercase, hyphens, max 50 chars

## Tests Passed

- `tools/list` → 8 tools registered
- `memory_recall("Agoda")` → returned job search history
- `memory_recall("daughter food")` → returned dietary needs file
- `memory_write("episode", ...)` → created file with correct path
- `memory_context()` → returned working memory
- `memory_consolidate(...)` → wrote episode file

## Files Created

```
claude-memory/
├── src/index.ts         (all 8 tools, ~380 lines)
├── package.json
├── tsconfig.json
├── README.md
└── dist/                (compiled output)
```
