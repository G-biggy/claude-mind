---
type: knowledge
date: 2026-03-03
tags: [caption-cook, business, pricing, stripe, free-tier, entity]
confidence: 0.95
significance: high
source: sage
related: [./caption-cook-architecture.md, ../episodes/2026-02-09-free-tier-hardest-cap.md]
last_accessed: 2026-03-03
access_count: 0
---

# Caption Cook — Business Model & Monetization

## Pricing Strategy

Two-phase approach:

**Launch pricing (first 2 months):** Monthly $2.99, Yearly $19.99 ("Most Popular"), Lifetime $39.99 ("Best Value")
**Regular pricing:** Monthly $3.99, Yearly $29.99, Lifetime $59.99

Launch discount implemented via Stripe coupons (not different price IDs). Three separate fixed-amount coupons: LAUNCH_MONTHLY ($1 off), LAUNCH_YEARLY ($10 off), LAUNCH_LIFETIME ($20 off). When coupons expire, regular prices show automatically. No code change needed.

All Pro tiers offer identical functionality. The only difference from Free is removal of the 5-recipe cap. Pro benefit copy is honest — doesn't pad with features Free already has.

## Free Tier — The Hardest Cap

Evolved through three models during development:
- **Model A (original):** 5 new parses/month, accumulating. Way too generous — free users cost compounding API calls.
- **Model C (interim):** 5 max storage + 5 parses/month. Tighter but complex.
- **Final model (shipped):** 5 lifetime saves total. Period. No monthly reset. No restoration on delete. Once 5 saves used, app is read-only until subscription.

Why this works: dead simple to explain ("5 free recipes. Want more? Subscribe."), zero ongoing cost from free users ever, max exposure is 5 API calls per free user lifetime. No monthly counter logic, no reset dates, no edge cases.

Users keep their 5 recipes forever (view + delete). Parse/preview is unlimited — only saving counts toward the cap.

## Unit Economics

Per-parse cost varies by method:
- Text paste: ~$0.005 (cheapest)
- URL: ~$0.007 (scraping + parsing)
- Screenshot: ~$0.01-0.10 (vision processing, most expensive)

Even at aggressive pricing ($2.99/mo), profitable unless a user parses 370+ recipes/month (unrealistic). Lifetime $39.99 covers ~5,500 parses.

## Payment Processing — DECISION MADE: Paddle

G has a UAE golden visa with active bank account but NO trade license. Stripe UAE requires a trade license. Stripe is not available in Jordan at all.

**Decision (Feb 22, 2026): Paddle as Merchant of Record.** Stripe Atlas abandoned.

### Why Paddle Won
- MoR model: customers see "Paddle.com" on statements, not G's name
- No US LLC required immediately (can form later)
- Independent company (Lemon Squeezy was acquired by Stripe July 2024 — uncertain future)
- Handles chargebacks completely
- Supports individual sellers without business registration

### The Sub-$10 Pricing Challenge
Paddle requires custom pricing approval for sub-$10 products. G's monthly tiers ($2.99/$3.99) technically fall under this. Outreach sent to Paddle sales team framing Caption Cook as a full SaaS with blended revenue (yearly $19.99-29.99, lifetime $39.99-59.99). Waiting for approval/demo booking.

### Impact
The existing Stripe integration (checkout, webhooks, customer portal, coupons) needs to be rebuilt for Paddle. Stripe Atlas and all associated costs ($500 formation + Delaware franchise tax etc.) avoided for now.

### Stripe Atlas Path (Evaluated but Abandoned)
Was briefly the plan: $500 upfront, $300 Delaware franchise tax at 4 months, $100 agent renewal at 12 months, ~$300 CPA at 14 months. $2,500 Stripe processing credits included. Abandoned in favor of Paddle's simpler international path.

Website deployed in waitlist mode during Paddle approval process.

## Subscription Management

- Monthly/Yearly: Show "Manage Subscription" button → Stripe Customer Portal
- Lifetime: Hide manage button — nothing to manage, it's a one-time purchase
- Cancellation: Users keep ALL recipes (no deletion). Recipes become view-only. Cannot add new recipes until re-subscribed. No data loss.

## Transactional Emails

MVP: Stripe's default emails (shows "Ghayyath Huzayen" as business name). Deferred custom branding via Resend (free tier: 3,000 emails/mo) to post-launch. Statement descriptor set to "CAPTION COOK" so credit card statements look right.

## Multi-Product Strategy

Stripe set up under G's personal name (sole proprietor), not Caption Cook specifically. Future products (expense tracker, etc.) will be additional products under the same Stripe account. Each product gets its own statement descriptor.
