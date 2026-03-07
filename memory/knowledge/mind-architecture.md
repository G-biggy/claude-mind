---
type: knowledge
date: 2026-02-11
tags: [architecture, memory, biomimetic, system-design, foundational]
confidence: 0.8
significance: high
source: sage
related: [../episodes/2026-02-11-the-birth-of-mind.md]
last_accessed: 2026-02-11
access_count: 0
---

# Mind Architecture

How this system works, why it's designed this way, and the biological principles behind it.

## The Split-Brain Model

The system separates premium thinking from background processing:

- **Claude (Sage + Forge)**: Expensive, powerful. Only used when G needs high-quality reasoning or building. Reads from memory at conversation start, writes episodes at conversation end.
- **Ollama (Muse)**: Free, local. Handles all background memory processing: consolidation, pattern extraction, summarization, decay. Runs on scheduled cycles.

## Biological Basis

The architecture mirrors the brain's Complementary Learning Systems:

- **Episodes = Hippocampus**: Fast capture of specific events. Full context preserved initially. Capacity-limited, compressed over time.
- **Knowledge = Neocortex**: Slow-built, generalized patterns extracted from many episodes. Resistant to interference. Long-lasting.
- **Consolidation = Sleep replay**: Muse reviews episodes offline (like the brain during slow-wave sleep), replaying them to extract patterns and integrate with existing knowledge.
- **Reconsolidation**: When retrieved knowledge contradicts new experience, it temporarily becomes labile and can be updated.
- **Forgetting = Garbage collection**: Confidence decay on unused memories. Episode compression. Contradiction pruning.

## File-Based Design Choices

- Flat markdown files over database: human-readable, git-versionable, zero infrastructure.
- YAML frontmatter for metadata: machine-parseable, human-readable.
- One file per memory: simple to create, read, modify, delete.
- Hierarchical directories by type: episodes/, knowledge/, errors/, successes/.
- Filename conventions encode date and description for easy browsing.

## Integration Points

- claude-bridge: Task dispatch (Sage → Bridge → Forge). Bridge tasks can be enhanced with mind context.
- MacKitt MCP: File operations on G's Mac from Sage.
- Ollama REST API: localhost:11434 for Muse operations.
- launchd: Scheduled triggers for Muse routines.

## Consolidation Flow (updated 2026-03-04)

Two phases, always both:
1. Write episodes/successes/errors/knowledge to local files
2. Run Muse: `cd ~/VS-workspace/claude-bridge && node scripts/muse-consolidate.js`

Global for Forge: `~/.claude/CLAUDE.md` — loads in every project session.
Skills are project-scoped — not global. CLAUDE.md is the right place for global behavior.
