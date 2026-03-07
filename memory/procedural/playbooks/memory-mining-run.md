---
type: playbook
category: memory-management
status: proven
created: 2026-03-04
last_run: 2026-03-04
runs_completed: 9
confidence: 0.95
source: sage
---

# Playbook: Memory Mining Run

How to extract historical conversation context from Claude.ai projects and encode it into claude-mind memory files.

## When to Use
- New Claude.ai project conversation history has never been mined
- Significant time has passed and new conversations need encoding
- G asks to "mine" or "capture" past conversations
- Starting a new project scope and want historical context imported

## Prerequisites
- Sage must be running within the Claude.ai project being mined (scoped access)
- MacKitt MCP available for file writing
- claude-mind project structure exists at ~/VS-workspace/claude-mind/

## Steps

### Step 1: Scope Assessment
```
Use: recent_chats tool to list available conversations
Use: conversation_search to look for specific topics
Note: Each Claude.ai project can ONLY see its own conversations from within that project
```
**Critical constraint**: You can only mine conversations accessible from within the current project. Other projects require separate mining sessions from within those projects.

### Step 2: Systematic Search
```
Search patterns to try:
- Recent chats (last 30 days)
- Topic keywords: [project name], [key decisions], [technology names]
- Date ranges: work backwards from most recent
```
Track what's been found vs. what existed before this run.

### Step 3: Distill Episodes
For each significant conversation found:
```markdown
---
type: episode
date: YYYY-MM-DD
tags: [relevant, tags, here]
significance: low|medium|high|critical
source: sage
related: [other-episode-files]
---

# [Descriptive Title]

[What happened, what was decided, what was built]

## Key Decisions
- Decision 1
- Decision 2

## Files Created
- path/to/file.md (if applicable)
```

### Step 4: Extract Knowledge (If Warranted)
If a conversation reveals a stable pattern, principle, or entity:
- Create/update the relevant `knowledge/` file
- Add to `semantic/entities/` or `semantic/themes/` if significant
- Add to `procedural/patterns/` or `anti-patterns/` if it's a repeating behavior

### Step 5: Write to Disk
Via MacKitt (Sage) or direct file write (Forge):
- Episodes: `memory/episodes/YYYY-MM-DD-{description}.md`
- Knowledge: `memory/knowledge/{topic}.md`
- Mining run summary: `memory/episodes/YYYY-MM-DD-{N}th-mining-run.md`

### Step 6: Update Indexes
After writing files:
- Update `memory/episodes/index.md` with new entries + heat scores
- Update `memory/semantic/index.md` if new entities/themes created
- Update `memory/procedural/index.md` if new patterns added

### Step 7: Log the Run
Write a mining run episode (meta-episode) documenting:
- How many conversations found
- What was new vs. already known
- What gaps remain
- Files created

## Tips
- Mine in reverse chronological order (most relevant first)
- Don't try to do everything in one run — 9 runs were needed for full coverage
- ChatGPT history requires a separate export pipeline (not conversation_search)
- A project-scoped conversation is invisible from other project scopes
- Significance should be honest — most episodes are medium, not everything is high

## Known Gap
ChatGPT history (1,008 conversations, Feb 2023 – Mar 2026) requires:
1. G exports data from ChatGPT settings
2. Process through a pipeline (Muse or script)
3. Filter for G-relevant conversations
4. Convert to episode format
This pipeline has NOT been built yet (as of Mar 4, 2026).
