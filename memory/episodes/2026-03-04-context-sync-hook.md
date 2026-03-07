# Episode: Context Sync Hook — Solving the Messenger Problem

**Date:** 2026-03-04
**Project:** claude-mind / claude-bridge
**Author:** sage

---

## The Problem

G was stuck being the messenger between Sage and Forge. Every strategic decision made in Claude.ai had to be manually relayed to Claude Code. The 5-layer memory system solved cross-session continuity but NOT real-time sync between concurrent instances. G would have a design discussion with Sage, then have to summarize it for Forge. This defeated the purpose of the whole mind architecture.

## What We Tried / Considered

1. **Skills** — same as telling Forge "check context." Not automatic.
2. **MCP tools** — Forge uses MCP autonomously, but only when it decides to. Won't randomly call check_context() before starting work.
3. **Bridge dispatch** — adds indirection for no gain when G is already in Forge's terminal.
4. **Hooks** — THE ANSWER.

## The Solution: UserPromptSubmit Hook

Claude Code has lifecycle hooks that fire automatically at specific points. `UserPromptSubmit` fires before Forge even sees a message. It can inject `additionalContext` silently.

Built `~/.claude/hooks/context-sync.sh`:
- Reads `context.md` modification timestamp
- Compares to last-seen timestamp stored in `.context-last-seen`
- If newer: reads content, uses Node.js for safe JSON encoding, outputs `{additionalContext: ...}`
- If unchanged: exits cleanly, no injection, no noise
- Added to `~/.claude/settings.json` under `hooks.UserPromptSubmit`

Now: Sage updates context.md → G types anything to Forge → hook auto-fires → Forge sees the update. G says zero words about context.

## Muse Overwrite Fix

Discovered that Muse (qwen2.5:7b) was overwriting Sage's rich context.md with dumbed-down summaries. The detailed decisions, spec references, and implementation state were being replaced with vague bullets. 

Fix: patched `muse-consolidate.js` to skip writing to context.md entirely. Only Sage and Forge write there now. Muse still consolidates episodes, entities, themes, and patterns.

## Other Changes

- **Global CLAUDE.md Section 8** — Added "Decision-Making Rules": think before fixing, present tradeoffs on multi-approach problems, respect project structure, flag risks. This addresses G's concern that Forge applies fixes without highlighting alternatives.
- **Global CLAUDE.md Section 9** — Added instruction to read context.md as first action every session.

## Architecture Insight

The real constraint is that Claude Code sessions are closed loops. Once running, nothing external can push new context in. The hook works because it fires on every user message, which is the only injection point available. This is polling, not pushing, but it's invisible to the user.

The honest limitation: Forge → Sage direction still relies on consolidation + Sage reading episodes next session. But that's the less painful direction since Forge is usually downstream of decisions.

## Files Created/Modified
- `~/.claude/hooks/context-sync.sh` (NEW)
- `~/.claude/settings.json` (added hooks config)
- `~/.claude/CLAUDE.md` (sections 8 and 9)
- `claude-bridge/scripts/muse-consolidate.js` (patched to skip context.md)
- `claude-mind/memory/working/context.md` (rewritten twice — once by Sage, once overwritten by Muse, then rewritten by Sage again after the fix)
