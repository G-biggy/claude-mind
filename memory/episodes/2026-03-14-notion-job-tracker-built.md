---
type: episode
date: 2026-03-14
tags: [job-search, notion, tracker, infrastructure, memory-routing]
significance: high
source: sage
related: [../knowledge/g-job-search-history.md, ../knowledge/g-professional-background.md]
---

# Notion Job Tracker Built — Full Application History Migrated

**Date:** 2026-03-14
**Context:** G asked to build a job application tracker in Notion under the Resume parent page.

## What Happened

1. **Created Notion database** "Job Applications" as a sub-database of the Job Tracker page
2. **Schema:** Company (title), Role, Status (Applied/Skipped/Interviewed/Ghosted/Rejected/Offer/Declined), Fit (GREEN/YELLOW/RED/Not Assessed), Date, Location, Work Mode, CV Used, Salary Ask, Source, Notes, JD Link
3. **Created kanban view** "Pipeline" grouped by Status
4. **Populated ~170 cards** in 4 batch API calls:
   - 25 initial entries from Claude project conversations + memory
   - 50 more from Jul-Nov 2025 (GPT history via claude-mind)
   - 50 more from Dec 2025-Feb 2026
   - 48 more (remaining Feb applied + all 41 skipped entries)
5. **Source:** Full application list read from `g-job-search-history.md` via MacKitt (memory_recall truncated at 4K chars, file is 12KB)

## Key Decision

**Notion is now the canonical source of truth for job application tracking.** The memory file (`g-job-search-history.md`) retains value for strategy notes, intensity patterns, and geographic analysis, but all status lookups and new entries go to Notion.

## Tool Routing Lesson

- `memory_recall` truncates at ~4K chars — fine for most files, but g-job-search-history.md is 12KB
- `memory_search` is grep, returns fragments not full sections
- `mackitt_file_read` is the reliable path for large known files
- This specific scenario (bulk read of full application list) won't recur now that Notion holds the data

## Notion Database Reference

- Database URL: https://www.notion.so/21965d568f80467f8bcd902404713f5e
- Data source ID: a6e6a91b-1196-4231-b1c4-c92ef3d242f8
- Parent page: Job Tracker - Kanban Board (under Resume)

## What G Needs To Do

- Mass-move Sep-Dec 2025 "Applied" cards to "Ghosted" (no responses received)
- Fill in "Role" names where they say "Unknown" (GPT history didn't capture titles)
- Keep board updated as new applications happen
