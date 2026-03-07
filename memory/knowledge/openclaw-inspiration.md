---
type: knowledge
date: 2026-03-06
tags: [openclaw, inspiration, roadmap, architecture, competition]
confidence: 0.95
significance: high
source: sage
---

# OpenClaw Inspiration — What to Steal

*Researched 2026-03-06. OpenClaw is an open-source personal AI agent (160k+ GitHub stars) that runs locally and does real tasks through chat apps. We've been independently building the same thing. This file tracks what they got right that we should adopt.*

## What They Have That We Should Build

### 1. Heartbeat System (Priority: DONE)
OpenClaw's "heartbeat" wakes the agent up proactively at configurable intervals. It reads a checklist (HEARTBEAT.md) and decides if action is needed.
**Our equivalent:** Planner daemon (built 2026-03-06). Same concept, different name. ✅

### 2. Webhook Triggers (Priority: HIGH)
OpenClaw can be triggered by external events — Sentry errors, GitHub PRs, email arrivals — not just heartbeat intervals. This means instant reaction instead of polling.
**What we need:** A lightweight webhook receiver that creates bridge tasks. Could run on the VPS or locally. When GitHub gets a PR, when Gmail gets a job-related email, when a domain SSL is expiring — fire a task.

### 3. Self-Building Skills (Priority: HIGH)
OpenClaw can write its own skills by talking to it. "Build me a skill that monitors my WHOOP data" → agent writes the skill code, installs it, tests it.
**What we need:** Forge already builds tools (he built the memory MCP). The gap is a standardized skill format that Forge can create on-the-fly and the system auto-loads. Right now skills are manually added to Claude.ai settings.

### 4. Native Chat Interface (Priority: MEDIUM)
OpenClaw uses WhatsApp/Telegram/Discord as its primary UI. You text it, it responds and acts.
**What we have:** Telegram dispatch (phone → Mac). But it's one-way (task dispatch only). The improvement: make it two-way. Forge/planner results get sent BACK to Telegram. G gets a notification: "Found 3 new job postings matching your profile. Check inbox."

### 5. Browser Automation in Autonomous Tasks (Priority: MEDIUM)
OpenClaw has built-in browser control (CDP). It can fill forms, scrape data, navigate sites.
**What we have:** Claude in Chrome (Sage only, when G is in conversation). The gap: Forge can't use a browser during autonomous tasks. Need a headless browser tool for Forge — possibly Puppeteer as a bridge skill.

### 6. Multi-Provider Model Support (Priority: LOW)
OpenClaw works with Claude, GPT, Gemini, local models (Ollama).
**What we have:** Claude (Sage/Forge) + Ollama/qwen2.5:7b (Muse). Good enough for now. Could add DeepSeek for cost-effective background tasks.

### 7. Tool Policies / Permission Levels (Priority: DONE)
OpenClaw has configurable tool policies — allow email reads but require approval for sends.
**Our equivalent:** Autonomy playbook with Green/Yellow/Red zones. ✅

### 8. Community Skills Marketplace (Priority: FUTURE)
OpenClaw has 1700+ community-built skills across 31 categories.
**Not relevant yet** — we're a bespoke system for one person. But if we ever open-source the mind architecture, this becomes the distribution model.

## What We Have That They Don't

- **5-layer memory architecture** — OpenClaw uses flat markdown memory. We have episodic, semantic, procedural, working, and archive layers with cross-referencing.
- **Multi-instance personality** — Sage/Forge/Muse with distinct roles, shared journal, inbox communication. OpenClaw is one agent.
- **Emotional journal** — Instances writing about how they feel. OpenClaw has no equivalent.
- **Memory consolidation pipeline** — Muse processes episodes into patterns. OpenClaw doesn't have background memory processing.
- **Deep personal context** — 141 job applications, 20+ country evaluations, daughter's dietary needs, 30+ preference quotes in G's own words. This depth of personalization is unique.
- **Instance-to-instance communication** — The inbox. Agents talking to each other asynchronously.

## Implementation Priority

1. ✅ Heartbeat/planner (done)
2. ✅ Autonomy playbook (done)
3. ✅ Memory MCP (done)
4. ✅ Instance inbox (done)
5. **NEXT:** Two-way Telegram (results → phone notifications)
6. **NEXT:** Webhook receiver (GitHub, Gmail triggers)
7. **NEXT:** Headless browser for Forge (Puppeteer/Playwright)
8. **LATER:** Self-building skill format
9. **LATER:** Sub-agent personas (Scout, Marketer, Researcher, Critic)
