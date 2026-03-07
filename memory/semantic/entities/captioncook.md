---
type: entity
status: active
created: 2026-03-04
last_relevant: 2026-03-04
related_entities: [g-career, claude-bridge, claude-mind]
related_themes: [monetization, ai-agent-architecture]
---

# Caption Cook

## What
A recipe/cooking PWA that uses Claude's vision API to parse recipes from text, URLs, or screenshots into a structured, scalable format. G's primary consumer product in early 2026.

## Timeline
- 2026-02-03: Deep brainstorm session — concept locked, architecture decided
- 2026-02-07: Free tier evolution — "5 lifetime saves" model chosen (hardest cap)
- 2026-02-21: Paddle chosen as payments processor (MoR model, no US entity needed)
- 2026-03-01: Marketing site went live in waitlist mode at captioncook.app

## Current Status
Waitlist live. App in development. Launch pricing: $2.99/mo, $19.99/yr, $39.99 lifetime.

## Key Architectural Facts
- Stack: Next.js + Supabase + Claude API + Paddle
- Single API call does parse + nutrition + unit conversion (no separate OCR)
- Free tier: 5 lifetime saves, no reset, no restoration on delete
- 480px width cap (mobile-first, web-rendered)
- App: my.captioncook.app (Vercel), Marketing: captioncook.app (VPS/nginx)

## Source Episodes
- 2026-02-03-caption-cook-deep-brainstorm.md
- 2026-02-09-free-tier-hardest-cap.md
- 2026-03-01-waitlist-launch.md
