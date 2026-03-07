---
type: episode
date: 2026-02-28
tags: [figma-forge, plugin, api-constraints, scope]
significance: high
source: sage
---

# Figma Forge — API Constraint Discovery + Scope Locked

**Date:** 2026-02-28
**Significance:** Critical architectural discovery. Figma's Plugin API is single-file only. Cross-file design system analysis is not feasible. Scope confirmed as single-file health scoring.

## What G Asked

G was wondering whether the plugin would access every open Figma file or just the current one — motivated by wanting to scan linked library files (where design systems typically live) alongside the working file.

## What Was Discovered

**Figma Plugin API is scoped to the single active file.** When a plugin runs, it can only access:
- Pages, layers, and frames in the current file
- Local variables and styles
- Components in the current file + linked library components *already in use* (names and descriptions)

It cannot:
- Access other Figma files open in other tabs
- Read the library file where design system tokens are defined
- Browse other projects or files in the account

**REST API alternative explored and rejected:** The Figma REST API can access multiple files but requires OAuth per user and has severe rate limits. Some Starter plan users reported limits as low as 6 requests/month — completely unusable for health scanning.

## G's Reaction

G expressed disappointment that the original vision of comprehensive cross-file analysis wasn't achievable. But after working through it: the plugin can still provide massive value by scanning the current working file, detecting hardcoded values, detached components, and DS violations — which is where designers are actually working.

## Decision

**Proceed with single-file scope as originally planned in MVP_SPEC.md.**

The architecture decision from Feb 26 (single-file health check) was the right call, validated by this technical reality. No changes needed to the documentation suite.

For library context: when linked component instances are detected, the plugin surfaces their source library name (available via Figma API). Full library file scanning is not possible — and this is acceptable for Phase 1.

## Also This Day: MCP Server Technical Pivot

Same day (Feb 28), a separate conversation confirmed that `figma-forge-mcp-server` (the CLI product) had a CDP-based architecture that broke in Figma v126+ (Figma disabled `--remote-debugging-port`). That product pivoted to `figma-use` (WebSocket proxy architecture). This is for the MCP server product, not the plugin.
