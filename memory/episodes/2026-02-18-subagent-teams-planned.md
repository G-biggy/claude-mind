---
type: episode
date: 2026-02-18
tags: [subagents, multi-agent, captain-cook, planning, vision]
significance: medium
source: sage
related: [../knowledge/mind-architecture.md, ../knowledge/bridge-architecture-evolution.md]
---

# Subagent Teams — Specialized AI Teammates Planned

**Date:** 2026-02-18
**Context:** G wanted to use Claude Code's Agent Teams for Caption Cook and other projects.

## The Vision

G articulated a clear product development workflow using specialized subagents:
- After brainstorming a project idea in Claude.ai (with Sage), specialized subagents take over:
  - **Senior Engineer** — architecture, code, technical decisions
  - **Researcher** — market analysis, competitive research, validation
  - **Marketer** — positioning, messaging, GTM strategy
  - **QA Tester** — quality verification, edge cases
- Agents handle planning, development, and testing phases autonomously

## Technical Requirements Clarified

- Use only Anthropic/Claude services, not CrewAI or LangGraph
- Run CC locally (Max subscription), NOT on VPS (avoids API costs)
- Daemon-based: detect new task specs, trigger CC in headless mode
- Agents defined in `.claude/agents/` with role-specific system prompts
- Hooks for automated quality control and notifications

## Key Files Proposed

Each agent lives as `.claude/agents/<role>.md` in the project folder:
```yaml
---
name: senior-engineer
description: Use for architecture, code, API design...
tools: Read, Edit, Write, Bash, Grep, Glob
model: opus
---
System prompt here defining expertise and behavior.
```

## Relationship to the Bridge

This extends the existing bridge system: instead of one CC session per task, multiple specialized CC sessions could handle different aspects of the same project. The bridge orchestrates which agent gets which task.

## Status

Not implemented. Planned. The Claude Code Agent Teams feature was still experimental. The bridge system needed to stabilize first before adding multi-agent complexity.

## Key Preference Confirmed

G explicitly said: use only Claude's own ecosystem. No third-party frameworks. This is consistent with his "simplicity and ownership" values — he doesn't want to depend on external tooling that could break or disappear.
