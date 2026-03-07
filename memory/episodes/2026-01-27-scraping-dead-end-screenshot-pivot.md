# Social Scraping Dead End — Screenshot Pivot

**Date:** 2026-01-27
**Significance:** The moment Caption Cook's product strategy fundamentally shifted. Instagram and TikTok scraping failed, leading to screenshots as the primary input method.

## What Happened

G tried parsing Instagram and TikTok links — the core use case Caption Cook was built around. Both platforms actively block automated access. Instagram's oEmbed API and page scraping both fail. TikTok's URL resolution, oEmbed, and scraping all fail.

The url-fetcher.ts tried multiple approaches. All dead ends.

## The Pivot

Instead of fighting platform blocking (an arms race with no winner), we pivoted to screenshots as the primary import method. Screenshots work because:

- Always available regardless of platform blocking
- Claude's vision can read text from images directly
- Works for any platform (Instagram, TikTok, Facebook, YouTube, future platforms)
- Users can screenshot DMs, stories, comments — not just posts
- More reliable than any scraping approach

## Strategic Implications

- Screenshot parsing became the killer feature, not a workaround
- Social media URLs now show a helpful error: "Instagram, TikTok, and Facebook block apps from reading their content. Take a screenshot instead."
- Added as first FAQ question since it's the most common user confusion
- URL parsing still works for blogs and recipe sites — just not social platforms
- Made Caption Cook "platform-proof" — new social platforms need zero integration

## Cost Implication

Screenshot parsing is the most expensive per-parse (~$0.01-0.10 vs ~$0.005 for text). This influenced the free tier design — hard lifetime cap of 5 saves, not monthly resets.

## The Quote

G's early instinct was right: "action to get of this paste friction, we can detect if they copied text or image and we can show some kind of popup." The clipboard detection idea informed the UX of the add recipe page.
