# Caption Cook Deep Brainstorm — Foundation Session

**Date:** 2026-02-03
**Significance:** The marathon brainstorming session where Caption Cook's core architecture, business rules, pricing, and development approach were established.

## What Was Decided

This was one of the longest and most consequential conversations in the project's history. Key decisions made:

- **Single API call architecture** — Claude returns ingredients in 3 unit formats (original, metric, imperial) with structured amounts. JavaScript only displays, never converts. This solved persistent bugs with JS-side unit conversion.
- **Preview + Save flow** — Instead of two API calls (parse for preview, re-parse for details), one call gets everything. Preview shows a subset, Save reformats the same data. Cut API costs in half.
- **Pricing tiers** — Mid-range positioning with launch discount phase. Landed on $2.99/$19.99/$39.99 (launch) → $3.99/$29.99/$59.99 (regular). Analyzed unit economics down to per-parse profitability.
- **Free tier** — Initially set at 5 recipes/month (Model A). Would later evolve significantly.
- **Auth strategy** — Start without auth, add optional accounts, then require for Pro. Supabase makes this migration seamless.
- **Auto-growing textareas** — Preview page uses single textareas per field instead of complex multi-input rows. No nested scrolling.
- **No OCR dependency** — Rejected Alibaba Qwen VL OCR. Claude Haiku handles both vision and parsing in one call. Adding OCR would be a second dependency for negligible savings.

## The Vibe

G came in with big ideas and expected practical routing. Classic brainstorm-then-simplify pattern. Multiple rapid-fire questions, quick decisions, minimal hesitation. This conversation established the development pattern that carried through the rest of the project: G designs in Figma, creates detailed markdown specs, hands off to CC for implementation.
