---
type: episode
date: 2026-02-16
tags: [mobile, markdown, preferences, bridge, architecture]
significance: high
source: sage
related: [../knowledge/working-with-g.md, ../knowledge/bridge-architecture-evolution.md]
---

# Mobile Access Discussion + The Markdown Mandate

**Date:** 2026-02-16
**Context:** After the local daemon breakthrough, G asked about using the bridge from his phone.

## The Mobile Problem

G uses the Claude mobile app. The mobile app doesn't have MCP servers or local filesystem access. So dispatching bridge tasks from phone required a different path.

Options presented:
- **GitHub as task queue** — write task files to GitHub directly from mobile, daemon picks them up
- **Notion database** — create tasks in Notion, VPS daemon watches Notion API
- **Simple web form on VPS** — fill out a form at bridge.ghayyath.com/submit, VPS writes the task
- **Telegram bot** — message the bot, it creates tasks and confirms

G leaned toward web form or Telegram. Wasn't in a rush. Said he could implement tomorrow.

## The Markdown Mandate

**This conversation is where G formalized his global preference for markdown over JSON.**

Direct quote context: G said all document sharing should use markdown files, not JSON, emphasizing human-readable-first. This wasn't just for mobile or this project — it was stated as a **global preference across all contexts**.

This is why:
- Task files are .md with YAML frontmatter, not .json
- Knowledge files are markdown, not structured data
- The claude-mind memory system uses markdown
- Results are written as markdown
- Handoff documents, skill instructions, everything — markdown first

## The SSH Alias Lesson

On the same day: G was getting SSH connection failures when trying `ssh agent@85.25.172.34`. Investigation revealed he had a perfectly configured `~/.ssh/config` entry with the alias `agent-vps`. He was bypassing his own config by using the raw IP.

Fix: use `ssh agent-vps`. The `IdentitiesOnly yes` in the SSH config was doing its job — only the dedicated key works.

Lesson: always check SSH config aliases before debugging further. The setup was correct; the invocation was wrong.

## Outcome

Mobile dispatch was tabled (not urgent). Telegram bot later became the preferred direction (Feb 28). The markdown preference became a foundational rule in the system.
