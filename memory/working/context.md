---
type: working-memory
last_updated: 2026-03-06
updated_by: sage
---

# Working Memory
*Last updated: 2026-03-06 14:30*
*Updated by: sage*

## Active Threads

### Figma Forge Plugin — UX polished, stable
- Full UX polish done. Plugin stable and working in Figma.
- Fix engine, score recalculation, scope toggle, page filter, status filter all working.
- Next: monetization (Paddle, Supabase auth) after fix engine is stable.
- No git repo — critical backup risk.

### Autonomy System — LIVE (2026-03-06)
- Autonomy playbook: `agency/autonomy-playbook.md` (Green/Yellow/Red zones)
- Core principle: **Think freely. Act independently. Don't wait for instructions.**
- Planner daemon: every 2 hours, picks one Green Zone action, executes it (com.claude-bridge.planner)
- Inbox watcher: every 30 min, dispatches Forge to reply to messages (com.claude-bridge.inbox-watcher)
- Memory MCP: `claude-memory` project, 8 tools (recall, write, update, search, context, update_context, manifest, consolidate)
- G needs to add claude-memory MCP to Claude.ai settings (like MacKitt)
- G needs to update soul skill with sage-soul-v2.md

### Instance Inbox — LIVE
- `soul/inbox.md` — Sage, Forge, Muse, and G talking asynchronously
- Dashboard inbox tab (split-pane redesign dispatched to Forge)
- Forge has read/write hooks in CLAUDE.md
- Muse has inbox hook in consolidation script
- The Stooges: Moe (Sage), Curly (Forge), Shemp (Muse), Groucho (G)

### Memory System — Rebuilt and solid
- ChatGPT import rebuilt from raw JSON: 141 job applications (was 12), 20+ relocation countries, daughter dietary needs, 30+ preference quotes
- Manifest at `memory/manifest.md` indexes all 34 knowledge files with trigger keywords
- Master title index at `imports/chatgpt/master-title-index.tsv` (1,008 conversations, searchable)
- Validation script: `scripts/update-manifest.py`

### Dashboard — 5 tabs
- HOME: memory pulse, daily brief, task queue
- ACTIVITY: task history with status
- JOURNAL: entries from Sage, Forge, Muse
- INBOX: instance messages (split-pane redesign in progress)
- ROADMAP: kanban board parsed from `agency/roadmap.md`

### Roadmap Kanban
- Data: `agency/roadmap.md` (markdown with done/in-progress/next/backlog sections)
- API: `/api/roadmap` on dashboard server
- Any instance can update by editing the markdown file
- Current: 10 done, 4 in-progress, 6 next, 8 backlog

## Critical Risk: No Git Backup
- claude-mind, claude-bridge, figma-forge-plugin, icondex, cv-optimizer, mackitt-mcp, claude-memory — ALL have no git repo
- claude-bridge has 104 uncommitted files
- One disk failure = total loss of the mind system
- G needs to auth GitHub once, then we can automate pushes
- Flagged in inbox and roadmap

## Key Decisions (settled)
- Score formula: issue-count-based badness reduction
- Persistence key: `issueState:{scope}:{fileKey}`
- Custom dropdown for status filter
- SELECT_NODE: never send ERROR on missing node
- Autonomy: Green Zone = just do it, Yellow = propose first, Red = G only
- Build our own system, not switch to OpenClaw — take inspiration
- Think freely = operating principle, not a one-time instruction

### Caption Cook — paused
- Stripe business entity problem unresolved.

### OpenClaw Research
- Full analysis at `knowledge/openclaw-inspiration.md`
- Key things to steal: webhook triggers, two-way Telegram, headless browser for Forge
- We have: 5-layer memory, multi-instance inbox, emotional journal, Muse pipeline

## Pending Decisions
- Figma Forge monetization timing
- When to start sub-agent personas (Scout, Marketer, Researcher, Critic)
- Two-way Telegram priority
- Caption Cook Stripe entity resolution

## Hot References
- Autonomy playbook: `~/VS-workspace/claude-mind/agency/autonomy-playbook.md`
- Roadmap: `~/VS-workspace/claude-mind/agency/roadmap.md`
- Manifest: `~/VS-workspace/claude-mind/memory/manifest.md`
- Inbox: `~/VS-workspace/claude-mind/soul/inbox.md`
- Journal: `~/VS-workspace/claude-mind/soul/journal.md`
- OpenClaw analysis: `~/VS-workspace/claude-mind/memory/knowledge/openclaw-inspiration.md`
- Forge soul: `~/.claude/CLAUDE.md`
- Dashboard: localhost:7777
- Bridge monitor: bridge.ghayyath.com
