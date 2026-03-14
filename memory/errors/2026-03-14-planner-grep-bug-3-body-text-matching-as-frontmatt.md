---
type: error
title: Planner grep bug 3 - body text matching as frontmatter
date: '2026-03-14'
tags:
  - bug
  - planner
  - grep
  - frontmatter
source: sage
---

# Planner grep bug 3 - body text matching as frontmatter

## The Bug

`planner.sh` line 102 used `grep -rl 'status: pending'` to check for queued tasks. This matched the string ANYWHERE in the file, including in the markdown body where task instructions contained example YAML frontmatter blocks.

The `inner-life-infrastructure.md` task had instructions that included an example task template with `status: pending` in a code block — the grep matched it as a real pending task. Forge was blocked for hours.

## The Fix

Replaced with frontmatter-aware awk parser:
```bash
PENDING=0
for taskfile in "$TASKS_DIR"/*.md; do
    [ -f "$taskfile" ] || continue
    FM_STATUS=$(awk '/^---$/{c++; next} c==1 && /^status:/{print $2; exit}' "$taskfile")
    if [ "$FM_STATUS" = "pending" ] || [ "$FM_STATUS" = "in-progress" ]; then
        PENDING=$((PENDING + 1))
    fi
done
```

The awk parser counts `---` delimiters and only reads `status:` from the first frontmatter block (between the first and second `---`).

## Pattern

This is the THIRD grep-related bug in the planner:
1. inbox-reply-* files contaminating G-is-active check (fixed 2026-03-12)
2. This body-text grep bug (fixed 2026-03-14)
3. (future) Any new grep that doesn't respect frontmatter boundaries

**Rule: NEVER use plain grep to check YAML frontmatter in markdown files. Always use the awk frontmatter parser pattern.**