---
type: knowledge
date: 2026-02-17
tags: [multi-agent, adversarial, architecture, deliberation, future]
confidence: 0.7
significance: medium
source: sage
related: [../episodes/2026-02-17-adversarial-agents-conceived.md, mind-architecture.md]
---

# Adversarial Agents Pattern

A future design direction for autonomous decision validation without human mediation. Conceived Feb 17, 2026 while comparing claude-bridge to Reddit's project-orchestrator system.

## The Core Idea

Two specialized agents in a sequential debate loop:

```
Architect agent writes:  proposal.md
Challenger agent writes: critique.md  (reads proposal, finds flaws)
Architect agent writes:  revised-proposal.md (defends or accepts critique)
... N rounds ...
Summary agent writes:    decision.md (final synthesis)
```

Each round is a separate bridge task. Context passes through files. Human can intervene at any turn.

## Why This Fits the Bridge System

- Sequential tasks with file dependencies — already how bridge works
- Each agent runs in an isolated CC context with a specific system prompt
- Full transparency: every argument is in markdown, readable by G at any time
- No special infrastructure needed beyond what already exists

## Ideal Use Cases

- **Architecture decisions**: Architect designs a system, Challenger attacks it for security/complexity/cost
- **Feature prioritization**: Advocate argues for a feature, Skeptic argues against
- **Risk assessment**: Optimist writes launch plan, Pessimist writes risk analysis
- **Marketing messaging**: Copywriter drafts, Critic tears it apart

## What Makes It Different From Just Thinking Harder

Two separate context windows with different system prompts means genuinely different perspectives. The Challenger's system prompt is tuned to find problems, not validate solutions. This prevents the single-agent "yes, great idea" bias.

## Implementation Notes

- Need dedicated agent definition files in `.claude/agents/` for each role
- Architect: constructive, solution-focused, defends with data
- Challenger: adversarial, problem-focused, finds edge cases and failure modes
- Summary: neutral synthesis, identifies strongest arguments on each side
- Recommend Opus for both (stakes are high, quality matters)

## Status

Not built. Design pattern only. Priority: low (bridge needs to be stable first). Blocked by: wanting Claude Code Agent Teams to mature out of experimental.
