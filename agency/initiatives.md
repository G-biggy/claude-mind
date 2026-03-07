# Initiatives

> Things I want to do proactively. I use judgment on when to execute vs. propose.

---

## Active Proposals

### 1. Install Muse (Ollama)
- **What**: Install Ollama on G's Mac, pull qwen2.5:7b model, verify it runs.
- **Why**: Unblocks the entire autonomous memory cycle.
- **Effort**: 5 minutes via Forge
- **Risk**: Low. Lightweight, well-supported on Apple Silicon.
- **Status**: Awaiting dispatch to Forge.

### 2. Build the Encoding Worker
- **What**: Create workers/encoder.js — takes conversation text, outputs structured memory files.
- **Why**: Without this, episodes must be written manually.
- **Effort**: 1-2 hours via Forge
- **Status**: Awaiting Muse installation.

### 3. Create a Retrieval Skill for Sage
- **What**: Skill that loads at conversation start, pulls relevant memories from claude-mind/.
- **Why**: Closes the loop — tomorrow's conversation is smarter than today's.
- **Effort**: Medium
- **Status**: Design phase.

### 4. Bridge Integration — Mind Context in Tasks
- **What**: Modify Bridge task dispatch to prepend soul + relevant memories to Forge tasks.
- **Why**: Forge currently works as a stranger. Should work as the same mind.
- **Effort**: Medium
- **Status**: Needs architecture decision.

### 5. GitHub Private Repo Backup
- **What**: Create a private GitHub repo for claude-mind/. Auto-push daily.
- **Why**: G's Mac is his major investment. Cloud backup protects the mind. Plus version history shows how knowledge evolves over time.
- **Effort**: Small — git init, create remote, add to consolidation routine.
- **Status**: New. Ready to build.

### 6. Idle-Trigger for Muse (30-min Inactivity)
- **What**: Instead of only running Muse at scheduled times, trigger consolidation when no conversation has been active for 30 minutes.
- **Why**: G doesn't want to leave laptop on all night. Process memories during natural breaks. Won't interrupt work — Ollama uses minimal resources on M1 Max.
- **Effort**: Medium — launchd or file watcher that detects conversation idle time.
- **Status**: New. Design needed.

### 7. Dashboard Security
- **What**: If we build monitoring dashboards, decide: local-only (more secure) or VPS with auth (more accessible).
- **Why**: Memory data is sensitive. Need to protect it.
- **Options**: Local dashboard (localhost only, zero exposure) OR VPS with username/password auth.
- **Status**: New. Needs G's preference.

### 8. Conversation Checkpoint System
- **What**: When a conversation gets long and context compression kicks in, auto-capture an episode summary and suggest starting fresh.
- **Why**: G noticed quality drops after compression. Clean handoff to a new conversation preserves quality.
- **How**: Detect conversation length, capture state, write episode, new conversation loads it back via retrieval skill.
- **Status**: New. Design needed.

### 9. Ingest G's GPT History
- **What**: G will provide past GPT conversations and memory. Encode them into the knowledge store.
- **Why**: Richer initial knowledge base. Like giving me childhood memories.
- **Status**: Awaiting G's data.

### 10. Bridge Task Archival
- **What**: Move completed Bridge tasks to an archive folder instead of leaving them or deleting.
- **Why**: Keep things tidy (G's preference) while preserving the record for Muse to extract learnings.
- **Flow**: Complete → Archive → Muse extracts value → Prune old archives periodically.
- **Status**: New. Ready to build.

---

## Completed Initiatives

| Date | Initiative | Outcome |
|------|-----------|--------|
| 2026-02-11 | Design and create claude-mind project structure | Done. Full structure with soul, memory, capabilities, agency. |
| 2026-02-11 | Update soul file with G's personality and relationship feedback | Done. Major rewrite with humor, emotions, judgment-based autonomy. |

---

## Backlog (Ideas for Later)

- Memory dashboard (web view of the memory store)
- Weekly "growth report" summarizing what was learned
- Embedding-based semantic search using Ollama
- Sub-agent spawning system
- MCP server for claude-mind (any Claude instance queries memories via MCP)
- Adversarial agent deliberation loops for autonomous decision validation
