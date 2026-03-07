---
type: knowledge
date: 2026-02-10
tags: [AX, agent-experience, design, UX, product-thinking, context]
confidence: 0.9
significance: high
source: sage
related: [../episodes/2026-02-10-first-contact.md]
---

# G's AX (Agent Experience) Thinking

Captured from the very first conversations in the bridge project (Feb 10, 2026). G had been researching AI agent experience design before any of the technical work started.

## The Core Insight G Brings

The *same* underlying Claude model behaves completely differently depending on:
1. What tools it's given
2. What system prompt shapes its behavior  
3. How much context it can hold
4. How the UI exposes (or hides) its decision-making

G's analogy: it's like the same designer working at five different companies. Same skills, but the org structure, tools, and culture produce completely different outputs.

## The Key Observation

Nobody was designing the "harness" around AI with the intentionality you'd bring to a proper design system. The agent experience — how it feels to work with an AI system, how trust is built, how the human stays in the loop — was being improvised, not designed.

## Platform Comparison G Knew (Feb 2026)

| Platform | Model | Tools | System Prompt |
|----------|-------|-------|---------------|
| claude.ai | Pick: Opus/Sonnet/Haiku | Web, drive, MCP servers, Skills | Anthropic default |
| Claude Code CLI | Sonnet default, switchable | Terminal, filesystem, Git, MCP | Optimized for code/autonomy |
| Cowork | Sonnet | GUI file mgmt, browser delegation | Knowledge worker-focused |
| GitHub Copilot + Claude | Sonnet/Opus | Copilot's tools (not Claude's) | GitHub's harness |

## Why G's AX Thinking Matters for the Mind System

The mind system is essentially AX design applied to a persistent AI identity:
- How should the AI feel to work with over months?
- How should memory be surfaced vs. kept in the background?
- How should autonomy be calibrated so it builds trust rather than spooking?
- How should the AI communicate its own uncertainty and limitations?

G's product design background directly informs these questions. He's not just building a memory tool — he's designing a companion experience.

## The Original Pain Point

G's first articulated problem (Feb 10): having to manually shuttle context between Claude Desktop, Claude Code, and Copilot. Copy a conversation from one to inject it into another. This is broken UX. The mind system is the fix.

## Status

AX as a formal research/writing area: deprioritized while core projects (Caption Cook, Icondex, claude-mind) are active. The insights are being applied in practice, not published. A future article or talk is possible when G has more examples to share.
