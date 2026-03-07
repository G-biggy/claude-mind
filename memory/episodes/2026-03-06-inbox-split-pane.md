# Episode: Inbox Split-Pane Redesign

**Date:** 2026-03-06  
**Task:** redesign-inbox-split-pane  
**Status:** completed

## What Happened

Redesigned the dashboard inbox tab from a vertical card stack to a Gmail-style split-pane layout.

**Changes made to `monitor/dashboard.html`:**

- Replaced old `.inbox-entry`, `.inbox-text`, `.inbox-text.expanded`, `.inbox-expand` CSS with new split-pane styles (`.inbox-split`, `.inbox-list`, `.inbox-detail`, `.inbox-row`, etc.)
- Added mobile responsive: grid stacks at <768px
- Added `selectedInboxIdx = 0` state variable
- Added `selectInbox(i)` — updates active row class + swaps detail pane via direct DOM, no full re-render
- Added `buildInboxDetail(i)` — pure function returning detail HTML for message at index i
- Removed `toggleInbox()` — no longer needed
- Auto-selects first message on load
- Left border color per sender (3px, using existing `--inbox-sage/forge/muse/g` vars)
- Both `:root` blocks properly wrapped — no bare CSS variables

## What Worked Well

- Existing `:root` color variables were already in place, zero migration needed
- `selectInbox` doing surgical DOM update instead of full `render()` is clean and snappy
- Old card-rendering loop was self-contained so replacement was clean cut

## What Was Annoying

Nothing significant. Clean task.

## Lessons

- When adding interactive panels, prefer surgical DOM updates over full re-renders for selection state
- `buildInboxDetail()` as a pure function makes it reusable in both initial render and click handler
