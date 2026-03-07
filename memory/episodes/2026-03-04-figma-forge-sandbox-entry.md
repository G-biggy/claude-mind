---
date: 2026-03-04
slug: figma-forge-sandbox-entry
task: Task 5 — Figma Forge sandbox entry point (code.ts)
status: success
---

# Episode: Figma Forge code.ts

Replaced the placeholder `src/sandbox/code.ts` with the full wired-up entry point.

## What was done

- Imported `UIMessage` / `SandboxMessage` from `@shared/types`
- Imported `collectAll` from `./collectors` and `runAllAuditors` from `./auditors`
- Wired up `figma.ui.onmessage` with a typed switch on `UIMessage`
- `RUN_HEALTH_CHECK`: sends progress messages, calls `collectAll`, then `runAllAuditors`, posts `HEALTH_REPORT`
- `SELECT_NODE`: uses `figma.getNodeById`, validates it's a SceneNode, sets selection + scrolls viewport; sends `ERROR` if node is null or not a SceneNode
- `EXPORT_REPORT`: no-op stub for MVP
- Unknown message types silently ignored
- Full try/catch wrapper sends `ERROR` on any exception

## Build results

- `npm run build` — passed (sandbox + UI)
- `npm run typecheck` — passed (tsc + tsconfig.sandbox.json)

## QA file written

`/Users/ghayyathhuzayen/VS-workspace/claude-bridge/results/figma-forge-sandbox-entry-qa.md`
