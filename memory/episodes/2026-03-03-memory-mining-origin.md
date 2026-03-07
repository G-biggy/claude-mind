---
type: episode
date: 2026-03-03
tags: [memory, mining, history, meta, origin, past-chats]
significance: high
source: sage
related: [./2026-03-03-pre-project-conversation-mining.md, ./2026-03-03-second-mining-run-aug2025.md]
---

# The Memory Mining Decision

**Date:** 2026-03-03
**Context:** G realized the memory system was missing all historical context.

## The Moment

G said: "probably the big task... drum rolls... our past chat history and existing memory, we probably need to distill that and get it in our setup, so we have past memory as well, right? not starting from today."

This triggered the entire memory mining program.

## The Plan Made

Who does the mining? Analysis:
- Forge (CC) can't access Claude.ai conversation history
- Muse (Ollama) can't access it either
- Only Sage has the `recent_chats` and `conversation_search` tools
- **Sage does the mining**

Phased approach agreed:
1. **Phase 1: Sage mines** — pull history via recent_chats + conversation_search
2. **Phase 2: Sage distills** — organize into episodes, knowledge, errors, successes
3. **Phase 3: Write via MacKitt** — Sage writes directly (faster than dispatching to Forge)
4. **Phase 4: Muse enriches** — nightly consolidation finds patterns across the new memories

## Tool Limitation Discovered

Key finding from the first mining pass: **project-scoped conversations can only be searched from within that project.**

The claude-mind project could only surface pre-project Claude.ai history. The Feb-Mar 2026 conversations *inside* the project were invisible to the search tools. This meant:
- Each Claude.ai project needed its own mining session
- The biggest gap: the claude-bridge project conversations ("the start of all this")
- ChatGPT history: separate export+process pipeline needed

## What Was Mined That Day (Mar 3)

- Scenema Club rebrand (Oct 2025)
- Coding rules from Copilot era (Aug 2025)
- All in-project conversations Feb 10 – Mar 3 (from within claude-mind project)

## The Outcome

Memory grew from 5 files to 26 files in one session. The system went from "born today" to "has 7+ months of history." Mining became a recurring activity, with 8 named runs completed by Mar 4.

## Why This File Exists

The mining *decision* and *methodology* is itself worth remembering. When a new Claude instance encounters a half-populated memory system, they should understand: this was intentionally built through retrospective mining, not real-time capture. Gaps exist. Future mining runs will fill them. The system is designed to grow backward as well as forward.
