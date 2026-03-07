---
type: knowledge
date: 2026-03-03
tags: [caption-cook, branding, logo, design, identity]
confidence: 0.9
significance: medium
source: sage
related: [./caption-cook-marketing.md]
last_accessed: 2026-03-03
access_count: 0
---

# Caption Cook — Branding & Visual Identity

## Brand Concept

"Caption Cook" = "Captain Hook" wordplay. Pirate-chef mashup. The concept is about "capturing" recipes from social media — piracy as playful metaphor. This is the core brand identity and should not be abandoned.

## Naming

- **"Caption Cook"** (with space) — all user-facing branding, logotype
- **"CaptionCook"** (no space) — URLs, domains, social handles
- Tagline: **"Capture. Count. Cook."**
- Descriptive: **"Turn any recipe into Protein, Carbs and Fat."**

## Logo System — 3 Variants

The logo had a scalability problem — looked great big, became cluttered at small sizes. Solved with a three-variant system:

1. **Horizontal** — Icon + "Caption Cook" side by side. Chef hat top aligns with cap-height of C, mustache anchors at baseline. Used for navbar, marketing header, OG images.
2. **Stacked** — Icon above "Caption Cook". Used for splash screen, empty states, centered layouts.
3. **Icon only** — Pirate-chef mark, no text. Used for favicon, PWA icons, small UI spots, loading.

All exported as SVG, stored in `/public/logo/` (app) and `/assets/logo/` (marketing site).

## Typography

- **Logo font:** Fredoka (baked into SVGs, not loaded as web font)
- **Body font:** Inter (Google Fonts)
- Fredoka chosen for rounded, friendly personality that matches the playful pirate-chef character without competing with it

## Colors

- **Brand orange:** #F97316 (primary accent)
- **App theme:** Warm cream (#FFF9F5 area) with orange accents — friendly, food-appropriate
- **Marketing theme:** Dark (#0A0A0A) with orange accents — bold, modern SaaS-style

## Favicon Pipeline

- `favicon.svg` — pirate-chef icon, orange outline for visibility on light/dark tabs
- `favicon.ico` — 16x16 + 32x32 combined
- Generated via RealFaviconGenerator
- PWA icons: 192x192 and 512x512 PNG with orange background
- Maskable icon: 512x512 with 20% safe zone padding
- Apple-touch-icon: 180x180 with orange background

## OG Image

1200×630, includes logo + tagline. Stored as og-image.png in assets.

## Figma

All design work in Figma file: `4DIA9BVQqJGVPzXaYLaq6b`
Key node IDs referenced in handoffs:
- Logo variants: 308:766, 299:139, 321:777
- Settings: 134:981
- Pricing: 233:159
