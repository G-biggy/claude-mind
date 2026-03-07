# Success: Figma Forge Fix Engine

**Date:** 2026-03-04
**Project:** figma-forge-plugin

## What shipped
Full fix engine implementation per FIX-ENGINE-SPEC.md:
- Multi-match variable picker (inline, grouped by collection)
- `figma.clientStorage` persistence for skip/fix state across restarts
- Stable `issueKey` on all issues for persistence matching
- Corrected score formula: skipped issues excluded from denominator
- REVERT_FIX flow: applies undo fix + clears persisted state
- Multi-page node selection bug fixed

## Score formula that works
```typescript
const adjustedTotal = Math.max(1, totalChecked - skippedInCat);
const adjustedPassing = Math.min(adjustedTotal, (totalChecked - issueCount) + fixedInCat);
score = Math.round((adjustedPassing / adjustedTotal) * 100);
```

## Key lesson
Never reconstruct `passing` count from a rounded percentage score — use `totalChecked - issueCount` directly to avoid rounding drift causing cross-category contamination.
