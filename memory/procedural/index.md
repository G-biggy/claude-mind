---
type: index
layer: procedural
last_updated: 2026-03-04
updated_by: forge
---

# Procedural Memory Index
*Last updated: 2026-03-04*

The procedural layer captures WHAT WORKS and WHAT FAILS. Patterns are replicated. Anti-patterns are avoided. Playbooks are followed for multi-step procedures.

## Patterns (Things That Work)

| Pattern | Category | Confidence | Last Validated |
|---------|----------|-----------|----------------|
| [flat-file-task-dispatch.md](patterns/flat-file-task-dispatch.md) | architecture | 0.95 | 2026-02-16 |
| [progressive-enhancement-build.md](patterns/progressive-enhancement-build.md) | build-strategy | 0.90 | 2026-02-17 |
| [mackitt-for-mac-files.md](patterns/mackitt-for-mac-files.md) | tooling | 0.99 | 2026-03-02 |

## Anti-Patterns (Things That Fail)

| Anti-Pattern | Category | Severity | Last Occurred |
|-------------|----------|----------|---------------|
| [ssh-config-without-lifeline.md](anti-patterns/ssh-config-without-lifeline.md) | infrastructure | critical | 2026-02-12 |
| [decisions-only-in-conversation.md](anti-patterns/decisions-only-in-conversation.md) | knowledge-mgmt | critical | 2026-02-16 |
| [skill-upload-fragility.md](anti-patterns/skill-upload-fragility.md) | platform-friction | medium | 2026-02-17 |

## Playbooks (Multi-Step Procedures)

| Playbook | Runs | Last Run | Status |
|---------|------|----------|--------|
| [memory-mining-run.md](playbooks/memory-mining-run.md) | 9 | 2026-03-04 | proven |

## To Add (Future Consolidation)
- patterns/biomimetic-memory-design.md
- patterns/launchd-service-setup.md
- patterns/markdown-adr-format.md
- anti-patterns/vps-as-execution-env.md (CC must run locally)
- playbooks/new-project-setup.md
- playbooks/deploying-to-vps.md
