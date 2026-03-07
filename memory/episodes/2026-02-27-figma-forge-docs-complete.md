---
type: episode
date: 2026-02-27
tags: [figma-forge, plugin, pricing, competitive, documentation]
significance: high
source: sage
---

# Figma Forge — Full Docs Suite Complete + Pricing Locked

**Date:** 2026-02-27 (session started late Feb 26)
**Significance:** Full documentation suite finalized. Monetization model defined through rigorous financial modeling. Plugin ready for Claude Code dispatch.

## What Was Built

Four additional docs added to the suite:
- `docs/TOKEN_STANDARDS.md` — Assessment rules engine, naming convention analysis, source authorities (Nathan Curtis, Brad Frost, W3C DTCG). 13KB.
- `docs/COMPETITIVE.md` — Full market positioning vs. AI generation plugins, Figma Check Designs, Figma MCP. 9KB.
- `docs/PRICING.md` — Complete cost modeling, scenario analysis, unit economics. 9.5KB.
- `docs/TASKS.md` — 6 sequential CC tasks for implementation. 25KB.
- `CLAUDE.md` — Project root entry point for Claude Code. Covers architecture, do/don't list, doc navigation.

**Interactive prototype built:** Full Figma Forge plugin UI as a React artifact. Both light/dark themes. Assess, Fix, and Create (chat) tabs. Functional scan simulation with health scores and issue cards.

## Pricing Decision

G challenged the initial $2/user profit math. Revised modeling showed much healthier unit economics once it was clear:

1. Assess is 100% local — free users who only use it cost $0
2. Fix is mostly local computation (color matching, style application) — only ambiguous cases need AI
3. Create is the only heavy Claude feature

Revised: ~$0.04/message × 3–5 messages/day × 22 days = $2.60–4.40 cost + $0.96 Paddle fee = **$6.60–8.40 net profit per Pro user**.

**Final pricing: Free + $12/month Pro. No other tiers.**
- Free: Unlimited Assess (costs $0), 3 lifetime AI credits
- Pro: Unlimited AI (Create, Fix, recommendations)
- Credit-based free tier (not time-based) — abuse-resistant

## Competitive Positioning

Primary target: Figma Professional plan users ($15/month) who won't upgrade to Organization ($45/month) just for design system tooling. Figma Forge gives them better tooling for $12/month.

Key differentiation: AI generation plugins create with hardcoded values. Figma Forge creates using the user's actual tokens and spacing scale. Nobody else does this.

Timing urgency: Figma Check Designs is expanding. Must ship and establish user base before it reaches Professional plans.

## End State

Full 8-doc suite at `figma-forge-plugin/docs/`. G reviewed docs on his Mac and confirmed they were ready. Plugin project is documentation-complete and ready for first CC task dispatch (Phase 1 health check engine scaffold).
