# CV Optimizer — Solo Breakdown After Anton Drops Out

**Date:** 2026-02-17
**Significance:** G goes solo on cv-optimizer. First full project audit reveals zero code despite "complete" specs.

## What Happened

G explained the full cv-optimizer concept from scratch and asked for an honest breakdown of what existed vs. what he envisioned. He shared the project was at `/Users/ghayyathhuzayen/VS-workspace/cv-optimizer` and that his collaborator (Anton/CC) had lost interest.

## What Was Found in the Project

- **Spec docs (PRD, Specs, Design, Tasks, Security):** Marked complete through Phase 6. Thorough. Overengineered.
- **Actual code:** ZERO. Only default Next.js boilerplate.
- **Abandoned prototype:** `_cv-adapter` folder, from May 2025.
- **`context/Strategy.md` (written by CC):** The real gem. Anton had identified gaps between specs and G's vision before losing interest. This became the real roadmap.
- **`_CV samples` folder:** 20 good / 20 bad CV examples with scoring rubrics. Research that should feed AI prompts.

## CC's Strategy Analysis (Sage's Assessment)

CC correctly identified:
1. Original specs missed the fit/reject screening entirely — the core differentiator
2. Specs were an 8-phase plan, overengineered for solo dev
3. Proposed 3-phase streamlined approach
4. Credit-based pricing (5/$5, 15/$12, 30/$20) with free fit analysis as acquisition hook
5. New `analyses` table architecture to support analyze-first flow

Sage endorsed CC's Strategy.md as source of truth. Original specs = archive only.

## Market Analysis Done

Competitors confirmed:
- Jobscan: $49.95/mo subscription
- Teal: $9/mo subscription
- CVOptimiser.com: ~$1/credit pay-per-use

G's credit model + free fit screening = real market gap. No one offers reject-before-you-apply screening.

## Sage's Additional Recommendations

- Auth: pick one method at launch. Magic link is simplest.
- CV samples folder: use for AI prompt training, don't let it sit unused
- Match score history: design data model to capture it even if dashboard is v1.1
- Original specs: archive, don't try to reconcile with new direction

## Source Conversation

https://claude.ai/chat/aead573c-6fa8-4f0b-8b83-482cfbed443d
