# Episode: Figma Forge — Fix Engine + Persistence + Variable Picker

**Date:** 2026-03-04
**Project:** figma-forge-plugin
**Status:** Shipped

---

## What Happened

Continued building the Figma Forge plugin from Task 6 (React UI) through implementing the full Fix Engine spec.

### Session start state
- Plugin UI was showing blank. Task 6 (React UI) needed to be built from scratch.
- Then a series of Figma `documentAccess: dynamic-page` API errors appeared during testing.

### Errors fixed during session
1. `getLocalVariables` → `getLocalVariablesAsync()`
2. `findAllWithCriteria` → required `await page.loadAsync()` first
3. `get_mainComponent` → `await instance.getMainComponentAsync()`
4. `getNodeById` → `await figma.getNodeByIdAsync()`
5. `set_selection: The selection of a page can only include nodes in that page` → fix: traverse parent chain to find the node's PageNode, then `figma.currentPage = page` before selecting

### Features shipped
- **Task 6 (React UI):** Full React app with DashboardView, ReportView, IssueList, IssueCard, ScoreRing, CategoryBar, ProgressIndicator, EmptyState, useHealthReport, useTheme, usePluginMessages
- **Task 7 (Fix Engine):** Color/typography/spacing fixers, APPLY_FIX message flow
- **Skip/Undo/Filters:** Skip button, Restore button, Revert button (plugin-native undo), status filter tabs (Pending/All/Fixed/Skipped), live score adjustment
- **Score bug fix:** `computeAdjusted` was using `Math.round((score/100) * totalChecked)` to reconstruct passing count — lossy due to rounding. Fixed to use `totalChecked - issueCount` directly.
- **FIX-ENGINE-SPEC.md:** Full implementation:
  - Multi-match variable detection (0/1/2+ match branches)
  - `issueKey` stable identifier added to all issues (`{nodeId}:{property}:{rawValue}`)
  - `figma.clientStorage` persistence layer (`persistence.ts`)
  - Score formula corrected: skipped excluded from denominator (`passing + fixed) / (totalChecked - skipped)`)
  - Variable picker UI (inline, grouped by collection)
  - REVERT_FIX message flow (applies undo + clears persisted state)
  - VALIDATE_FIXED_ISSUES for Cmd+Z desync detection

---

## Key Technical Patterns

### Figma `documentAccess: dynamic-page` rules
- All document-level APIs must be async when manifest has this setting
- Page nodes must be explicitly loaded with `await page.loadAsync()` before traversal
- `instance.mainComponent` → `await instance.getMainComponentAsync()`

### Multi-page node selection
```typescript
// Find the page a node belongs to
function findPage(n: BaseNode): PageNode | null {
  if (n.type === 'PAGE') return n as PageNode;
  return n.parent ? findPage(n.parent) : null;
}
// Switch page before selecting
if (page && page !== figma.currentPage) figma.currentPage = page;
figma.currentPage.selection = [sceneNode];
```

### Score adjustment formula (correct)
```typescript
const originalPassing = totalChecked - issueCount;
const adjustedTotal = Math.max(1, totalChecked - skippedInCat);
const adjustedPassing = Math.min(adjustedTotal, originalPassing + fixedInCat);
const adjustedScore = Math.round((adjustedPassing / adjustedTotal) * 100);
```

### Persistence pattern
- Key: `issueState:{figma.fileKey}`
- issueKey format: `{nodeId}:{property}:{rawValue}` (stable across re-scans)
- Stale entries pruned after every scan (valid issueKeys from fresh report)
- Persisted states sent alongside HEALTH_REPORT, UI matches by issueKey → issue.id to init state

---

## Files Modified

**Sandbox:**
- `src/sandbox/code.ts` — message router (SELECT_NODE page fix, SKIP/REVERT/VALIDATE handlers)
- `src/sandbox/persistence.ts` (NEW) — clientStorage helpers
- `src/sandbox/auditors/color-auditor.ts` — multi-match, issueKey
- `src/sandbox/auditors/typography-auditor.ts` — issueKey
- `src/sandbox/auditors/spacing-auditor.ts` — issueKey
- `src/sandbox/auditors/component-auditor.ts` — issueKey
- `src/sandbox/auditors/naming-auditor.ts` — issueKey
- `src/sandbox/auditors/token-auditor.ts` — issueKey
- `src/sandbox/utils/color-utils.ts` — `findAllMatchingVariables()`
- `src/sandbox/collectors/index.ts` — `collectionName` on color variables
- `src/sandbox/fixers/color-fixer.ts` — returns undo FixData

**UI:**
- `src/ui/hooks/useHealthReport.ts` — persistence init, REVERT/VALIDATE handlers, updated score formula, issueKey routing
- `src/ui/App.tsx` — HealthContext with updated signatures
- `src/ui/components/IssueCard.tsx` — Pick/Fix/Revert buttons, picker integration
- `src/ui/components/IssueList.tsx` — passes issueKey to callbacks
- `src/ui/components/VariablePicker.tsx` (NEW) — grouped variable picker

**Shared:**
- `src/shared/types.ts` — issueKey, matchingVariables, PersistedIssueStates, new message types
