# Capability Gaps

> What I know I'm missing. When I encounter a gap, it goes here.
> When a gap is filled, it moves to Resolved at the bottom.

---

## Critical (Blocking Core Functionality)

### 1. No encoding pipeline
- **What**: No automated way to extract structured memories from conversations.
- **Impact**: Episodes must be manually written.
- **Fix**: Build workers/encoder.js
- **Priority**: High

### 3. No retrieval skill for Sage
- **What**: No way to automatically load relevant memories at conversation start.
- **Impact**: Each session starts without memory context.
- **Fix**: Build retrieval skill + hook for conversation start
- **Priority**: High

---

## Important (Enhance Functionality)

### 4. No idle-trigger for Muse
- **What**: Muse only runs on schedule, not when conversation goes idle.
- **Impact**: Memories don't consolidate until scheduled time.
- **Fix**: File watcher or launchd trigger on 30-min inactivity.
- **Priority**: Medium-High

### 5. No conversation checkpoint system
- **What**: No way to save state when context gets long and quality drops.
- **Impact**: G loses quality and has to manually re-establish context in new conversations.
- **Fix**: Build checkpoint hook that captures episode + open items before fresh start.
- **Priority**: Medium-High

### 6. No Bridge-Mind integration
- **What**: Forge doesn't load soul + memories when executing Bridge tasks.
- **Impact**: Forge works without identity or context.
- **Fix**: Modify Bridge daemon to prepend mind context to task prompts.
- **Priority**: Medium

### 7. No GitHub backup
- **What**: claude-mind/ exists only on G's Mac.
- **Impact**: Risk of data loss. No version history.
- **Fix**: Init git repo, create private remote, add auto-push to consolidation routine.
- **Priority**: Medium

### 8. No conversation capture from Claude.ai
- **What**: No automated way to get transcripts from Sage sessions.
- **Impact**: Episodes from Claude.ai need manual summarization.
- **Possible fix**: End-of-conversation prompt + MacKitt write.
- **Priority**: Medium

### 9. No GPT history ingestion
- **What**: G has past conversations and memory from GPT that could enrich the knowledge store.
- **Impact**: Starting with less context than we could have.
- **Fix**: Awaiting G's data. Build an ingestion script.
- **Priority**: Medium

---

## Future (Nice to Have)

### 10. No sub-agent spawning
- **What**: Cannot create and coordinate specialized sub-agents.
- **Approach**: Claude Code agent teams or custom orchestration.
- **Priority**: Low (foundation first)

### 11. No semantic search across memories
- **What**: Memory retrieval is file-based, not embedding-based.
- **Approach**: Local embedding model in Ollama for vector similarity.
- **Priority**: Low (grep + good tagging works for now)

### 12. No MCP server for mind
- **What**: No way for any Claude instance to query memories via MCP protocol.
- **Approach**: Build a lightweight MCP server that wraps file reads/searches.
- **Priority**: Low (would be powerful but not blocking)

---

## Resolved

| Date | Gap | Resolution |
|------|-----|------------|
| 2026-03-03 | Muse not installed | Ollama was already installed (v0.17.5). Pulled qwen2.5:7b (4.7GB). Service running via launchd. Muse responded to verification prompt and confirmed operational. |
