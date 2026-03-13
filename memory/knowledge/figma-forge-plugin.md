# Figma Forge Plugin

## What It Is

A native Figma plugin that serves as a **design system co-pilot**. Detects health issues, applies automated fixes, and generates new designs using the user's actual design system context — all without leaving Figma.

This is a SEPARATE product from `figma-forge-mcp-server` (the CLI/Claude Desktop tool). Same brand, different product.

## Three Pillars: Assess → Fix → Create

### Pillar 1: Assess (free, 100% local)
Scans the current Figma file and generates a 0–100 health score.
- Color compliance — hardcoded hex values that should use variables
- Typography compliance — text nodes not using text styles
- Spacing consistency — non-standard spacing values
- Component compliance — detached instances, overridden styles
- Token architecture quality — alias chains, missing states, scale gaps
- Naming conventions — generic layer names ("Frame 427", etc.)
- All computation happens in Figma's local sandbox. Zero API cost.

### Pillar 2: Fix (Pro)
- One-click fixes per issue or batch by category
- Replace hardcoded colors with nearest matching token
- Apply correct text styles, normalize spacing
- Auto-rename layers
- Preview before applying; Figma's native undo support

### Pillar 3: Create (Pro)
- AI chat interface inside the plugin (Claude via Supabase Edge Functions)
- Design system context (variables, styles, components) injected into every prompt
- Generates components using the user's actual tokens, not generic hardcoded values
- "Create a card component" → uses their spacing scale, their color palette

## Tech Stack

- **Plugin sandbox (code.ts):** TypeScript, pure Figma Plugin API, no external deps
- **Plugin UI:** React 18 + Vite 5 + esbuild (Figma-recommended modern build approach)
- **Styling:** Tailwind CSS 3 + CSS custom properties for theme tokens
- **Backend:** Supabase Edge Functions proxying Claude API
- **Auth:** Supabase anonymous auth (free), email/OAuth for Pro upgrade later
- **Payments:** Paddle (not Stripe — UAE/regional constraint) on figmaforge.com
- **Build:** Vite + vite-plugin-singlefile for UI (single self-contained HTML), esbuild for sandbox
- **Testing:** Vitest for pure functions and auditors

## Critical Architecture Constraint

Figma's Plugin API sandbox only accesses the **current active file**. No cross-file analysis. This was a key discovery (Feb 28) that shaped the scope. The REST API alternative has severe rate limits (as low as 6 requests/month on Starter plans) — unusable for scanning.

Consequence: health scoring operates per-file. If a user has their design system in a separate library file, the plugin reads linked variable names from that library (already available in the current file) but can't scan the library file itself.

## Figma Plugin Dual-Environment Model

```
Sandbox (code.ts)         UI iframe (React App)
- Figma Plugin API         - Browser APIs (fetch, DOM)
- NO fetch, NO DOM         - NO Figma API access
- postMessage only  ←→     - postMessage only
                           - Calls Supabase Edge Functions
```

No localStorage/sessionStorage — use `figma.clientStorage` for persistence.
Plugin origin is `null` (CORS) — backend must allow `Access-Control-Allow-Origin: *`.

## Data Flow Architecture (Testability Pattern)

```
[Figma API] → Collector (thin, untestable) → CollectedData → Auditor (pure fn, testable) → Issues + Score
```

Collectors are dumb extractors. Auditors are pure functions that take typed data and return results. This separation is what makes 80% of the logic unit-testable without Figma runtime.

## Monetization

Two plans. Simple.

**Free — $0 forever:**
- Unlimited health checks (Assess) — costs $0 to run
- Full token architecture analysis
- 3 AI credits lifetime (enough to experience Create/Fix)
- Credit-based cap (not time-based) — prevents abuse better than trials

**Pro — $12/month via Paddle:**
- Unlimited AI Create, Fix, and recommendations
- Payments on figmaforge.com (not inside the plugin)

