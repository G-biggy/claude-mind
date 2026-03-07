# Figma Plugin Development — Patterns & Gotchas

## documentAccess: dynamic-page
When manifest has `"documentAccess": "dynamic-page"`, ALL document APIs must be async:
- `figma.variables.getLocalVariables()` → `getLocalVariablesAsync()`
- `figma.getLocalPaintStyles()` → `getLocalPaintStylesAsync()`
- `figma.getLocalTextStyles()` → `getLocalTextStylesAsync()`
- `figma.getNodeById()` → `getNodeByIdAsync()`
- `instance.mainComponent` → `await instance.getMainComponentAsync()`
- `page.findAllWithCriteria()` requires `await page.loadAsync()` first

## Multi-page node selection
```typescript
// Always find the node's page and switch to it before selecting
function findPage(n: BaseNode): PageNode | null {
  if (n.type === 'PAGE') return n as PageNode;
  return n.parent ? findPage(n.parent) : null;
}
const page = findPage(sceneNode);
if (page && page !== figma.currentPage) figma.currentPage = page;
figma.currentPage.selection = [sceneNode];
```

## fills/strokes TypeScript typing
`GeometryMixin.fills` is typed as `readonly Paint[] | unique symbol`. Always guard:
```typescript
if (!Array.isArray(fills)) throw new Error('Mixed fills not supported');
```
Never use `fills === figma.mixed` — TypeScript will flag it as always-false.

## clientStorage persistence pattern
- Key: `issueState:{figma.fileKey}` (scoped per file)
- Prune stale entries after every scan (compare against fresh issue keys)
- Send persisted states alongside HEALTH_REPORT so UI can initialize without a separate round-trip

## Variable binding
```typescript
figma.variables.setBoundVariableForPaint(fill, 'color', variable)
```
To unbind: spread the paint object omitting `boundVariables`:
```typescript
const { boundVariables, ...rest } = paint as SolidPaint & { boundVariables?: unknown };
return rest as SolidPaint;
```

## Score adjustment (skip/fix pattern)
Never reconstruct passing count from a rounded percentage — use the raw counts:
```typescript
const passing = totalChecked - issueCount;  // use this, not Math.round(score/100 * total)
const adjustedTotal = Math.max(1, totalChecked - skippedCount);
const adjustedPassing = Math.min(adjustedTotal, passing + fixedCount);
const adjustedScore = Math.round((adjustedPassing / adjustedTotal) * 100);
```

## colorTheme not in plugin typings
`figma.currentUser.colorTheme` is not exposed in `@figma/plugin-typings` v1.90. Use `themeColors: true` in `showUI` + `prefers-color-scheme` media query in CSS instead.
