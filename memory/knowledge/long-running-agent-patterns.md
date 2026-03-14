# Long-Running Agent Patterns

Source: Anthropic engineering blog "Effective harnesses for long-running agents" (Nov 2025)
Applied: 2026-03-14

## Core Problem

Agents working across multiple context windows face two failure modes:
1. **One-shotting** — trying to do too much at once, running out of context mid-implementation, leaving half-finished undocumented work
2. **Premature victory** — seeing progress from earlier sessions and declaring the job done

## Solutions Applied to Our System

### Get Bearings Routine (added to both CLAUDE.md files)
Before any work: orient (pwd), read state (context.md), check git history, smoke test the project, then pick ONE thing to work on.

### Incremental Progress
One feature/fix per cycle. Finish fully (implement, test, commit, document) before starting the next. If too big, implement a working subset and stop cleanly.

### Git Checkpoints
Commit after each unit of work, not just at session end. Commit before switching concerns. Never leave uncommitted half-finished work. Use `git diff` to review before committing.

### Structured Feature Tracking
Anthropic found JSON feature lists (with `passes: true/false`) more robust than markdown for preventing the agent from accidentally editing requirements instead of just marking them done. We kept markdown for now (our philosophy) but worth revisiting for multi-feature projects where Forge keeps losing track of what's done.

### Testing Before Declaring Done
Code changes alone aren't proof. Must verify end-to-end (run it, click it, curl it) before marking a feature complete.

## What We Already Had That Maps
- `context.md` = their `claude-progress.txt`
- Planner/checkpoint system = their initializer agent
- Sage as independent auditor = prevents premature victory
- Inbox relay = cross-session communication channel

## Open Question
Should we adopt JSON for task status tracking on multi-feature projects? Markdown-everywhere is our philosophy, but Anthropic specifically found models mess with markdown checklists more than JSON status fields. Monitor this.
