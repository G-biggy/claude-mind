---
date: 2026-03-04
project: figma-forge-plugin
task: Task 3 — Collectors
---

Built the full Figma API collector layer (5 files) for figma-forge-plugin. Typecheck and build both passed clean. Auto-chained Task 4.

Key pattern: Figma's `node.fills` can be `typeof figma.mixed` on text nodes — needs cast `(node as { fills: ReadonlyArray<Paint> | typeof figma.mixed }).fills` to compare safely in TypeScript strict mode.
