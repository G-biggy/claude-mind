---
type: knowledge
date: 2026-03-03
tags: [caption-cook, marketing, website, gsap, branding]
confidence: 0.95
significance: high
source: sage
related: [./caption-cook-architecture.md, ./caption-cook-branding.md]
last_accessed: 2026-03-03
access_count: 0
---

# Caption Cook — Marketing Website

Knowledge about the marketing website at captioncook.app.

## Architecture

- **Single HTML file** — no build step, no framework. Vanilla HTML/CSS/JS.
- **GSAP + ScrollTrigger** from CDN for scroll animations
- **Inter** from Google Fonts
- **Dark theme** — #0A0A0A canvas with orange (#F97316) accents. Deliberately different from the app's warm cream aesthetic. Think Linear, Vercel, Arc browser marketing pages.
- Hosted on VPS via nginx. SSL via Let's Encrypt.

## The Scroll Story (Centerpiece)

Pinned GSAP ScrollTrigger animation that tells the story of using Caption Cook:

1. **"The Scroll"** — Instagram post appears, you're browsing a feed
2. **"The Capture"** — Screenshot flash washes over the post
3. **"The Import"** — Screenshot shrinks, flies into a phone frame showing the Add Recipe page
4. **"The Magic"** — AI processing animation (sparkles, scanning lines)
5. **"The Result"** — Recipe detail with macro breakdown revealed. Numbers count up.
6. **Unpin** — Phone fades, rest of page scrolls normally

Left side: synced text with headline + 2-3 lines of substance per scene.
Right side: visual transformation.

Responsive: Desktop = side-by-side. Tablet = stacked. Mobile = simplified scroll with reduced distance.

## Page Flow

Hero → Scroll Story Animation → Post-Animation CTA → How It Works (3 steps) → Features (grid) → Post-Features CTA → Pricing (3 cards + Free text link) → FAQ (5-6 collapsible) → Final CTA → Footer

## CTA Strategy

6 touchpoints throughout the page. All point to my.captioncook.app/signup. Each uses different emotional angle: "Try Free" (hero), "Ready to try it?" (post-animation), "Start cooking smarter" (post-features), "Your next recipe is waiting" (final).

Pricing cards show launch strikethrough pricing when coupons active. Free tier presented as text link at bottom, not a full card.

## Domain Structure

- `captioncook.app` → Marketing website (VPS, nginx)
- `my.captioncook.app` → PWA app (Vercel)
- Chose "my" over "go" or "app" because it implies personal ownership ("My Caption Cook") and reads better on home screen icons

## Current State: Waitlist Mode

Launch held pending business entity decision. Website live with "Coming Soon" badge, all CTAs converted to email waitlist forms backed by Supabase. Original index preserved as index-archive.html.

Waitlist table: Supabase with anon insert-only RLS policy. Credentials injected directly into HTML.

## Documentation

Full spec lives in ~/VS-workspace/captioncook-website/docs/:
- CLAUDE.md — CC reads this first
- PRD.md — Every section, all copy, all animation details
- DESIGN_SYSTEM.md — Dark theme palette, typography, components
- TASKS.md — 7 phases with checkboxes
