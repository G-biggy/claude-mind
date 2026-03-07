---
type: episode
date: 2026-02-06
tags: [icondex, strategy, planning, tauri, desktop-app]
significance: high
source: sage
---

# IconDex — Project Conceived and Documented

**Date:** 2026-02-06
**Significance:** New project kickoff. Full strategy built across multiple sessions, then all docs created in one go.

## Origin

IconDex started from G's frustration with local icon library browsing. Svgsus (the best tool for this) is abandoned. IconJar is Mac-only and subscription-based. The gap was clear: a free, cross-platform, Tauri-based icon viewer.

## Strategy Sessions (pre-docs)

Four sessions built out the full product strategy:
1. Initial concept and competitive landscape
2. Feature definition: folder linking, fuzzy search, copy-as-code, export
3. Tech stack locked in: Tauri 2.0 + React + TypeScript + Tailwind
4. Branding concept: Pokédex creature + ball-inspired mark. "icondex.app" domain registered.

## What Was Decided

- **Free-first model** — core features always free
- **One-time Pro unlock** at $9–15 when ready (no subscription, counter-positioning against IconJar)
- **Aptabase** for anonymous analytics (privacy-first, no accounts needed)
- **Payment (future):** Paddle or Gumroad — NOT LemonSqueezy (acquired by Stripe July 2024)
- **Open source / MIT** license

## Documentation Created

All files written to `~/VS-workspace/icondex/`:

| File | Size | Contents |
|------|------|----------|
| `CLAUDE.md` | 10KB | Coding rules for Claude Code |
| `README.md` | 5KB | Project overview, setup, structure |
| `docs/PRD.md` | 14KB | Full product spec, features, architecture, UI wireframes |
| `docs/TASKS.md` | 15KB | 10 phases, dependency-ordered, complexity-rated |
| `docs/BUSINESS_RULES.md` | 5KB | Free/Pro tier logic, pricing, licensing |
| `docs/privacy-policy.md` | 4KB | Lightweight desktop-focused, no PII |
| `docs/terms-of-use.md` | 4KB | EULA for desktop software |

## Key Differences from Caption Cook Docs

- No cookie policy (desktop app, no cookies)
- Much simpler privacy policy (no accounts, no database, no payments in MVP)
- "Terms of use" instead of "Terms of service" (EULA framing fits desktop better)
- CLAUDE.md at project root (not in docs/) so CC picks it up automatically

## 10 Development Phases

Phase 0 (env setup) → Phase 1 (app shell) → Phase 2 (folder management) → Phase 3 (icon display) → Phase 4 (preview & copy) → Phase 5 (export) → Phase 6 (settings) → Phase 7 (analytics & polish) → Phase 8 (build & distribution) → Phase 9 (landing page & launch)

## CC Workflow Defined

G will hand to Claude Code with: "Read docs/TASKS.md and docs/PRD.md. We're starting from Phase 0. Work through tasks in order. Stop and check in at end of each Phase before moving to the next."

Lesson applied from Caption Cook: one phase per session max, fresh context is better than long sessions.
