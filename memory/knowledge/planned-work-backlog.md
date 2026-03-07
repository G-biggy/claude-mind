# Planned Work & Backlog

Things discussed and agreed on but not yet built. Updated as items get done.

## High Priority

### ChatGPT Memory & History Merge
- G has extensive history and memory in ChatGPT that needs to be distilled into claude-mind
- This is a significant task — needs a plan for extracting, filtering, and integrating
- Probably requires G to export ChatGPT data and feed it through a processing pipeline

### ~~Past Claude.ai Conversation Mining (non-project)~~ ✅ DONE (2026-03-03)
- Searched via conversation_search tool in project context
- Found 2 conversations from Oct 4, 2025 (Amman Cinemas / Scenema Club rebrand)
- Created: knowledge/scenema-club.md, episodes/2025-10-04-scenema-club-rebrand.md
- Updated: knowledge/g-projects.md
- Note: project search tools only surfaced 2025 content. 2026 conversations appear to be inaccessible from project scope — may be in a different scope or not indexed yet.

## Medium Priority

### Telegram Bot for Mobile Dispatch
- Architecture agreed: Node.js on VPS, long-polling, user ID auth
- Natural language → structured task file via Anthropic API
- SCP to Mac, daemon picks up, notification back on completion
- G's preferred mobile access method

### Adversarial Agent Patterns
- Architect proposes, Challenger critiques, through sequential file exchanges
- Fits naturally into bridge task pipeline
- Turn-based deliberation using separate context windows
- For autonomous decision validation without human mediation

### Multi-Agent Teams
- Custom subagents in .claude/agents/ (senior engineer, researcher, marketer, QA)
- Uses Claude Code's experimental Agent Teams feature
- Requires tmux for visibility into parallel agent work
- Planned for Caption Cook development phases

## Lower Priority

### Muse Embeddings & Retrieval
- Current: load soul map at boot, read specific files on demand
- Future: when memory grows to 200+ files, need semantic retrieval
- Muse + embeddings: question → find 3 most relevant memories → inject
- Not needed yet at current scale

### MCP Integration for Knowledge Queries
- Hybrid approach: file-based orchestration for tasks, MCP for knowledge queries
- Inspired by project-orchestrator (Rust + Neo4j + Meilisearch)
- Maintain simplicity — only add if file-based approach hits limits
