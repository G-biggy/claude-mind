---
date: 2026-03-04
slug: figma-forge-collectors
task: figma-forge-collectors (Task 3)
status: success
---

# Figma Forge — Collectors Layer (Task 3)

## What Was Built

5 collector files for the figma-forge-plugin Figma sandbox:

- `src/sandbox/collectors/variable-collector.ts` — `collectVariables()` using `figma.variables.getLocalVariables/Collections()`
- `src/sandbox/collectors/style-collector.ts` — `collectPaintStyles()` + `collectTextStyles()`
- `src/sandbox/collectors/component-collector.ts` — `collectComponents(scope)` with BFS per page, suspected detachment heuristics
- `src/sandbox/collectors/node-collector.ts` — `collectNodes(scope, onProgress)` — BFS with chunked yielding, extracts colors/spacing/naming/text nodes
- `src/sandbox/collectors/index.ts` — `collectAll(scope, onProgress)` orchestrating all collectors

## Key Decisions

- `NodeCollectionResult` extended to include `typography.textNodes` (not in task spec, but needed to populate `AllCollectedData.typography`)
- `figma.mixed` comparison needed cast: `(node as { fills: ReadonlyArray<Paint> | typeof figma.mixed }).fills` to avoid TS2367
- Spacing variables extracted from FLOAT-typed non-alias variables in orchestrator
- Color variables extracted from COLOR-typed non-alias variables, resolving from `valuesByMode`

## Result

- `npm run typecheck` — PASSED
- `npm run build` — PASSED
- Task 4 (auditors) auto-chained to bridge queue
