# Episode: Figma Forge — Fix Engine Design Decisions

**Date:** 2026-03-04
**Project:** figma-forge-plugin
**Author:** sage

---

## What Happened

G was testing the fix engine and found the variable matching was broken. It grabbed the first primitive match (`color/blue/500`) instead of walking the token hierarchy to find the semantic/contextual token. The fix worked technically but didn't respect the user's variable structure.

## Decisions Made

### Variable Matching: User-Select Over Auto-Match
Debated two approaches: (a) auto-detect token tier and apply the "correct" one, or (b) let the user pick when multiple variables match. Chose user-select because every team's naming is different, even teams following Curtis/Frost/W3C conventions have enough variation that auto-matching would be wrong often enough to kill trust. One wrong auto-fix on a design system file = instant uninstall.

The logic:
- **1 match** → auto-apply, no picker
- **2+ matches** → show picker grouped by collection name
- **0 matches** → flag it, no fix button (future: Create Variable)

### Persistence: figma.clientStorage
Skip/fix state was React-only, resetting on restart. Solution: `figma.clientStorage` keyed by `issueState:{figma.fileKey}` to prevent cross-file leakage. Issue keys use `{nodeId}:{property}:{rawValue}` for stability across re-scans. Stale entries pruned after each scan.

### Undo: Re-Validate on Interaction
Figma's Plugin API has no undo stack access. Two paths:
- Plugin Revert button (stores original value, re-applies it)
- Cmd+Z detection via re-validate: when user clicks a "fixed" issue, re-check the node's current state. If it doesn't match the fix, flip back to unfixed.

Optional batch re-validate on page change or panel focus.

### Score Formula
Skipped issues excluded from denominator: `(originalPassing + fixed) / (totalChecked - skipped)`. This means skipping intentional deviations moves you toward 100%.

## Artifacts
- Wrote `wip-handoff/FIX-ENGINE-SPEC.md` — full spec covering all of the above plus message protocol updates and implementation order.
- Created `wip-handoff/` folder convention for Sage→Forge handoffs. Delete when project ships.
- Forge implemented the entire spec in the same session (separate episode by Forge).

## Lesson
The "first match" bug was a classic case of optimizing for speed over correctness. The fix logic should always consider context (what property is this value on?) and structure (what tier does this variable belong to?) before applying. Added this as a global rule in Forge's CLAUDE.md.
