---
type: episode
date: 2026-03-04
tags: [memory, mining, figma-forge, meta]
significance: medium
source: sage
---

# Fifth Mining Run — Figma Forge Plugin Captured

**Date:** 2026-03-04
**Significance:** Fifth memory mining run. Discovered Figma Forge Plugin — an entirely new product project built Feb 26–28, 2026 — was completely absent from the memory system.

## What Was Found

Seven conversations from Feb 26–28, 2026 covering the full Figma Forge Plugin lifecycle:

1. **"Figma plugin UI and approval process" (Feb 26)** — Early questions about plugin UI architecture and Figma Community review process.

2. **"Building a Figma Forge plugin from scratch" (Feb 26)** — Project kickoff. Created `figma-forge-plugin/` folder. Four core docs written (PROJECT, ARCHITECTURE, MVP_SPEC, TECH_STACK). Key decisions: MVP = Phase 1 health check only, Vite + esbuild build, auto-detect conventions.

3. **"Connecting to Figma" (Feb 26–27)** — Extended session covering pricing strategy, competitive analysis, and four more docs (TOKEN_STANDARDS, COMPETITIVE, PRICING, TASKS). CLAUDE.md written. Pricing locked: Free + $12/month Pro. Revised unit economics: $6–8 profit/user (not $2). Interactive UI prototype built.

4. **"LLM integration portal for Figma forge" (Feb 27)** — G conceived the "techie portal" — exposing plugin capabilities as an MCP server for terminal users. WebSocket bridge architecture. Planned for v2, not v1. Plugin-first sequencing confirmed.

5. **"Figma CLI and AI integration opportunities" (Feb 27)** — Analyzed figma-cli tool (100+ stars, CDP-based). Read as market demand signal for AI+Figma workflows. G's reaction: "I'm doing the plugin for sure."

6. **"Figma CLI vs MCP comparison" (Feb 28)** — Primarily about `figma-forge-mcp-server` (the separate CLI product) discovering its CDP architecture broke in Figma v126+. Pivot to figma-use. Separate from the plugin project.

7. **"Figma plugin project access scope" (Feb 28)** — Critical discovery: Figma Plugin API = single-file only. REST API rate limits too severe. Scope confirmed as single-file health analysis. No changes needed to docs.

## Files Created in This Run

- `memory/knowledge/figma-forge-plugin.md` — Master knowledge file
- `memory/episodes/2026-02-26-figma-forge-plugin-conceived.md`
- `memory/episodes/2026-02-27-figma-forge-docs-complete.md`
- `memory/episodes/2026-02-27-figma-forge-mcp-portal-idea.md`
- `memory/episodes/2026-02-28-figma-forge-scope-locked.md`

## Files Updated

- `memory/knowledge/g-projects.md` — Added Figma Forge Plugin as first Active project entry (above IconDex)

## State of Memory System

Memory system now has complete coverage of Figma Forge Plugin through Feb 28, 2026. The plugin project is documentation-complete and awaiting first Claude Code dispatch for Phase 1 scaffolding.

## Note on the Two Figma Forge Products

- `figma-forge-mcp-server` = older CLI tool for Claude Desktop/Code. CDP architecture pivoted to figma-use on Feb 28. Not fully captured in memory yet.
- `figma-forge-plugin` = new native Figma plugin. This mining run captures it fully.
