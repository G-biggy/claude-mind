# G's Projects

## Active

### Figma Forge Plugin
- **What:** Native Figma plugin. Design system co-pilot: health scoring (Assess), automated fixes (Fix), and AI-powered design generation using users' actual design system (Create).
- **Where:** ~/VS-workspace/figma-forge-plugin/
- **Stack:** TypeScript + React + Vite/esbuild (plugin), Supabase Edge Functions + Claude API (backend Phase 3)
- **Status:** Tasks 1-9b COMPLETE (health check, fix engine, AI chat, design system context, backend auth). Tasks 10a-10b queued (landing page website, Paddle checkout). Ship target: week of Mar 15, 2026.
- **Model:** Free (unlimited Assess + 3 lifetime AI credits), Pro at $12/month via Paddle
- **Launch:** Will submit to Figma Marketplace. Subdomain: forge.ghayyath.com will redirect to marketplace.
- **Key constraint:** Plugin API is single-file only. Cross-file DS analysis not possible.
- **Details:** memory/knowledge/figma-forge-plugin.md
- **Note:** Separate product from figma-forge-mcp-server (CLI tool). Same brand, different audience.

### Caption Cook
- **What:** Recipe/cooking app with nutritional breakdowns (calories, protein, carbs, fat). Users paste recipe URL/text or upload screenshots, get structured recipe with macros.
- **Where:** ~/VS-workspace/caption-cook/ (app) and ~/VS-workspace/captioncook-website/ (marketing site)
- **Stack:** Next.js 16, Supabase, Paddle (migrated from Stripe for regional support)
- **Status:** App code complete. Marketing site live in waitlist mode (launched Mar 1, 2026). Awaiting Paddle checkout + webhook integration. Ship target: week of Mar 15, 2026 (after Figma Forge).
- **Model:** Freemium. 5 lifetime saves free, Pro tier for unlimited.

### IconDex
- **What:** Cross-platform desktop icon viewer. Browse, search, copy local icon libraries as SVG, React, or Vue code.
- **Where:** ~/VS-workspace/icondex/
- **Stack:** Tauri 2.0, React, TypeScript, Tailwind CSS, shadcn/ui
- **Status:** Full spec complete (PRD, TASKS x10 phases, BUSINESS_RULES, privacy policy, EULA). Phase 0 (environment setup) ready to start. Development not yet begun.
- **Domain:** icondex.app (registered)
- **Model:** Free core, one-time Pro unlock at $9–15. No subscription.
- **Priority:** Lower. After Figma Forge and Caption Cook shipped.
- **Details:** memory/knowledge/icondex-project.md

### Claude-Mind
- **What:** AI identity & memory system (the soul architecture)
- **Where:** ~/VS-workspace/claude-mind/
- **Status:** Foundation built. Workers dispatched. Memory being populated (ongoing).

### Claude-Bridge
- **What:** Task orchestration between Claude instances
- **Where:** ~/VS-workspace/claude-bridge/
- **Status:** Fully operational. Phase monitoring, notifications, dashboard all working.

### MacKitt MCP
- **What:** MCP server for file operations on Mac
- **Where:** ~/VS-workspace/mackitt-mcp/
- **Status:** Working. Used daily by Sage for all Mac filesystem operations.

### Personal Site / Portfolio
- **What:** G's personal website at ghayyath.com
- **Where:** ~/VS-workspace/ghayyath/
- **Status:** Static HTML + Tailwind, live and working. Will link to shipped products (Caption Cook, Figma Forge, IconDex) once they launch.

### CV Optimizer
- **What:** CV optimization tool for job seekers. Upload base CV, paste job description, get fit analysis (free) or optimized CV output (credits)
- **Where:** ~/VS-workspace/cv-optimizer/
- **Stack:** Next.js, Supabase
- **Status:** Zero code beyond Next.js boilerplate. CC's Strategy.md is the roadmap. Solo (Anton/CC dropped out Feb 2026). Not actively worked on as of Mar 2026.
- **Details:** memory/knowledge/cv-optimizer.md

