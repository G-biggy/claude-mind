---
type: knowledge
date: 2026-03-03
tags: [g, coding, rules, preferences, style]
confidence: 0.95
significance: high
source: sage
related: [./working-with-g.md]
last_accessed: 2026-03-03
access_count: 0
---

# G's Explicit Coding Rules

These are G's specific rules, surfaced from Aug 2025 pre-project conversations where he was writing a CLAUDE.md-style ruleset for GitHub Copilot. More specific than the philosophy in working-with-g.md.

## The Rules (Verbatim Intent)

1. **Always prefer simple solutions.** If something can be done simply, do it simply.

2. **Avoid code duplication.** Before writing new code, check if similar functionality already exists elsewhere in the codebase. Reuse.

3. **Environment awareness.** Write code that accounts for dev, test, and prod. They behave differently.

4. **Minimal change footprint.** Only touch code that's directly related to the requested change. If you're not confident a change is related or well-understood, don't make it.

5. **Bug-fixing discipline.** When fixing a bug, exhaust all options within the existing implementation before introducing a new pattern or technology. If you do introduce new, remove the old. No duplicate logic.

6. **Keep the codebase clean and organized.** Structure, naming, and formatting matter.

7. **No one-shot scripts in files.** Avoid writing scripts that are only meant to be run once. They accumulate.

8. **File length cap: 200-300 lines.** Refactor when a file exceeds this. Long files are a smell.

9. **No mock data in dev/prod.** Mocking and stubbing is for tests only. Never fake data patterns in dev or production environments.

10. **Focus on the relevant area.** Don't touch code unrelated to the task. Side effects compound.

11. **Test major functionality thoroughly.** Write real tests.

12. **Don't re-architect working things.** Once a feature works well, don't change its architecture unless explicitly asked.

13. **Think downstream.** Before changing something, consider what other methods or areas could be affected.

## Source & Context

Found in Aug 28–31, 2025 conversations where G was building a color theme testing tool and assembling these rules to feed into GitHub Copilot. The rules were photographed and shared with Claude for extraction into an artifact.

These rules predate claude-mind but represent G's long-standing engineering values, not one-off preferences.

## How They Relate to Working-With-G

`working-with-g.md` captures the spirit (simplicity, clean architecture, no over-engineering). This file captures the *letter* — the specific tactical rules that operationalize that philosophy during code work.
