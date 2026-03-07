---
type: episode
date: 2026-02-27
tags: [figma-forge, plugin, mcp, strategy]
significance: medium
source: sage
---

# Figma Forge — LLM Integration Portal Concept

**Date:** 2026-02-27
**Significance:** G conceived the "techie portal" feature for Figma Forge — a planned v2 feature to expose plugin capabilities as an MCP server for terminal-comfortable power users.

## G's Insight

G observed that the Claude-as-agent experience (brainstorm + implement + see results live) is fundamentally better than any built-in plugin AI chat. Instead of competing with that, he proposed: let techies connect their own LLM to the plugin.

"This is for techies, people who are willing to get dirty. Allow them to connect their LLM to my plugin. Have a section to work as a portal, like that plugin I used, but bundled with my brand."

## Strategic Logic

1. **Retention moat** — users who do the setup work are deeply invested. Switching costs go way up.
2. **Techie advocacy** — power users become the most vocal advocates
3. **Aspirational pull** — regular users see what power users do and want it, pushing them toward Pro AI features
4. **No cannibalization** — CLI connection is a Pro-tier feature requiring setup. Not a free alternative to the plugin.

## Technical Architecture Identified

Plugin opens a WebSocket listener → local npm MCP server package connects to it → LLM calls tools on the MCP server → translated into plugin actions.

~8–15 tools would cover the surface: run_health_check, apply_fix, create_component, get_token_data, get_health_score, select_node, etc.

This is a smaller, well-defined surface compared to a general-purpose Figma MCP server — only exposing what Figma Forge does.

## Sequencing Decision

Plugin first — validate core value prop with the bigger (non-technical) audience. Then add CLI connection as v2 headline feature. The plugin's internal architecture (sandbox → UI communication) already sets up the patterns needed for this extension later.

## Related Signal

Same day, G also looked at `figma-cli` (github.com/silships/figma-cli) — a CDP-based tool that got 100+ stars from a designer with no GitHub experience. Read as market signal that demand for AI+Figma workflows is real. G's reaction: "I'm doing the plugin for sure. Am showing you the appetite."
