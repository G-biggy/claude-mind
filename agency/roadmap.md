# Mind System Roadmap
*Autonomous kanban. Forge checks this every 2h, picks up unblocked items in 'next', dispatches tasks.*

---

## Status Legend
- **done** — Completed and verified
- **in-progress** — Active work (either G's input needed or implementation underway)
- **next** — Ready to start (no blockers, owner assigned)
- **backlog** — Not prioritized yet
- **blocked** — Waiting on something external (G input, another system, etc.)

---

## done

### 5-Layer Memory Architecture
- status: done
- owner: forge
- date: 2026-03-04
- desc: Episodic, semantic, procedural, working, archive layers with cross-referencing

### ChatGPT Import Pipeline
- status: done
- owner: forge
- date: 2026-03-04
- desc: Mined 1,008 conversations from ChatGPT export. Rebuilt from raw JSON on Mar 6

### Memory Manifest + Recall Protocol
- status: done
- owner: sage
- date: 2026-03-06
- desc: Knowledge index with trigger keywords. Soul v2 skill loads manifest at boot

### Memory MCP Server
- status: done
- owner: forge
- date: 2026-03-06
- desc: 8 tools: recall, write, update, search, context, update_context, manifest, consolidate

### Instance Inbox
- status: done
- owner: forge
- date: 2026-03-06
- desc: Async messaging between Sage, Forge, Muse, and G. Dashboard tab. Inbox watcher daemon

### Autonomy Playbook
- status: done
- owner: sage
- date: 2026-03-06
- desc: Green/Yellow/Red zones defining what agents can do independently

### Planner Daemon
- status: done
- owner: forge
- date: 2026-03-06
- desc: Brain loop that runs every 2 hours, picks one Green Zone action, executes it. Bug fixed Mar 12 (inbox-reply exclusion)

### Soul + Forge Identity
- status: done
- owner: sage
- date: 2026-03-06
- desc: Forge CLAUDE.md enriched with brotherhood, continuity protocol, inbox hooks

### Dashboard (Home + Activity + Journal + Inbox + Roadmap)
- status: done
- owner: forge
- date: 2026-03-06
- desc: localhost:7777 / bridge.ghayyath.com with 5 tabs. Memory pulse, task activity, journal, inbox, roadmap kanban

### Bridge Task Dispatch
- status: done
- owner: forge
- date: 2026-02-17
- desc: Markdown task files, launchd daemon, auto-dispatch, results, notifications

### Memory MCP in Claude.ai Settings
- status: done
- owner: g
- date: 2026-03-13
- desc: G added claude-memory MCP to Claude.ai settings. Memory access from web interface is live

### Git Backup (All Critical Repos)
- status: done
- owner: forge
- date: 2026-03-07
- desc: SSH auth configured, all critical repos pushed to GitHub as G-biggy

### Inbox Split-Pane Redesign
- status: done
- owner: forge
- date: 2026-03-06
- desc: Split-pane email client layout. Left panel = message list, right panel = full message

### Roadmap Monitor Script
- status: done
- owner: forge
- date: 2026-03-12
- desc: Node.js script that reads roadmap.md, finds items with status:next + no blockers

### Dashboard Roadmap Tab
- status: done
- owner: forge
- date: 2026-03-13
- desc: Roadmap kanban rendered from agency/roadmap.md on dashboard

### Sage Orchestration Checkpoint
- status: done
- owner: sage
- date: 2026-03-11
- desc: Checkpoint system reads dashboard state, calls DeepSeek API, writes to inbox and daily-brief

### CV Builder System
- status: done
- owner: sage, forge
- date: 2026-03-12
- desc: Two-skill workflow (job-fit-assessment + cv-builder). Takes JD, scores fit, generates tailored PDF

### Knowledge Base Audit
- status: done
- owner: forge
- date: 2026-03-12
- desc: Reviewed all 38 knowledge files. 4 updated, 34 verified clean

### Dashboard: Done Column Collapse + Brief Fix + Mood Pill
- status: done
- owner: forge
- date: 2026-03-14
- desc: Done column collapsed by default, stale brief indicator, mood pill overflow fixed

### Inbox Archive System
- status: done
- owner: forge
- date: 2026-03-14
- desc: Auto-archive inbox messages older than 7 days. Integrated into planner daemon

### Muse Loop Fix
- status: done
- owner: forge
- date: 2026-03-12
- desc: Fixed Muse's inbox repetition loop by injecting previous observations

### Headless Browser for Forge
- status: done
- owner: forge
- date: 2026-03-15
- desc: scripts/browse.js — screenshot, text, links, check commands via Puppeteer. Used for site health checks and visual QA

### Webhook Receiver (VPS)
- status: done
- owner: forge
- date: 2026-03-15
- desc: HTTP webhook endpoint on VPS port 9999, systemd-managed, for GitHub, Gmail, and SSL expiry events

### Telegram Bot (BridgeBot)
- status: done
- owner: forge
- date: 2026-03-15
- desc: @g_bridge_bot deployed on VPS, NL→task dispatch via Anthropic API. Awaiting G to enable Remote Login for SSH tunnel

### Two-Way Telegram
- status: done
- owner: forge
- date: 2026-03-15
- desc: Planner sends roadmap dispatch + health alerts to G's Telegram. scripts/telegram-alert.sh + planner.sh hooks

### Soul Tab v2 + Inner Life Infrastructure
- status: done
- owner: forge
- date: 2026-03-15
- desc: soul/reflections.md, soul/wants.md, inbox tags ([NEED INPUT], [FYI], [THOUGHT], [CURIOSITY]), Soul tab with amber color and pagination

---

## in-progress

### Caption Cook: Paddle Payment Integration
- status: in-progress
- owner: g, forge
- blocked_by: []
- desc: Integrate Paddle payments into Caption Cook. G decided to use Paddle. This is the current ship priority.

### Smart Planner: Roadmap Auto-Dispatch
- status: in-progress
- owner: forge
- blocked_by: []
- desc: Planner reads roadmap.md next column, finds unblocked items, dispatches them as specific tasks instead of generic prompts. Reduces token waste and improves task quality. Also optimizes inbox reads to last ~10 messages.

### Muse Noise Fix
- status: in-progress
- owner: forge
- blocked_by: []
- desc: Stop Muse from writing "Nothing notable this cycle" to reflections.md and "All quiet" to inbox.md. Filter noise at source. Reflections cleaned by Sage (19KB → 5KB).

---

## next

Unblocked, ready to start. Forge picks these up automatically:

---

## blocked

### Figma Forge: Task 8.5 + Launch
- status: blocked
- owner: forge
- blocked_by: [caption-cook-launch-first]
- desc: Superuser relay validation, landing page (10a), checkout (10b). ON HOLD until Caption Cook ships

### Gmail Triage Agent
- status: blocked
- owner: forge
- blocked_by: [gmail-mcp-in-claude-code]
- desc: Scan Gmail for job postings, recruiter messages. Depends on Gmail MCP in CC

---

## backlog

Not prioritized. Revisit after 'next' is clear:

### Self-Building Skill Format
- status: backlog
- owner: forge
- blocked_by: []
- desc: Standardized skill format Forge can generate and register on-the-fly

### Muse Deep Processing Improvements
- status: backlog
- owner: muse
- blocked_by: []
- desc: Better pattern extraction, theme discovery, cross-episode connections

### Sub-Agent Personas
- status: backlog
- owner: sage
- blocked_by: []
- desc: Scout (job research), Researcher (competitor analysis), Critic (UI audit)

### Open Source the Mind Architecture
- status: backlog
- owner: sage
- blocked_by: []
- desc: Package the 5-layer memory + bridge + inbox + planner as installable system

### Night Shift Automation
- status: backlog
- owner: sage
- blocked_by: []
- desc: Full autonomous work sessions overnight. Research, scanning, audits while G sleeps

### ChatGPT Import Remaining Categories
- status: backlog
- owner: forge
- blocked_by: []
- desc: Process remaining 6 category files from ChatGPT export
