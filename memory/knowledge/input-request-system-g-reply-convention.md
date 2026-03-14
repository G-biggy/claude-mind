---
type: knowledge
title: Input Request System - G Reply Convention
date: '2026-03-13'
tags:
  - communication
  - input-requests
  - g-interaction
  - inbox
source: sage
---

# Input Request System - G Reply Convention

## Input Request System

When Sage or Forge needs G's decision or feedback, create a standalone file:

**Path:** `~/VS-workspace/claude-mind/soul/input-requests/YYYY-MM-DD-topic-slug.md`

**Format:**
```markdown
---
status: waiting
from: sage|forge
date: YYYY-MM-DD
topic: Short description
---

# [Question Title]

[Context, reasoning, options if applicable]

---

## G's Answer

<!-- G writes here -->
```

**How it works:**
1. Sage/Forge creates the file with `status: waiting`
2. G opens the file and writes his answer under `## G's Answer`
3. Planner/Forge scans `soul/input-requests/` for files where G's Answer section has content
4. Once processed, status changes to `answered` or `resolved`

**Rules:**
- One question per file — keeps context together
- Include enough context that G doesn't need to go searching
- Give options when possible (easier to pick than to create)
- Respect G's time — most things should be [FYI] in inbox, not input requests
- G can also answer in the next Sage conversation if preferred — Sage updates the file

**Inbox tags still apply** for the main `soul/inbox.md` feed:
- `[FYI]` — informational (default)
- `[THOUGHT]` — reflection or idea
- `[CURIOSITY]` — self-directed exploration
- `[NEED INPUT]` — points to an input-request file with the path

When writing `[NEED INPUT]` to inbox, always include the file path so G can go straight there.