**Unit economics:**
- Free users who only use Assess cost $0
- AI costs ~$0.04/message × ~3-5 messages/day × 22 days = $2.60–$4.40/month
- Paddle takes ~8% of $12 = $0.96
- Net profit per Pro user: **$6.60–$8.40/month**

## Competitive Position

**Primary target:** Figma Professional plan users ($15/month) who can't justify Organization ($45/month) just for design system tooling.

**Key competitor watch:** Angelo Libero (Italian indie maker, established Figma plugin portfolio: Supa Palette, tokenhaus, Supa Design Tokens) building a general-purpose AI plugin. His weakness: vague value prop. Forge's strength: specific pain point with measurable output.

## Design System (DESIGN_SYSTEM.md)

Plugin UI follows a strict design spec. Key rules:
- Theme auto-follows Figma/system preference. No manual toggle.
- All colors as CSS custom properties. Never hardcoded hex in components.
- Dark: bg `#1e1e1e`, accent `#4fc1a6` (teal). Light: bg `#ffffff`, accent `#35a884`.
- Severity: critical `#ef4444`, warning `#f59e0b`, info `#3b82f6` (theme-invariant)
- Score colors: 90-100 green `#22c55e`, 70-89 teal `#4fc1a6`, 50-69 amber `#f59e0b`, 0-49 red `#ef4444`
- No border-radius > 8px. No heavy shadows. No external fonts. No emojis as UI elements.

## Project Files

- **Where:** `~/VS-workspace/figma-forge-plugin/`
- **CLAUDE.md** — CC entry point, mandatory reading for Forge
- **docs/ARCHITECTURE.md** — Technical deep dive, message protocol, module tree
- **docs/MVP_SPEC.md** — Phase 1 spec, TypeScript types, scoring formulas
- **docs/TECH_STACK.md** — All dependencies, build setup, Figma API methods
- **docs/TOKEN_STANDARDS.md** — Assessment rules engine
- **docs/COMPETITIVE.md** — Market positioning
- **docs/PRICING.md** — Cost modeling
- **docs/TASKS.md** — Task breakdown with current status (always check this first)
- **docs/DESIGN_SYSTEM.md** — UI design tokens, component patterns, hard rules
- **docs/TESTING.md** — Human QA checklists for Tasks 5 and 6
- **docs/task-templates/** — Pre-written task files for Tasks 4, 5, 6

## Build & Development

```bash
cd ~/VS-workspace/figma-forge-plugin
npm run build       # build both sandbox + UI to dist/
npm run typecheck   # check both tsconfigs
npm run test        # vitest unit tests
npm run dev         # watch mode (both)
```

To load in Figma: Plugins → Development → Import plugin from manifest → select `manifest.json`.
After each rebuild, just re-run the plugin (no re-import needed).

## Status (as of March 12, 2026)

| Task | Status |
|------|--------|
| 1-5: Scaffold, Types, Collectors, Auditors, Sandbox | ✅ Complete |
| 6: React UI | ✅ Complete |
| 7: Fix Engine (multi-match, picker, revert) | ✅ Complete |
| 8: Supabase Backend (credential gating, auth) | ✅ Complete |
| 8.5: Superuser relay + chat history | ⏳ Validation pending |
| 9a: AI Chat Edge Function | ✅ Complete |
| 9b: Design System Context Collector + Account Page | ✅ Complete |
| 10a: Landing page website | ⏳ Queued |
| 10b: Paddle checkout integration | ⏳ Queued |

**Ship target:** Week of March 15, 2026. All core functionality (Assess, Fix, Create) working. Ready for Figma Marketplace submission and Paddle payment setup.

## Workflow Learnings (Through March 12)

**Dispatch is good for:** Tasks 1-4 (pure code, auto-verifiable with tests/typecheck/build)
**Live terminal session is better for:** Tasks 5+ (visual UI, Figma runtime, iterative debugging with screenshots)

Hybrid proved effective: dispatch for backend architecture (Tasks 7-9), live terminal for visual work (Tasks 5-6, UI polish).

**TASKS.md has a status table at the top.** Forge reads it first to know where to continue without having to discover the state.
