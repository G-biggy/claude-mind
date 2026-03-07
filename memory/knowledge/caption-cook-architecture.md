---
type: knowledge
date: 2026-03-03
tags: [caption-cook, architecture, tech-stack, decisions]
confidence: 0.95
significance: high
source: sage
related: [../episodes/2026-02-03-caption-cook-deep-brainstorm.md, ./g-projects.md]
last_accessed: 2026-03-03
access_count: 0
---

# Caption Cook — Technical Architecture

Comprehensive technical knowledge about the Caption Cook PWA.

## Stack

- **Framework:** Next.js (App Router) with TypeScript
- **Database:** Supabase (PostgreSQL + Auth + RLS)
- **Payments:** Stripe (checkout, webhooks, customer portal, dynamic pricing)
- **AI:** Claude API (claude-3-5-haiku-latest) — handles recipe parsing AND nutrition estimation in a single call
- **Styling:** Tailwind CSS
- **Hosting:** App on Vercel at my.captioncook.app, marketing site on VPS via nginx at captioncook.app

## Three Input Methods

1. **URL** — works for blogs and recipe sites. Social media URLs (Instagram, TikTok, Facebook) are explicitly rejected with a friendly error directing users to screenshots instead.
2. **Text paste** — user pastes recipe text directly. Cheapest API cost.
3. **Screenshot** — 1-5 images (JPEG/PNG/WebP). Uses Claude's vision capabilities. Most expensive per-parse but most reliable for social media recipes. This is the killer feature.

## Key Architectural Decisions

- **Single API call does everything.** Parse + nutrition + unit conversion all happen in one Claude call. No separate OCR step, no JS-side math. Claude returns ingredients in 3 formats (original, metric, imperial) with structured amounts so JS can scale for serving adjustments.
- **Stripe as single source of truth.** Prices and coupons are fetched dynamically from Stripe via `/api/stripe/launch-offer` endpoint. No hardcoded prices in the codebase. Changing prices or toggling coupons in Stripe dashboard immediately reflects in the app.
- **480px width cap.** Mobile-first design that caps at 480px even on desktop. The app is essentially a mobile app rendered on web.
- **PWA-first.** No native app. Installable via browser. TWA/APK wrapper considered for future Android distribution but deferred until product-market fit.

## Parsing Architecture

- Non-recipe content (news articles, selfies, travel blogs) is rejected at a validation gate before processing
- Only ingredients are a hard requirement. Title is auto-generated if missing. Instructions are fully optional.
- All parsing failures show one unified message: "Hmm, we couldn't find a recipe in that. Try a different link, text, or screenshot."
- Nutrition estimation failures show dashes (—) not error messages

## Supabase Schema (Key Fields)

- `profiles` table: `stripe_customer_id`, `subscription_status`, `subscription_plan`, `subscription_end_date`, `lifetime_saves_used`
- `recipes` table: `source_platform` (website, screenshot, text), `title`, `ingredients` (JSONB with original/metric/imperial), `instructions`, `nutrition` (JSONB)
- `waitlist` table: `email` (unique), `created_at` — used for pre-launch email collection

## Project Structure

- App: `~/VS-workspace/caption-cook/`
- Marketing site (static HTML): `~/VS-workspace/captioncook-website/`
- Website (Next.js, secondary): `~/VS-workspace/caption-cook/website/`
- Documentation lives in `docs/` within each project: PRD.md, BUSINESS_RULES.md, DESIGN_SYSTEM.md, TASKS.md, CLAUDE.md
