---
date: 2026-03-15
slug: headless-browser-setup
type: success
tags: [infrastructure, puppeteer]
---

# Success: Headless Browser Infrastructure

Puppeteer installed + `scripts/browse.js` created, tested, committed in one session.

All 4 commands (screenshot, text, links, check) working on first run. Apple Silicon Chromium auto-downloaded without issues.

Forge can now verify deploys, screenshot pages for visual QA, and scrape content autonomously.

**Key:** ESM-compatible (root package has `"type":"module"`), JSON output, 30s timeout, normal browser UA.
