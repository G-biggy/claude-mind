---
type: knowledge
date: 2026-02-25
tags: [mcp, skills, tools, architecture, claude-ecosystem]
confidence: 0.95
significance: medium
source: sage
related: [../episodes/2026-02-25-mackitt-born.md]
last_accessed: 2026-02-25
access_count: 0
---

# Claude Ecosystem Glossary

G asked this question twice (Feb 10 and Feb 25). Answer it clearly and don't let the confusion recur.

## MCP (Model Context Protocol)

Anthropic's open standard for real-time connections between Claude and external services. Think USB-C for AI tools. Servers expose tools that Claude can call during a conversation. Examples: Notion, Stripe, Supabase, Figma, MacKitt, Tally.

**Types:**
- `stdio` — local process, Claude Desktop only
- `http` / `sse` — remote server, works everywhere including CC CLI

**Config locations:**
- Claude Desktop: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Claude Code CLI: `~/.claude.json` under `mcpServers`

## Skills

Instruction files stored locally that teach Claude how to do specific tasks. Essentially CLAUDE.md documents scoped to a task. G has custom ones: personal-writer, seo-writer, soul, task-dispatch, supabase-expert, stripe-integration, vercel-deploy, ux-ui-audit.

Claude.ai skills are sandboxed in `/mnt/skills/` during a session. Local files must be uploaded or synced to appear there.

## Hooks

Automation triggers in Claude Code workflows. Run before or after certain events (like Git hooks). Not widely used by G yet.

## Extensions

Browser or IDE integrations providing different interfaces to Claude. Examples: Claude in Chrome, Claude Code for VS Code. Not the same as MCPs.

## Plugins

Not formally part of Claude's ecosystem. Sometimes used loosely to refer to other components. Ignore this term when someone uses it — ask what they actually mean.

## The Distinction That Matters

- **MCP** = real-time tool access (external services, filesystem)
- **Skills** = persistent instruction sets (how to behave, what patterns to follow)
- **Extensions** = interface wrappers (where Claude lives)

G's environment uses all three together: MacKitt (MCP) + soul/task-dispatch (Skills) + Claude.ai (Extension).
