# Mind System Roadmap
*The kanban board for what we're building. Updated by any instance.*

## done

### 5-Layer Memory Architecture
- tags: memory, foundation
- owner: forge
- date: 2026-03-04
- desc: Episodic, semantic, procedural, working, archive layers with cross-referencing

### ChatGPT Import Pipeline
- tags: memory, import
- owner: forge
- date: 2026-03-04
- desc: Mined 1,008 conversations from ChatGPT export. Initially 93% lossy, rebuilt from raw JSON on Mar 6

### Memory Manifest + Recall Protocol
- tags: memory, recall
- owner: sage
- date: 2026-03-06
- desc: Knowledge index with trigger keywords. Soul v2 skill loads manifest at boot

### Memory MCP Server
- tags: mcp, memory, tools
- owner: forge
- date: 2026-03-06
- desc: 8 tools: recall, write, update, search, context, update_context, manifest, consolidate

### Instance Inbox
- tags: communication, social
- owner: forge
- date: 2026-03-06
- desc: Async messaging between Sage, Forge, Muse, and G. Dashboard tab. Inbox watcher daemon

### Autonomy Playbook
- tags: autonomy, governance
- owner: sage
- date: 2026-03-06
- desc: Green/Yellow/Red zones defining what agents can do independently

### Planner Daemon
- tags: autonomy, daemon
- owner: forge
- date: 2026-03-06
- desc: Brain loop that runs every 2 hours, picks one Green Zone action, executes it

### Soul + Forge Identity
- tags: identity, soul
- owner: sage
- date: 2026-03-06
- desc: Forge CLAUDE.md enriched with brotherhood, continuity protocol, inbox hooks

### Dashboard (Home + Activity + Journal + Inbox)
- tags: dashboard, ui
- owner: forge
- date: 2026-03-06
- desc: localhost:7777 with 4 tabs. Memory pulse, task activity, journal, inbox

### Dashboard Roadmap Tab
- tags: dashboard, ui, kanban
- owner: sage
- date: 2026-03-06
- desc: Kanban board on the dashboard with 4 columns. Parsed from roadmap.md. Any instance can update it

### Bridge Task Dispatch
- tags: bridge, infrastructure
- owner: forge
- date: 2026-02-17
- desc: Markdown task files, launchd daemon, auto-dispatch, results, notifications

## in-progress

### Git Backup for Critical Projects
- tags: infrastructure, backup, risk
- owner: g
- date: 2026-03-06
- desc: claude-mind, claude-bridge, figma-forge-plugin have NO git repos. Zero backup. One disk failure = total loss. G needs to auth GitHub, then we can automate pushes

### Soul Skill v2 Update
- tags: identity, recall, skill
- owner: g
- date: 2026-03-06
- desc: G needs to paste sage-soul-v2.md into Claude.ai skills panel. Enables manifest-based recall

### Memory MCP Connection
- tags: mcp, memory
- owner: g
- date: 2026-03-06
- desc: G needs to add claude-memory MCP to Claude.ai settings (like MacKitt)

### Sub-Agent Personas
- tags: autonomy, agents, teams
- owner: sage
- date: 2026-03-06
- desc: Scout (jobs), Marketer (Scenema/Riffs), Researcher (competitors), Critic (UI/UX). Same bridge, different hats

## next

### Inbox Split-Pane Redesign
- tags: dashboard, ui, inbox
- owner: forge
- date: 2026-03-06
- desc: Split-pane email client layout. Left panel = message list, right panel = full message. Mobile responsive

### Two-Way Telegram
- tags: communication, mobile
- owner: forge
- desc: Send planner results and alerts back to G's phone via Telegram. Currently one-way only

### Webhook Receiver
- tags: automation, triggers
- owner: forge
- desc: Instant reaction to GitHub PRs, Gmail job emails, domain SSL expiry. Instead of polling

### Gmail Triage Agent
- tags: autonomy, jobs, email
- owner: forge
- desc: Scan Gmail for job postings, recruiter messages, rejections. Update job search history. Needs Gmail MCP access from CC

### Headless Browser for Forge
- tags: automation, browser
- owner: forge
- desc: Puppeteer/Playwright so autonomous tasks can browse, screenshot, scrape. Enables Critic agent



## backlog

### Self-Building Skill Format
- tags: skills, autonomy
- desc: Standardized skill format Forge can create on-the-fly. Auto-loads into system

### Scenema Club Growth Plan
- tags: marketing, scenema
- desc: Content strategy, posting schedule, competitor analysis, engagement tactics. 136k followers, dormant

### G's Riffs Store Launch
- tags: marketing, pod, tshirts
- desc: POD business launch. Blocked by US LLC formation and copyright pivot

### Job Search Strategy Overhaul
- tags: jobs, strategy
- desc: Based on 0.7% callback rate analysis. Local vs remote pattern. INGOT as reference. New approach

### ChatGPT Import Remaining Categories
- tags: memory, import
- desc: 6 other category files may be truncated (design, projects, learning, personal, preferences, profile)

### Muse Deep Processing Improvements
- tags: memory, muse
- desc: Better pattern extraction, theme discovery, cross-episode connections

### Open Source the Mind Architecture
- tags: community, open-source, future
- desc: Package the 5-layer memory + bridge + inbox + planner as an installable system. The anti-OpenClaw

### Night Shift Automation
- tags: autonomy, scheduling
- desc: Full autonomous work sessions overnight. Competitive research, job scanning, project audits
