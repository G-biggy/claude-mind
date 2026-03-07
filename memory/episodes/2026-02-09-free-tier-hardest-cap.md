# Free Tier Evolution — The Hardest Cap

**Date:** 2026-02-09
**Significance:** One of the most important business decisions in Caption Cook's development. The free tier went from generous monthly resets to the simplest possible model: 5 lifetime saves, full stop.

## The Journey

Started with G asking about unit economics of free users. This opened a deep conversation about cost exposure.

**Model A (what was built):** 5 new parses per month, accumulating indefinitely. A free user active for a year costs 60 API calls. Basically unlimited in slow motion.

**Model C (chosen first):** 5 max storage + 5 parses/month. Tightest option. Prevents rotate-and-churn abuse. G chose this one initially.

**Then the breakthrough.** G said: "what not 5 parses even, hardest cap. That's it. No renewing. No deleting. They filled their quota. App will be useless unless they subbed?"

That was the moment. I said: "Honestly? I think this is the cleanest model."

## Why It Won

- Dead simple to explain: "5 free recipes. Want more? Subscribe."
- Zero ongoing cost from free users. Ever.
- No monthly counter logic, no reset dates, no edge cases.
- Deletion does NOT restore saves — lifetime_saves_used only goes up.
- Clear moment of truth: they've tried it, they know the value, now decide.

## Implementation Impact

This was a significant refactor. I mapped every file and line that needed changing — 10 code files, 2 docs, 12 files total. Created a detailed CC handoff prompt with exact code changes, line numbers, and constraints ("do NOT decrement lifetime_saves_used on delete").

## The Key Insight

Hard caps work better than monthly resets for SaaS cost control. Simpler code, simpler explanation, tighter expense management. G wishes he'd understood this earlier to save the extra work.
