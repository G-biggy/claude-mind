---
type: knowledge
date: 2026-03-03
tags: [cv-optimizer, project, job-search, pricing, anton, solo]
confidence: 0.95
significance: high
source: sage
related: [./g-projects.md, ../episodes/2025-12-29-cv-optimizer-origin.md, ../episodes/2026-02-17-cv-optimizer-breakdown.md]
last_accessed: 2026-03-03
access_count: 0
---

# CV Optimizer — Project Profile

## What It Is

A CV optimization tool for job seekers. Users upload a base CV and paste a job description. AI analyzes fit first — if they match, it suggests specific adjustments; if not, it spits out a rejection. The core insight: don't waste time customizing CVs for jobs you won't get.

This came directly from G's personal experience — he's been unemployed and job searching, so he built the tool he needed.

## The Workflow (Core UX)

1. User uploads/pastes base CV into profile
2. User pastes a job description
3. AI runs fit analysis → match or reject
4. If match: AI shows what needs adjustment
5. User updates their own CV (G doesn't want to force template downloads — users keep their format)

## User Profile Fields

- Base CV (foundation for all optimizations)
- Work field (critical for AI context)
- Years of experience
- Career level
- Standard contact/personal info

## Monetization

Credit-based, not subscription. Subscription is unfair to job seekers who find work quickly and no longer need the service.

**Proposed credit packs (CC's Strategy.md):**
- 5 credits for $5
- 15 credits for $12
- 30 credits for $20

**Original pricing idea (Dec 2025 meeting):** $1 per page

**Key hook:** Fit analysis is FREE. Credits are for the actual CV generation. Free fit analysis drives acquisition — people will use it to screen jobs even if they generate elsewhere.

## Competitor Landscape

| Tool | Model | Price | Notes |
|------|-------|-------|-------|
| Jobscan | Subscription | $49.95/mo | Industry gorilla |
| Teal | Subscription | $9/mo | More affordable |
| CVOptimiser.com | Pay-per-use | ~$1/credit | Closest model |
| CVTailor.ai | Unknown | — | Exists |

G's differentiator: credit-based + free fit screening. No competitors offer the reject-before-you-apply flow.

## Tech Stack

- **Frontend:** Next.js
- **Backend:** Supabase (auth, db, storage)
- **Project path:** ~/VS-workspace/cv-optimizer/
- Earlier prototype in `_cv-adapter` folder (May 2025, abandoned)

## Project History

**Oct 27, 2025 — Origin meeting with Anton:**
G and Anton (CC) met to plan the product. Anton was handling UI dev and investor pitch prep; G was handling backend and marketing. Key decisions from that meeting: pre-optimization step (improve master CV before job-specific optimization), $1/page pricing, basic dashboard analytics, 2-3 week launch timeline.

**Dec 29, 2025 — Notes added to Notion:**
Meeting notes organized into Notion CV optimizer project. Anton still involved.

**Feb 17, 2026 — Anton drops out, G goes solo:**
G requested a full breakdown. Claude analyzed the project files and discovered:
- Detailed spec docs (PRD, Specs, Design, Tasks, Security) marked "complete" through Phase 6
- ZERO actual application code — only default Next.js boilerplate
- An abandoned May 2025 prototype in `_cv-adapter`
- A crucial `context/Strategy.md` written by Anton (CC) that identified gaps between the specs and G's vision

CC's Strategy.md became the real roadmap.

## CC's Strategy.md — Key Points

Anton wrote this before losing interest. It correctly identified:
- The original 8-phase specs were overengineered for a solo dev
- Fit/reject screening was missing from specs entirely — but it's the core differentiator
- Proposed streamlined 3-phase approach
- Credit-based pricing (the packs above)
- Expanded user profile (work field, experience level)
- New `analyses` table separate from `tailored_cvs` to support the analyze-first flow

Sage's verdict: CC's strategy should be the source of truth. Original specs should be archived, not reconciled.

## Things Sage Added Beyond CC's Strategy

- Original specs should be fully archived, not used as reference
- For auth at launch: pick ONE method. Magic link is simplest (no password management, no OAuth setup).
- The `_CV samples` folder has 20 good / 20 bad CV examples with scoring rubrics — should feed AI prompts, not gather dust
- Match score data over time (10 analyses = patterns in what fields G applies to, persistent gaps) → dashboard analytics story, design data model now even if feature is v1.1

## Current Status (as of 2026-03-03)

Solo project. Zero code written beyond Next.js boilerplate. CC's Strategy.md is the roadmap. Phase 1 = fit analysis + profile + basic CV optimization. Not yet started.

This project has been dormant since Feb 17 2026 — no conversations since.