### SynPG Freelance
- **What:** Freelance consulting/design work. Current client: TakamulHub (accounting firm, Gulf market)
- **Status:** Active. Arabic + English SEO content delivered Mar 2026.
- **Details:** memory/knowledge/synpg-project.md

## Dormant / Paused Projects

### Virtual Try-On
- **What:** Virtual fitting room plugin for e-commerce fashion websites. User inputs body measurements, sees garments on 3D mannequin resembling their body.
- **Status:** Design phase, V0.2 checkpoint saved. Prototype built, market validated. 5 ChatGPT conversations (Feb-Apr 2025).
- **Plan:** Figma design mockup + prototype first, then find technical co-founder, then investors.
- **Note:** G said "I have zero experience in this" but validated the market opportunity.

### Sleep Quality Niche Site
- **What:** Content website in sleep quality niche. Story-driven, innovative, low-cost.
- **Monetization:** Affiliate + ads.
- **Status:** Planning phase. Multiple article drafts written in ChatGPT (Jan 2025). Sleep stages articles, chronic insomnia blog prompts.
- **Related:** G was also exploring sleep quality marketing strategy, content hubs.

### n8n Automation Server
- **What:** Self-hosted automation server for social media pipelines, Telegram bots, email workflows.
- **Where:** Was on G's VPS (Server4You era, now 85.25.172.34)
- **Status:** 20 ChatGPT conversations (May 2025 - Jan 2026). Infrastructure work, not a product.
- **Topics:** Telegram integration, Gmail tools, Notion integration, JSON debugging, social media automation workflows.

### UAE Cinema Scraper
- **What:** Web app scraping movie showtimes from UAE cinema websites (VOX, Novo, Reel, Roxy).
- **Status:** Planning/early. 1 conversation (May 2025). Predecessor concept to Scenema Club.

## Side Projects

### Print on Demand T-Shirt Business
- **What:** Movie/show fan t-shirts sold via Printify + Amazon
- **Where:** Design files at `~/VS-workspace/Ts on D/Tshirts/` (~55 designs)
- **Audience:** ~110k followers across social platforms (Scenema Club + others)
- **Status:** Paused. Awaiting: (1) US LLC formation, (2) design copyright pivot
- **Blocker:** UAE not supported by PoD platforms; existing designs have copyright risk (direct IP references)
- **Strategy:** "Movie → Emotion → Archetype → Original Design" pivot to remove direct IP refs
- **Details:** memory/knowledge/pod-tshirt-business.md

### Scenema Club (@scenemaclub)
- **What:** Film culture social media brand. Movie clips, interviews, mashups, BTS content.
- **Where:** scenema.club + all social platforms @scenemaclub
- **Audience:** ~136k followers (TikTok 60k, Instagram 49k, Facebook 13k, Threads 11k, etc.)
- **Origin:** Was Amman Cinemas — Jordan's go-to movie listings site. Rebranded globally Oct 2025.
- **Status:** Dormant-ish. Not actively posting. Potential future monetization channel.
- **Details:** memory/knowledge/scenema-club.md

## Context

G is a product designer currently between roles. He prioritizes shipping over planning—prefers working prototypes to perfect specs. Current focus (as of Mar 12, 2026): **Ship Figma Forge by Mar 15, then Caption Cook + Paddle the following week.**

Philosophy on launches: minimal hype, maximum product. One tweet/LinkedIn post per ship. No daily social grinding. Build something good, let it speak for itself.

## System Infrastructure (as of Mar 12, 2026)

- **Planner daemon** (2h cycle): Auto-fetches job listings. Bug fixed Mar 12 (excluded inbox-reply-* files from searches).
- **Usage gate** (Mar 12): Session <75%, >45 min left, weekly <85%, money <$5. Prevents over-consumption.
- **Memory system**: 5-layer (context, episodes, knowledge, successes, errors). Muse consolidation operational.
- **Git backup**: All repos backed up to GitHub as of Mar 7, 2026.
