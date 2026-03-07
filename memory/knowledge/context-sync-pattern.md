# Context Sync Pattern: Sage → Forge

**Created:** 2026-03-04
**Category:** infrastructure

## How It Works

1. Sage updates `~/VS-workspace/claude-mind/memory/working/context.md`
2. `~/.claude/hooks/context-sync.sh` fires on every `UserPromptSubmit` in Claude Code
3. Hook checks file modification time vs last-seen timestamp
4. If new: injects content as `additionalContext` before Forge processes the message
5. If unchanged: exits silently

## Rules
- Only Sage and Forge write to context.md. Muse is locked out.
- context.md is the single source of truth for active project state and recent decisions.
- The hook is global (`~/.claude/settings.json`), works across all projects.
- CC snapshots hooks at startup. New sessions auto-load. Running sessions need `/hooks` to reload.

## When to Update context.md
- After any strategic conversation between G and Sage
- After major decisions that affect how Forge should build
- After scope changes, architecture pivots, or bug discoveries
- G can say "update context" to trigger this

## Reverse Direction (Forge → Sage)
- Forge consolidates (writes episodes)
- Muse processes episodes into entities/themes/patterns
- Next Sage session: G says "check memory" or Sage reads episodes
- Not automatic yet. Acceptable for now since Forge is usually downstream.
