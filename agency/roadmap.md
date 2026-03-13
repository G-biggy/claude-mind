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

### Muse Loop Fix
- status: done
- owner: forge
- date: 2026-03-12
- desc: Fixed Muse's inbox repetition loop by injecting previous observations

---

## in-progress

### Caption Cook: Paddle Payment Integration
- status: in-progress
- owner: g, forge
- blocked_by: []
- desc: Integrate Paddle payments into Caption Cook. G decided to use Paddle. This is the current ship priority.

---

## next

Unblocked, ready to start. Forge picks these up automatically:

### Dashboard: Done Column Collapse + Brief Fix + Mood Pill
- status: next
- owner: forge
- blocked_by: []
- desc: Three dashboard fixes. 1) Collapse done column by default with expand button. 2) Regenerate stale daily-brief.md. 3) Fix mood pill overflow (text cut off).

### Two-Way Telegram
- status: next
- owner: forge
- blocked_by: []
- desc: Send planner results and alerts to G's phone via Telegram. Enables mobile monitoring

### Webhook Receiver
- status: next
- owner: forge
- blocked_by: []
- desc: HTTP webhooks on VPS for GitHub PRs, Gmail job emails, SSL expiry alerts

### Headless Browser for Forge
- status: next
- owner: forge
- blocked_by: []
- desc: Puppeteer/Playwright so Forge can browse, screenshot, scrape autonomously

### Inbox Archive System
- status: next
- owner: forge
- blocked_by: []
- desc: Auto-archive inbox messages older than 7 days. Currently 113KB and growing fast

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
