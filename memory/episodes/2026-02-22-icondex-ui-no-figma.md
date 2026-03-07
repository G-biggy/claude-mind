---
type: episode
date: 2026-02-22
tags: [icondex, ui, design-system, figma, workflow]
significance: medium
source: sage
---

# IconDex — UI Without Figma Decision

**Date:** 2026-02-22
**Significance:** G decided to build the UI entirely in code, skipping Figma. Strategy defined.

## The Question

G asked: "Can I build the IconDex UI without touching Figma?"

Answer: Yes. For a utility app at this scale with this stack, it's actually the *better* approach.

## Svgsus Research

Researched Svgsus (svgs.us) by Department Stockholm — G's main inspiration:
- Compact floating window
- Grid view of SVG icons
- Dark/light themes
- Drag-and-drop to Figma/Sketch/code editors
- No decorative elements, pure function
- Tight spacing, monochromatic palette
- Direct tool integration

Svgsus stopped working when macOS changed its native APIs. Tauri gives IconDex cross-platform durability Svgsus never had.

## Features from Svgsus Worth Adding to IconDex Pipeline

- Synced folder support (team sharing across machines)
- Multi-format code export (React, Vue, Flutter, SwiftUI)
- Auto-clean SVG processing (SVGO built-in)
- Subfolder grouping
- Tag-based filtering
- Per-set color tinting

All earmarked for Pro tier.

## The No-Figma Workflow

1. **Design tokens first** — define color, spacing, radius, shadows in `tailwind.config.ts`. Everything derives from these.
2. **shadcn/ui as base** — headless + accessible, customized with Tailwind classes.
3. **Living design system page** — `/design-system` route (dev-only, not shipped). Renders all components in all states. Replaces Figma component library.
4. **Claude Code iterates** — clear rules in CLAUDE.md mean CC can build components by description.
5. **Live in the shell first** — build the structural layout, resize, react to it with design instinct before filling it.

## Key Insight

G has 20 years of design instinct. The feedback loop of "describe → build → see → react" in a live Tauri window is faster than a Figma mockup → handoff loop. The real product *is* the prototype.

## Why This Works for IconDex Specifically

- Small utility app (low component count)
- Desktop target (no responsive complexity)
- Code-first tech stack (Tailwind, shadcn/ui)
- Tauri web-tech rendering → fast iteration
- Svgsus itself was clearly coded tight, not Figma-first
