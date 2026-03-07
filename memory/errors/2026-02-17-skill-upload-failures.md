# Skill Upload Failures

**Date:** 2026-02-17
**Severity:** Medium
**Category:** Platform friction

## What Went Wrong

Multiple attempts to upload custom skills through Claude.ai's Capabilities tab failed:
- .md file uploads: "Internal server error"
- .zip file uploads: Same error
- YAML frontmatter formatting caused additional parsing issues
- Even after successful upload, skills weren't mounting in /mnt/skills/user/ for other projects

## Resolution

1. Used the manual "Write skill instructions" form as a workaround for the first skill
2. Later created a properly structured zip file for `task-dispatch` that finally worked
3. The key was getting the zip structure exactly right: skill folder containing SKILL.md with proper frontmatter

## Lesson

1. Skill upload through the UI is fragile — expect failures
2. The zip structure must be: `skill-name/SKILL.md` with proper YAML frontmatter
3. Keep a local copy of all skill source files in claude-mind/skills/ as backup
4. Test skill mounting by checking /mnt/skills/user/ in a new conversation
5. Skills are per-project in Claude.ai — need to be added to each project separately
