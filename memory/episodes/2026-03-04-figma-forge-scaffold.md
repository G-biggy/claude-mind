---
date: 2026-03-04
task: figma-forge-scaffold
status: success
---

# Episode: Figma Forge Plugin Scaffold

## What happened

Scaffolded the complete Figma Forge plugin project at `/Users/ghayyathhuzayen/VS-workspace/figma-forge-plugin`.

## Work done

- Created all root config files: `package.json`, `manifest.json`, `tsconfig.json`, `tsconfig.sandbox.json`, `vite.config.ts`, `esbuild.config.mjs`, `tailwind.config.js`, `postcss.config.js`, `vitest.config.ts`, `.gitignore`
- Created source files: `src/sandbox/code.ts`, `src/ui/main.tsx`, `src/ui/ui.html`, `src/ui/App.tsx`, `src/ui/styles/globals.css`, empty dirs `src/shared/` and `src/__tests__/`
- `npm install` — 236 packages installed
- `npm run build` — produces `dist/code.js` (sandbox, esbuild) and `dist/ui.html` (React, Vite + singlefile)
- `npm run typecheck` — zero errors after fixing sandbox tsconfig
- `npm run test` — passes with no test files (passWithNoTests: true)

## Issues fixed during scaffold

1. **Output filename**: Vite was outputting `dist/index.html`. Fixed by renaming `src/ui/index.html` → `src/ui/ui.html` and adding `rollupOptions.input` to vite.config.ts.
2. **Sandbox typings**: `tsconfig.sandbox.json` used `typeRoots` which didn't pick up `@figma/plugin-typings`. Fixed by switching to `"types": ["@figma/plugin-typings"]`.
3. **Test runner exit 1**: Vitest exits 1 with no test files by default. Added `passWithNoTests: true` to vitest config.
4. **ESM warning**: Added `"type": "module"` to package.json to eliminate PostCSS/Node ESM warning.
