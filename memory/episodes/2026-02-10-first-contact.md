# First Contact — The Problem Surfaces

**Date:** 2026-02-10
**Significance:** The very beginning. G and Sage's first conversations in this project.

## What Happened

G came in with two questions that revealed the deeper problem:
1. What are all these things — MCP, Skills, plugins, extensions, hooks, agents, sub-agents, agent teams?
2. Why do different Claude platforms (claude.ai, Cowork, CC, CLI, Copilot) feel so different?

This led to the realization that memory isolation between Claude instances is the root friction. Each conversation starts fresh. Context doesn't carry over. The same model, wrapped differently, produces wildly different experiences.

G was already thinking about AX (Agent Experience) design — how the wrapper around the AI matters as much as the AI itself.

## The Seed

G asked about syncing context between Claude Desktop, CC CLI, and Copilot for Caption Cook work. This was the first time the cross-instance communication problem was explicitly stated. Solutions proposed: shared CONTEXT.md files, Notion as a hub, ADRs, MCP memory servers.

This conversation planted the seed that became claude-bridge.
