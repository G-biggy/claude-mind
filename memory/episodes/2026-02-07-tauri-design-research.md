---
type: episode
date: 2026-02-07
tags: [icondex, tauri, design, research, ui]
significance: medium
source: sage
---

# Tauri App Design Research — Desktop UI Patterns

**Date:** 2026-02-07
**Significance:** Research session to understand what great Tauri apps look like. Informed IconDex's design approach.

## What Was Asked

G wanted guidance on UI/UX design for Tauri productivity apps, with real examples to understand visual possibilities.

## Desktop-Specific Design Principles (distilled)

- **Keyboard-first** — every action has a shortcut
- **Space utilization** — dense layouts, no wasted whitespace
- **Persistent state** — sidebar state, panel sizes, last view all remembered
- **System integration** — tray icons, native notifications, OS-aware styling
- **Two/three-pane layouts** — sidebar + main + optional detail panel
- **Command palette** — keyboard-accessible global search/actions

## Recommended Tech Stack for Tauri UI

- React (or Vue/Svelte) for frontend
- shadcn/ui or Radix UI for accessible components
- Tailwind CSS for styling
- Tauri's built-in APIs for tray, notifications, file system

## Real Tauri Apps Referenced (for design inspiration)

| App | Type | Notes |
|-----|------|-------|
| **Spacedrive** | File manager | Very polished, multi-pane |
| **EcoPaste** | Clipboard manager | Compact, utility-focused |
| **Yaak** | REST/GraphQL client | Developer tool, dense layout |
| **Kanri** | Kanban board | Tauri 2.0 + Nuxt/Vue 3. kanriapp.com — best visual reference |

**Note:** Banban was initially mentioned but only exists as a GitHub project (no website). Kanri is the better production reference.

## Relevance to IconDex

These patterns directly shaped IconDex's design direction:
- Compact utility window (not full-screen)
- Three-pane: Sidebar (folders) + Grid (icons) + Preview panel
- System tray presence for quick access
- Dense, information-rich layout
- Desktop-native feel via Tauri, not "web app in a window" feel
