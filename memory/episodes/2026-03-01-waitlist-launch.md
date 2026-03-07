# Waitlist Mode — Website Goes Live in Holding Pattern

**Date:** 2026-03-01
**Significance:** Caption Cook's marketing website deployed publicly, but in waitlist mode due to the unresolved business entity blocker.

## The Situation

The app was ready. The marketing site was ready. But launch was blocked by the Stripe business entity problem — G has a UAE golden visa but no trade license, and Stripe UAE requires one. Stripe isn't available in Jordan. The US LLC path (~$300-500) was preferred but hadn't been resolved yet.

So instead of waiting in silence, G decided to deploy a holding pattern.

## What Changed

- "Coming Soon" badge added to the site
- All 6 CTA buttons converted from signup links to email waitlist forms
- Waitlist backed by Supabase table with anon insert-only RLS policy
- Supabase credentials injected directly into the HTML (anon key only, safe with RLS)
- Original index.html preserved as index-archive.html for quick restoration at launch
- Task dispatched to CC via bridge system to test the full workflow

## Why It Mattered

This wasn't just parking a domain. The live waitlist site:
- Builds an email list of interested users before launch
- Demonstrates seriousness to Paddle during their merchant review process (G was exploring Paddle as a Stripe alternative)
- Keeps momentum going while the business entity decision is pending
- Gives G something tangible to share and point people to

## The Broader Context

The business entity challenge remained the single biggest blocker. Three paths on the table:
1. **US LLC** (~$300-500) — Preferred. Preserves existing Stripe integration entirely.
2. **UAE freelance permit** (~$1,000-2,500/yr) — More expensive, slower.
3. **Lemon Squeezy / Paddle MoR** — Requires rebuilding the entire payment system.

The waitlist was a pragmatic move to keep shipping while the business side caught up.
