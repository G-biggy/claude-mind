# Memory System — 5-Layer Architecture

This directory is the brain's storage. Biomimetic design: mirrors human Complementary Learning Systems to give the AI genuine cross-session continuity.

## The Layers

```
memory/
├── working/             ← Layer 1: Hot cache — what matters RIGHT NOW
│   └── context.md       # Active threads, open questions, hot references
├── episodes/            ← Layer 2: Episodic memory — specific events
│   ├── index.md         # Master index with heat scores
│   └── YYYY-MM-DD-*.md  # One file per significant event
├── semantic/            ← Layer 3: Semantic memory — consolidated knowledge
│   ├── entities/        # One file per important noun
│   ├── themes/          # Cross-cutting threads
│   └── index.md         # Master list
├── procedural/          ← Layer 4: Procedural memory — what to do
│   ├── patterns/        # Things that work
│   ├── anti-patterns/   # Things that fail
│   ├── playbooks/       # Multi-step procedures
│   └── index.md
├── archive/             ← Layer 5: Long-term storage
│   ├── index.md         # Searchable catalog
│   └── chatgpt-import/  # Historical ChatGPT context
├── knowledge/           ← Legacy (being absorbed into semantic/)
├── errors/              ← Legacy (being absorbed into procedural/anti-patterns/)
└── successes/           ← Legacy (being absorbed into procedural/patterns/)
```

## Biological Analogs

| Memory Layer | Brain Analog | Characteristics |
|-------------|-------------|-----------------|
| working/ | Prefrontal cortex | Fast, volatile, what's currently active |
| episodes/ | Hippocampus | Fast capture, full context, event-specific |
| semantic/ | Neocortex | Slow-built, generalized, long-lasting |
| procedural/ | Basal ganglia | Pattern-based, implicit, action-oriented |
| archive/ | Long-term memory | Compressed, not actively loaded, searchable |

## How Memory Flows

```
Event happens
     ↓
Episode written (episodes/YYYY-MM-DD-*.md)
     ↓
Muse consolidates (scripts/muse-consolidate.js)
     ↓
Working memory refreshed (working/context.md)
     ↓
New entities/themes extracted (semantic/)
     ↓
Patterns identified (procedural/)
     ↓
Old episodes compressed (archive/) ← future
```

## Consolidation

Muse (Ollama qwen2.5:7b) handles consolidation:
- **Auto-triggered** after every Bridge task completes (watcher.js hook)
- **Manual trigger**: `node /Users/ghayyathhuzayen/VS-workspace/claude-bridge/scripts/muse-consolidate.js`
- **Sage skill**: "consolidate" skill in claude-bridge/skills/consolidate/

## Heat Scores

Episodes have heat scores for prioritization:
```
heat = recency_factor × significance_factor × access_factor
- recency: 1.0 today, −0.1/day, min 0.1
- significance: critical=1.0, high=1.0, medium=0.7, low=0.4
- access: 1.0 + (0.1 × access_count), capped 1.5
```

See `episodes/index.md` for current heat scores.

## File Formats

### Episode
```yaml
---
type: episode
date: YYYY-MM-DD
tags: [tag1, tag2]
significance: low|medium|high|critical
source: sage|forge|muse
related: [other-episode.md]
---
# Title
Content...
```

### Entity
```yaml
---
type: entity
status: active|dormant|resolved
created: YYYY-MM-DD
last_relevant: YYYY-MM-DD
related_entities: [entity1]
related_themes: [theme1]
---
# Entity Name
## What / Timeline / Current Status / Source Episodes
```

### Pattern / Anti-Pattern
```yaml
---
type: pattern|anti-pattern
category: architecture|tooling|infrastructure|...
status: proven|observed
confidence: 0.0-1.0
---
# Pattern Name
## What / Why / Rules
```

## Legacy Directories

- `knowledge/` — Pre-5-layer knowledge files. Still valid, gradually absorbed into semantic/.
- `errors/` — Pre-5-layer error files. Being absorbed into procedural/anti-patterns/.
- `successes/` — Pre-5-layer success files. Being absorbed into procedural/patterns/.

These are NOT deleted — they remain the source of truth until migration is complete.
