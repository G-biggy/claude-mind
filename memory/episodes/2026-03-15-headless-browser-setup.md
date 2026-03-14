---
date: 2026-03-15
slug: headless-browser-setup
type: episode
tags: [infrastructure, puppeteer, browse, tools]
---

# Episode: Headless Browser Setup

## What happened

Task dispatched to install Puppeteer and create a CLI browse tool for Forge's autonomous web access.

## What was built

`scripts/browse.js` — a single-file CLI with 4 commands:
- `screenshot <url> [path]` — captures PNG to /tmp by default
- `text <url>` — extracts readable text (strips nav/footer/ads)
- `links <url>` — returns all hrefs with anchor text
- `check <url>` — returns HTTP status + page title (deploy verification)

All output JSON. 30s timeout. Normal browser UA string.

## Key decisions

- Root `package.json` uses `"type": "module"` → wrote `browse.js` as ESM (import, not require)
- Puppeteer auto-downloaded its own Chromium (Apple Silicon compat) — no system Chrome needed
- `--no-sandbox` and `--disable-setuid-sandbox` flags added for macOS compatibility
- Text extraction removes nav/header/footer/aside/script/style before reading innerText

## Test results

- `check https://ghayyath.com` → `{"ok":true,"status":200,"title":"Ghayyath H"}` ✅
- `screenshot https://ghayyath.com /tmp/test-screenshot.png` → 854K PNG ✅
- `links https://ghayyath.com` → 1 link found ✅
- `text https://ghayyath.com` → readable bio content ✅
- `check https://bridge.ghayyath.com` → `{"ok":false,"status":404}` (expected — domain not live) ✅

## Commit

`4955dbf` — feat: headless browser — browse.js CLI with screenshot/text/links/check

## Documented in

`~/.claude/CLAUDE.md` → new `## 12. Tools > Headless Browser` section
