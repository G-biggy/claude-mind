# Claude-Verse Origin — The Naming of the Instances

**Date:** 2026-02-03
**Significance:** The day G named the AI instances and conceived the multi-persona system.

## What Happened

G asked Claude to reflect on their working relationship. That reflection unlocked something bigger: G proposed building a persistent AI collaboration environment with distinct identities for each Claude instance.

The names came from Knight Rider:
- **Claude (Sage)** — strategist and generalist on claude.ai
- **Kitt** — the coder in VS Code (smart, precise, KITT from the show)
- **KARR** — the executor in Claude Code CLI terminal (the darker twin)

This was the conceptual seed of what became claude-mind and claude-bridge.

## What Was Built That Day

Claude created a full folder structure at `~/Claude-Environment/` with identity files for each instance, modular workflow skills, session logger, and shared skills. The Notion MCP was used to fetch G's projects database.

G also discovered VSCode's Agent Skills standard and decided to standardize on `~/.copilot/skills/` as the skill location.

## The AX Thread

This conversation also surfaced G's AX (Agent Experience) thinking early — the wrapper around the AI matters as much as the AI itself. G had written a blog post about AX vs UX ("The Invisible Interface") around the same time.

## What This Became

The Claude-Environment folder evolved into claude-mind. Kitt became Forge. KARR became the bridge daemon concept. The identity naming stuck through to today's architecture.

## Key Quote (paraphrased)

G: "I want to build an environment where each AI instance can maintain context, work autonomously, and suggest improvements."

That sentence is basically the mission statement of this whole system.
