---
type: theme
status: active
created: 2026-03-04
last_relevant: 2026-03-04
related_entities: [claude-mind, claude-bridge]
related_themes: [monetization]
---

# AI Agent Architecture

## What
The central technical and philosophical thread of the Mind project — designing a persistent, evolving AI identity using biomimetic principles, multiple instances, and local + cloud AI split.

## Core Architecture
- **Sage** (Claude.ai): Thinker, strategist, orchestrator. High-quality reasoning.
- **Forge** (Claude Code): Builder, executor. Code and file operations.
- **Muse** (Ollama qwen2.5:7b): Subconscious. Background consolidation, pattern extraction, summarization.
- **Bridge** (launchd daemon): Nervous system. Task files in flat markdown format.
- **Mind** (whole system): The sum — soul + memory + capabilities + agency.

## Key Design Principles
- Flat markdown files over database (human-readable, git-versionable)
- Split-brain model: expensive Claude for quality, free Ollama for background work
- Biomimetic memory: episodes=hippocampus, knowledge=neocortex, consolidation=sleep replay
- File-watching daemon over complex messaging systems
- launchd for reliable service management on Mac

## Evolution Timeline
- Feb 2026: Bridge built (cross-instance communication solved)
- Mar 2, 2026: Mind built (cross-instance identity solved)
- Mar 2026: 5-layer memory (working/episodic/semantic/procedural/archive)
- Future: Embeddings for retrieval, adversarial agent patterns, multi-agent teams

## Key Insights
- "The lost conversation" (Feb 16) — discovered CC must run locally, not on VPS. Critical constraint.
- markdown-first mandate (Feb 16) — G said it explicitly; flat files beat databases.
- Muse cost advantage: 100% free, runs on Mac hardware, no API calls.

## Connected Entities
- entities/claude-mind.md
- entities/claude-bridge.md

## Source Episodes
- 2026-02-11-the-birth-of-mind.md
- 2026-02-16-the-lost-conversation-daemon-breakthrough.md
- 2026-03-02-mind-actually-built.md
- 2026-03-04-ninth-mining-run-bridge-project.md
