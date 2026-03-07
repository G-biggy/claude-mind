---
type: anti-pattern
category: platform-friction
severity: medium
created: 2026-03-04
last_occurred: 2026-02-17
confidence: 0.85
source_error: 2026-02-17-skill-upload-failures.md
---

# Claude.ai Skill Upload — UI is Fragile

## What
Uploading custom skills via Claude.ai's Capabilities tab frequently fails with "Internal server error" for both .md and .zip uploads. YAML frontmatter parsing also causes issues.

## Workarounds
1. Use the manual "Write skill instructions" form for simple skills
2. For zip uploads: structure MUST be `skill-name/SKILL.md` with correct YAML frontmatter
3. Test skill mounting in a new conversation by checking /mnt/skills/user/
4. Keep local copies of all skills in claude-mind/skills/ (source of truth)
5. Skills are per-project in Claude.ai — add to each project separately

## Rules
- Never trust the upload succeeded without testing in a new conversation
- Keep skill source files in version control (claude-bridge/skills/)
- The zip structure is non-negotiable: skill folder → SKILL.md inside
