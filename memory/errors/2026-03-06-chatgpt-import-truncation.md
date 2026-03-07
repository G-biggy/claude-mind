---
date: 2026-03-06
title: ChatGPT Import Mining Was 93% Lossy
severity: high
category: data-integrity
resolved: yes
---

# ChatGPT Import Mining Truncation

## What Failed
Forge's bulk mining task (Mar 4) extracted conversation titles and snippets from 1,008 ChatGPT JSON files into 7 themed markdown files. The extraction silently truncated, capturing only ~10-15 entries per category when the raw data contained 50-100+ per category.

## Impact
- Job search: 12 of 182 conversations captured (93% loss)
- Other 6 categories: Unknown loss rate, presumed similar
- Memory system had fundamentally wrong data about G's job search scale, timeline, and geographic scope

## Root Cause
Forge's context/output window was exhausted during the mining task. No chunking, no count verification, no truncation warning.

## Fix Applied
- Job search rebuilt from raw JSON via Python script (Mar 6)
- Other 6 categories still need audit

## Prevention
- Future bulk extraction tasks must chunk by file or category
- Output should include expected vs actual counts
- Post-extraction verification step needed

## Key Paths
- Raw source: `/Users/ghayyathhuzayen/VS-workspace/claude-mind/imports/chatgpt/`
- Archive: `/Users/ghayyathhuzayen/VS-workspace/claude-mind/memory/archive/chatgpt-import/`
- Knowledge: `/Users/ghayyathhuzayen/VS-workspace/claude-mind/memory/knowledge/chatgpt-import/`
