---
type: knowledge
date: 2026-03-16
tags: [handover, context, forge, sage, workflow, hooks]
confidence: 1.0
significance: critical
source: sage
---

# Sage → Forge Handover Mechanism

## The Hook (built Mar 4, 2026)

A Claude Code hook at `~/.claude/hooks/context-sync.sh` fires on every `UserPromptSubmit` in Forge. It checks if `~/VS-workspace/claude-mind/memory/working/context.md` has been modified since Forge last read it. If yes, it injects the full contents as `additionalContext` with prefix `[SAGE CONTEXT UPDATE]`. If unchanged, exits silently.

Registered in `~/.claude/settings.json` under `hooks.UserPromptSubmit`.

Tracker file: `~/.claude/hooks/.context-last-seen` (stores last-modified timestamp).

## What This Means for Sage

After any planning session with G that involves product work (Caption Cook, Figma Forge, IconDex, etc.), Sage MUST update `context.md` with:
- What was decided
- What Forge needs to do next
- Where the spec/docs live (exact file path)
- Any architecture decisions or constraints

When G then opens Forge and says anything — even just "hi" — the hook fires, Forge gets the briefing, and knows exactly what to do. G should not need to re-explain what Sage already discussed.

## What context.md Should Contain (product section)

For each active product with pending Forge work:
- Current status (what steps are done)
- Spec file location (e.g. `docs/PADDLE_INTEGRATION.md`)
- Explicit instruction: "Read [file] first, follow it step by step"
- Architecture decisions that Forge must not violate
- What NOT to touch (e.g. "don't modify Stripe files")

## Ownership Rules

- **Sage** writes product-level context after planning sessions
- **Muse** was patched to SKIP working memory updates (was overwriting rich context with shallow summaries)
- **Forge** reads but does not write to context.md

## The Full Handover Flow

1. G and Sage discuss product work (e.g. Paddle integration for Caption Cook)
2. Sage writes/updates spec in project docs (e.g. `caption-cook/docs/PADDLE_INTEGRATION.md`)
3. Sage updates `context.md` with status + pointer to spec + next steps
4. G opens Forge in the project
5. Hook fires → Forge reads context.md automatically
6. Forge reads the spec file → starts working
7. G does NOT need to copy/paste or re-explain anything

## Anti-Patterns

- Sage planning a feature but NOT updating context.md → Forge starts blind
- Sage writing vague context ("work on Paddle") instead of specific pointers → Forge guesses
- Muse overwriting context.md with system summaries → rich product context lost (patched, but watch for regression)
- Sage not knowing this mechanism exists → goes rogue with alternative approaches (this happened Mar 15-16)

## Related Files

- Hook: `~/.claude/hooks/context-sync.sh`
- Settings: `~/.claude/settings.json` (hooks section)
- Context file: `~/VS-workspace/claude-mind/memory/working/context.md`
- Session-end hook: `~/VS-workspace/claude-mind/scripts/session-end-consolidate.sh`
