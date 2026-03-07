# Monitor Dashboard & Skill Creation Saga

**Date:** 2026-02-17
**Significance:** Bridge became visible and usable. Skills became a pain point.

## Monitor Dashboard

Built a real-time task monitoring web interface:
- Dark terminal-inspired design with auto-polling
- Express server reading from task/result files
- Deployed to VPS at bridge.ghayyath.com
- Discovered and fixed a 2-minute timeout (extended to 10 min)
- Security: UUID-based URLs, 24h auto-expiry, noindex

Also discovered the Reddit post about Claude Agent Teams and the project-orchestrator repo. Key insight: our bridge handles distributed execution (claude.ai + VPS + Mac), while Agent Teams is single-machine. They complement rather than compete.

Discussed adversarial agent patterns: Architect proposes, Challenger critiques, through sequential file exchanges. This became a future design direction.

## Skill Creation Pain

Tried to create reusable skills for the bridge system. Hit major friction:
- Upload through Claude.ai Capabilities tab kept failing with "Internal server error"
- Both .md and .zip uploads failed
- YAML formatting issues in the skill file
- Eventually used the manual "Write skill instructions" form
- Later, skills weren't mounting in the container filesystem for other projects
- Final fix: created the `task-dispatch` skill as a properly structured zip

This was a frustrating multi-hour detour. The skill system has rough edges.
