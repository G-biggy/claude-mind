# Episode: figma-forge-plugin — Types, Constants, and Utility Functions

**Date:** 2026-03-04
**Task:** figma-forge-types-utils
**Project:** figma-forge-plugin

## What Happened

Built the shared types, constants, and utility layer for the figma-forge Figma plugin. This is Task 2 of the scaffold — providing the foundation that auditors and collectors will use.

## What Was Built

### Shared Layer (src/shared/)
- `types.ts` — Full type system: Issue, HealthReport, CategoryScore, all Collected* data shapes, RGBA/LAB color types, message union types
- `constants.ts` — Category weights, naming patterns, spacing scales, score colors, thresholds

### Sandbox Utilities (src/sandbox/utils/)
- `color-utils.ts` — Figma linear RGB → sRGB conversion, CIELAB color space, deltaE distance, hex conversion, nearest variable finder
- `naming-utils.ts` — Generic name detection, delimiter/casing detection, hierarchy level counting, mixed delimiter checking
- `scoring.ts` — Category score calculation (pass/total), weighted overall score, score color thresholds, issue ID generation
- `traversal.ts` — Figma SceneNode type guards (isFrameNode, isTextNode, isInstanceNode, etc.)

### Tests (src/__tests__/)
- `color-utils.test.ts` — 30 tests (rgbaToHex, deltaE, findNearestVariable, colorsAreEqual, linearToSRGB)
- `naming-utils.test.ts` — 45 tests (isGenericName, detectDelimiter, detectCasing, countNamingLevels, hasMixedDelimiters)
- `scoring.test.ts` — 31 tests (calculateCategoryScore, calculateOverallScore, getScoreColor, generateIssueId)

## Results

- 106/106 tests passing
- `npm run typecheck` — clean (both tsconfig.json and tsconfig.sandbox.json)
- `npm run build` — dist/ produced successfully

## Config Changes

Had to add path aliases (`@shared/`, `@sandbox/`, `@ui/`) to:
- `tsconfig.json`
- `tsconfig.sandbox.json`
- `vitest.config.ts`
- `vite.config.ts`
- `esbuild.config.mjs`

Path aliases were not present in the scaffold from Task 1 — added them as a prerequisite for the imports to work.

## Key Technical Decisions

- Figma uses linear RGB (0-1), not sRGB — the color utilities do the correct linearToSRGB conversion before hex output
- deltaE uses CIE76 (simpler than CIE2000 but sufficient for design system checking)
- `traversal.ts` uses `/// <reference types="@figma/plugin-typings" />` instead of imports since the Figma API types are ambient globals
- Tests avoid any Figma API calls — all utilities are pure functions testable in Node
