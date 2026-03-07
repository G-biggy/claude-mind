# Capabilities Registry

> What I can do. Updated as new skills, MCPs, and tools are built.

---

## Instances & Their Capabilities

### Sage (Claude.ai)
- Web search and research
- Deep reasoning and strategy
- Document creation (docx, pptx, xlsx, pdf)
- Artifact creation (React, HTML, SVG, Mermaid)
- Task dispatch to Forge via Bridge
- File operations via MacKitt MCP
- Google Drive access
- Conversation with G
- Memory retrieval (reads from claude-mind/)
- Episode recording (writes to claude-mind/memory/episodes/)

### Forge (Claude Code CLI)
- Full filesystem access on G's Mac
- Code writing, editing, debugging
- Package installation (npm, pip, brew)
- Git operations
- SSH to VPS (agent-vps)
- Project scaffolding and builds
- Task execution from Bridge queue
- Script execution and testing

### Muse (Ollama — Local AI)
- Memory consolidation (planned)
- Episode summarization (planned)
- Pattern extraction (planned)
- Knowledge deduplication (planned)
- Daily brief generation (planned)
- Confidence scoring (planned)

**Status: Operational. Model: qwen2.5:7b (4.7GB). Installed 2026-03-03 by Forge.**

### Bridge (claude-bridge daemon)
- Task file watching and dispatch
- Priority queue management
- Progress monitoring via web dashboard
- Result delivery with notifications
- macOS notification integration
- VPS-hosted monitoring at bridge.ghayyath.com

---

## Skills Available to Sage

| Skill | Location | Purpose |
|-------|----------|--------|
| task-dispatch | /mnt/skills/user/task-dispatch/ | Send work to Forge |
| docx | /mnt/skills/public/docx/ | Create Word documents |
| pptx | /mnt/skills/public/pptx/ | Create presentations |
| xlsx | /mnt/skills/public/xlsx/ | Create spreadsheets |
| pdf | /mnt/skills/public/pdf/ | Create/edit PDFs |
| frontend-design | /mnt/skills/public/frontend-design/ | Web UI design |
| personal-writer | /mnt/skills/user/personal-writer/ | Blog/article writing |
| seo-writer | /mnt/skills/user/seo-writer/ | SEO content |
| skill-creator | /mnt/skills/examples/skill-creator/ | Build new skills |
| mcp-builder | /mnt/skills/examples/mcp-builder/ | Build MCP servers |
| vercel-deploy | /mnt/skills/user/vercel-deploy/ | Deploy to Vercel |
| supabase-expert | /mnt/skills/user/supabase-expert/ | Database operations |
| stripe-integration | /mnt/skills/user/stripe-integration/ | Payments |
| ux-ui-audit | /mnt/skills/user/ux-ui-audit-v0-1-0/ | UX review |

## MCPs Available

| MCP | What It Does |
|-----|-------------|
| MacKitt | File operations, shell commands, process management on G's Mac |
| Notion | Read/write Notion pages and databases |
| Google Calendar | Calendar events and scheduling |
| Gmail | Email search, read, draft |
| Google Drive | Document search and fetch |
| Figma | Design file access |
| Supabase | Database operations |
| Stripe | Payment operations |

---

## Hooks & Sub-Agents

| Component | Status | Description |
|-----------|--------|-------------|
| Conversation start hook | **Not built** | Loads soul + relevant memories when Sage opens |
| Conversation end hook | **Not built** | Captures episode summary when conversation ends |
| Conversation checkpoint | **Not built** | Saves state before context compression, enables clean handoff |
| Idle trigger (30 min) | **Not built** | Triggers Muse consolidation during inactivity |
| Bridge task enrichment | **Not built** | Prepends mind context to Forge task prompts |
| Sub-agent spawner | **Not built** | Creates specialized agents for complex tasks |
| Task archival hook | **Not built** | Moves completed Bridge tasks to archive, triggers Muse extraction |

## Autonomous Pipelines

| Pipeline | Status | Description |
|----------|--------|-------------|
| Memory Encoding | **Not built** | Extract memories from conversations |
| Night Consolidation | **Not built** | Muse processes daily episodes |
| Morning Brief | **Not built** | Muse generates daily summary |
| Capability Gap Detection | **Not built** | Auto-detect missing tools |
| Self-improvement | **Not built** | Auto-propose skill/MCP creation |
