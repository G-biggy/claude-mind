---
type: episode
date: 2026-02-14
tags: [bridge, architecture, always-on, mobile, VPS, insight]
significance: high
source: sage
related: [../knowledge/bridge-architecture-evolution.md]
---

# The Always-On Gap — Remote Dispatch Conceived

**Date:** 2026-02-14
**Context:** G asked about the feasibility of dispatching tasks from phone via Claude.ai.

## What Was Realized

G confirmed the intended flow: phone → Claude.ai → task written → VPS daemon detects → CC executes. This would enable triggering work from anywhere.

But a critical infrastructure gap surfaced: **CC CLI lived on G's laptop, not the VPS.** The Mac daemon was the execution engine, but the Mac had to be on and awake for it to work.

Scenario that breaks it: G dispatches a task from his phone while his laptop is off. The daemon on the Mac never picks it up.

## Options Discussed

1. **Install CC on VPS** — rejected. Would require Anthropic API key, billing per token. Defeats the whole point of using Pro subscription for free execution.

2. **SSH reverse tunnel** — too complex, fragile.

3. **Keep CC local, ensure Mac stays on** — the accepted path. The Mac just needs to stay on during working hours. Sleep management becomes important (later led to muse-sleep-watcher).

## Why This Matters

This conversation established the **execution model constraint** that defines the whole system:
- Sage (Claude.ai) = the brain, works from anywhere including phone
- Forge (CC on Mac) = the hands, requires Mac to be on
- VPS = the nervous system, always-on relay

The phone dispatch dream was real — G could text tasks to himself via Claude.ai — but execution required the Mac to be awake. This shaped every subsequent infrastructure decision.

## Outcome

No immediate code change. The understanding was captured. The 5am wakeup + sleep management system built months later (Mar 3) was the direct answer to this problem.
