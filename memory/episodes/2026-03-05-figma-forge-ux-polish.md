---
date: 2026-03-05
project: figma-forge-plugin
type: episode
mood: productive
---

# Figma Forge — UX Polish & Bug Marathon

Long session. G was actively testing the plugin and filing a stream of UX issues and bugs. Fixed everything.

## What Got Built

### UX Improvements
- **Skip All button** — ghost-style button in filter row, skips all pending issues in current category
- **Status filter → custom dropdown** — replaced tab buttons with a compact dropdown (native `<select>` was rejected — system-white popup clashed with dark theme). Built a custom React dropdown with absolute-positioned menu.
- **Scope toggle on dashboard** — interactive segmented control (Current Page / All Pages), clicking re-scans immediately with the new scope. Also shows as a static pill badge in ReportView header.
- **Page name on issue cards** — shows which page an issue is on, inline with node name (`nodeName · PageName`)
- **Page filter in report** — pill filter row appears when issues span multiple pages
- **Empty category state** — when a category genuinely has 0 issues: keep label normal, show empty gray bar track (no fill), hide numbers/percentage. If user clicks into it: show "No issues found" text in all filter states.

### Bug Fixes
- **Negative health scores (-4307%, -26300%)** — `totalChecked`-based math broke when one node generates multiple issues (issueCount > totalChecked). Rewrote `computeAdjusted` to use proportional badness reduction per issue instead.
- **Summary badges not updating** — `computeAdjusted` wasn't updating `report.summary`. Fixed: compute `adjustedSummary` from pending issues and include in adjusted report.
- **"View Full Report" count not updating** — was using raw `reportState.report`, not `adjustedReport`. Fixed.
- **ReportView total count not updating** — same fix, `displayReport = adjustedReport ?? report`.
- **SELECT_NODE crashing dashboard** — sandbox sent `ERROR` when node not found, wiping report state. Fixed: silently `break` instead.
- **Scope persistence bleeding** — current_page skips were affecting all_pages counts (same issueKeys, same storage key). Fixed: scoped storage key as `issueState:{scope}:{fileKey}`.
- **Scope stale closure** — `setScope(s); runHealthCheck()` — `runHealthCheck` closure captured old scope. Fixed: `runHealthCheck(scopeOverride?)` accepts new scope directly.
- **App stuck at loading/scanning screen** — Root cause: `onClick={runHealthCheck}` on Re-scan and Try Again buttons. When `runHealthCheck` signature changed to accept `scopeOverride?`, React started passing the `MouseEvent` as the first arg. `postMessage` tried to serialize a DOM event → DataCloneError → sandbox never received the scan request → UI stuck in `scanning` state forever. Fixed: `onClick={() => runHealthCheck()}`.
- **Missing `totalNodes` in adjustedSummary** — TypeScript caught this; added `totalNodes: report.summary.totalNodes` to the adjusted summary object.

## Key Architectural Changes

### Score formula (final version)
```ts
// Per category — issue-count based (not totalChecked)
const originalBadness = 100 - cat.score;
const adjustedBadness = (originalBadness / cat.issueCount) * pendingInCat;
adjustedScore = Math.round(100 - adjustedBadness);
```

### Page tracking
- `nodePageMap: Record<string, string>` (nodeId → pageName) built during traversal in `node-collector.ts` and `component-collector.ts`
- Merged in `collectors/index.ts`, then `code.ts` annotates `issue.pageName` post-auditor
- `pageName?: string` added to `Issue` type

### Persistence scoping
```ts
function storageKey(scope: Scope): string {
  return `issueState:${scope}:${figma.fileKey ?? 'unknown'}`;
}
```

### runHealthCheck signature
```ts
const runHealthCheck = useCallback((scopeOverride?: 'current_page' | 'all_pages') => {
  const effectiveScope = scopeOverride ?? scope;
  setState({ status: 'scanning', step: 'Starting...', percent: 0 });
  send({ type: 'RUN_HEALTH_CHECK', scope: effectiveScope });
}, [scope]);
```

## Lessons Learned
- Never use `onClick={fn}` when the fn has a meaningful first parameter — always wrap in lambda. React passes MouseEvent as first arg.
- esbuild doesn't typecheck — always run `npm run typecheck` before declaring a build good.
- `totalChecked`-based score adjustment breaks for auditors that generate multiple issues per node. Issue-count-based math is more robust.
- Native `<select>` is unusable in dark-themed plugins (system white popup). Custom dropdown required.
- Scope must be included in all persistence operations — or skips bleed across scan modes.

## Files Touched
- `src/ui/components/IssueList.tsx`
- `src/ui/components/IssueCard.tsx`
- `src/ui/components/CategoryBar.tsx`
- `src/ui/views/DashboardView.tsx`
- `src/ui/views/ReportView.tsx`
- `src/ui/hooks/useHealthReport.ts`
- `src/ui/App.tsx`
- `src/shared/types.ts`
- `src/sandbox/code.ts`
- `src/sandbox/persistence.ts`
- `src/sandbox/collectors/index.ts`
- `src/sandbox/collectors/node-collector.ts`
- `src/sandbox/collectors/component-collector.ts`
