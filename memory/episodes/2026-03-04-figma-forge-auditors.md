# Episode: Figma Forge — Task 4 Auditors + Tests

**Date:** 2026-03-04
**Project:** figma-forge-plugin
**Task:** figma-forge-auditors

## What Happened

Implemented Task 4 of the Figma Forge plugin: 6 auditors + orchestrator + 7 test files (177 total tests).

## Files Created

### Auditors (`src/sandbox/auditors/`)
- `color-auditor.ts` — checks solid fills/strokes for token/style binding
- `typography-auditor.ts` — checks text nodes for style binding
- `spacing-auditor.ts` — detects scale from variables, validates frame spacing
- `component-auditor.ts` — classifies instances as healthy/overridden/detached
- `naming-auditor.ts` — flags generic auto-generated layer names
- `token-auditor.ts` — weighted 4-sub-score token architecture analysis
- `index.ts` — orchestrator combining all 6 auditors into HealthReport

### Tests (`src/__tests__/auditors/`)
- 7 test files covering all auditors + orchestrator

## Key Decisions

- **Color auditor**: deltaE ≤ 1 → warning, 1–3 → info, no match → critical. Score per-node (pass if ALL solid fills bound).
- **Spacing auditor**: detects scale from variable names with "spacing/space/gap" keywords. Near-scale = within 2 units (warning), further = critical.
- **Component auditor**: overrideCount ≤ 3 = healthy, 4–5 = info, >5 = warning, isDetached = critical. Suspected detachments are separate (don't affect score denominator).
- **Token auditor**: 4 weighted sub-scores: alias depth (30%), naming consistency (20%), coverage (30%), usage (20%). Circular references → critical.
- **Orchestrator**: accepts optional RunAuditOptions for scope/fileName/pageName.

## Results

- `npm run test`: 177/177 passed ✅
- `npm run typecheck`: passed ✅
- `npm run build`: succeeded ✅
- Next task (figma-forge-sandbox-entry) queued in bridge.
