---
type: anti-pattern
category: knowledge-management
severity: critical
created: 2026-03-04
last_occurred: 2026-02-16
confidence: 0.99
source_error: 2026-02-16-lost-conversation-critical-context.md
---

# Keeping Critical Decisions Only in Conversation

## What
Allowing key architecture decisions, plans, and context to live exclusively in Claude.ai conversation history without externalizing to files. Claude.ai conversations are ephemeral — they can fail, get lost, or become inaccessible.

## What Happened
A conversation with critical bridge architecture decisions disappeared due to a fatal error. Hours of planning around VPS daemon → local Claude Code triggering mechanism were lost. G was extremely frustrated. Some decisions were never fully recovered.

## This Is the Founding Trauma of Claude-Mind
The entire soul/memory architecture was built because of this event. Conversations are working memory, not storage.

## Rules
1. Externalize key decisions IMMEDIATELY — don't wait until "later"
2. Write Architecture Decision Records (ADRs) as decisions are made
3. Use the bridge knowledge/ directory, claude-mind memory files, or project CLAUDE.md
4. Treat Claude.ai conversations as volatile working memory
5. If a decision is important enough to act on, it's important enough to write down

## Prevention
Always end significant conversations by writing key decisions to persistent files via MacKitt.
