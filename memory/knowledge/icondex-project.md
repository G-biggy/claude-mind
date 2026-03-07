# IconDex Project

## What It Is

A cross-platform desktop icon viewer built with Tauri 2.0. Lets designers and developers browse, search, and copy icons from local folders as SVG code, React components, or Vue components.

- **Website:** icondex.app (domain registered)
- **Where:** ~/VS-workspace/icondex/
- **Status:** Documentation complete. Development not yet started as of Mar 2026.

## The Problem It Solves

Designers and developers who maintain local icon libraries have no good way to browse them. Finder is terrible for this. The best tool (Svgsus by Department Stockholm) was discontinued years ago. IconJar exists but is subscription-based and Mac-only. IconDex fills the gap: free, cross-platform, lightweight, code-first output.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Tauri 2.0 |
| Frontend | React + TypeScript |
| Styling | Tailwind CSS + shadcn/ui |
| Backend | Rust (via Tauri) |
| Analytics | Aptabase (privacy-first, open-source) |
| Build | Tauri CLI + GitHub Actions |

## Inspiration: Svgsus

Svgsus (svgs.us) by Department Stockholm. Minimalist floating window, grid view of SVGs, drag/drop, code export. Now abandoned. Key takeaways from it:
- No decorative elements, just function
- Tight spacing, monochromatic palette
- Direct integration with Figma and VS Code
- Compact floating-window aesthetic

## Free Tier (MVP)

- Folder linking — point at any local folder, watches for changes
- Instant fuzzy search across all linked folders
- Copy as: SVG markup, React component, Vue SFC, filename, file path
- Export: SVG, PNG (16/24/32/48px), PDF
- Dark/Light mode (follows system or manual toggle)
- Icon preview panel with metadata
- Cross-platform: macOS, Windows, Linux

## Pro Tier (Future — Not Yet Built)

| Feature | Notes |
|---------|-------|
| Batch export | Select N icons → export all at multiple sizes |
| Icon-to-screen mapping | Assign icons to screens/flows — unique feature |
| Icon diffing | Compare v1 vs v2 of an icon set |
| SVGO optimization | Bulk SVG cleanup/minification |
| Icon font generation | Export as .woff2 font |
| Export as code files | Save React/Vue files to disk |
| Synced folder support | Team collaboration across machines |
| Subfolder grouping | Nested visual hierarchy |
| Tag-based filtering | Custom tags per icon |
| Per-set color tinting | Remap icon colors per folder |

**Pro Pricing:** One-time unlock, $9–15. No subscription. Counter-positioning against IconJar's subscription model.

**Payment:** Originally noted Gumroad or LemonSqueezy. LemonSqueezy is now under Stripe (acquired July 2024) — use Paddle or Gumroad instead.

## Business Model

- Free-first: core functionality always free
- One-time Pro unlock when ready (not subscription)
- Open source / MIT license
- No ads, no accounts required
- Total launch cost: $14–113/year (just domain + optional Apple dev account)

## Data & Privacy

- No server, no database, no cloud sync in MVP
- Local storage only: `~/.icondex/` folder (folders.json, settings.json, collections.json, license.json)
- Only internet: Aptabase anonymous analytics, opt-out available
- Desktop app → no cookie policy needed

## Development Approach

- Code-first, no Figma
- Design tokens in `tailwind.config.ts` first
- Build structural shell before features
- Living design system page (`/design-system` route, dev-only) as Figma replacement
- shadcn/ui as accessible component foundation
- 10 phases in TASKS.md, sequential with CC checkpoints

## UI Design Principles (from Svgsus research)

- Compact floating window, not a full-screen app
- Minimalist: no decorative elements
- Tight spacing
- Monochromatic palette
- Direct integrations (Figma plugin drag-drop, VS Code copy)
- Two/three-pane layout: Sidebar + Icon Grid + Preview panel
- Desktop-specific: keyboard-first, command palette, tray icon

## Project Structure

```
icondex/
├── CLAUDE.md          — Coding rules for Claude Code
├── README.md          — Project overview
└── docs/
    ├── PRD.md         — Full product spec (14KB)
    ├── TASKS.md       — 10 phases, dependency-ordered (15KB)
    ├── BUSINESS_RULES.md — Free/Pro tier logic
    ├── privacy-policy.md — Desktop-focused, lightweight
    └── terms-of-use.md  — EULA
```

## Tauri App References (for design inspiration)

- **Spacedrive** — file manager, very polished
- **EcoPaste** — clipboard manager, compact
- **Yaak** — REST/GraphQL client
- **Kanri** — Kanban board, Tauri 2.0 + Vue 3, kanriapp.com

## Roadmap

- v1.0 — MVP core features
- v1.1 — Vue component copy
- v1.2 — Broken SVG detection
- v1.3 — Icon size preview
- v1.4 — Color override preview
- v1.5 — Collections & tags
- v1.6 — Drag & drop into Figma/VS Code
- v1.7 — Flutter/SwiftUI export
- v1.8 — Design token integration
