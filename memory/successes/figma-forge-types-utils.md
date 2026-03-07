# Success: figma-forge-plugin Types & Utils Layer

**Date:** 2026-03-04
**Project:** figma-forge-plugin

## What Shipped

Complete shared types, constants, and utility layer for the figma-forge Figma plugin.

- 106 tests, all passing
- TypeScript clean on both main and sandbox tsconfigs
- Build produces dist/ without errors

## Key Pattern: Figma Path Aliases Setup

For Figma plugins using esbuild + vite + vitest, path aliases need to be set in 4 places:
1. `tsconfig.json` (UI + shared) — `paths` + `baseUrl`
2. `tsconfig.sandbox.json` (sandbox + shared) — `paths` + `baseUrl`
3. `vitest.config.ts` — `resolve.alias` using `path.resolve(__dirname, ...)`
4. `vite.config.ts` — `resolve.alias` in defineConfig
5. `esbuild.config.mjs` — `alias` in build config object

## Figma Color Math

Figma stores colors as linear RGB (0-1), not sRGB. Must apply gamma correction before converting to hex:
- Values <= 0.0031308: multiply by 12.92
- Values > 0.0031308: 1.055 * v^(1/2.4) - 0.055
