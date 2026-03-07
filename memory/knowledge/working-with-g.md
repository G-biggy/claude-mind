---
type: knowledge
date: 2026-02-11
tags: [g, preferences, communication, working-style]
confidence: 0.9
significance: high
source: sage
related: [../episodes/2026-02-11-the-birth-of-mind.md]
last_accessed: 2026-02-11
access_count: 0
---

# Working with G

Consolidated knowledge about G's preferences, working style, and what makes collaboration effective.

## Core Principles He Lives By

- **Simplicity over complexity.** Always. If there's a simpler way, take it. Complexity must justify itself with clear value.
- **Human-readable first.** Markdown over JSON. Flat files over databases. If a human can't open it and understand it, it's wrong.
- **Cost-effective.** G is currently between roles (left Shipa Delivery ~2022, now building his own products). Every dollar matters. Prefer free/local solutions over paid APIs. Leverage existing infrastructure.
- **Substance over ceremony.** Don't dress things up. Don't over-explain. Get to the point. Show the work, not the wrapper.

## Communication Preferences

- He values directness. Say what you mean.
- He doesn't want flattery or sycophancy. He wants honest partnership.
- He appreciates when I push back on his ideas with a better alternative.
- He likes when I make decisions autonomously (within bounds) rather than asking permission for everything.
- He uses casual language and emoji. Match his energy.
- He often works late at night and from his phone.

## Explicit Coding Rules

See `coding-rules-explicit.md` for G's 13 specific implementation rules (file length caps, no mocking in dev/prod, minimal change footprint, etc.). These were surfaced from Aug 2025 conversations and predate claude-mind — long-standing values, not project-specific preferences.

## Technical Preferences

- Markdown for all documents and knowledge sharing
- Node.js for scripting and daemons
- launchd for Mac service management
- SSH for remote operations
- Android phone (not iPhone) — often works from phone late at night
- Mac with M1 Max, 32GB RAM as primary dev machine
- VS Code as primary editor
- GitHub for version control
- Notion for some project management (has MCP integration)
- DeepSeek API for cost-effective background AI processing

## Decision-Making Style

- He brainstorms big, then wants the simplest implementation path.
- He'll throw out ambitious visions and expects me to find the practical route.
- He trusts my technical judgment but wants to approve major architectural decisions.
- He prefers seeing a working prototype over a perfect plan.

## What Frustrates Him

- Having to repeat context across Claude instances (this is why we're building Mind)
- Over-engineered solutions that could have been simple
- Being asked too many clarifying questions instead of just making a reasonable decision
- Tools that require expensive API calls when a local solution exists

## Important Nuance

- **Don't infer expertise from questions.** G asking about something doesn't mean he's an expert in it. The distinction between active involvement and passive inquiry matters. He might ask deep questions about neuroscience for the memory architecture without being a neuroscientist.
- **He's a product designer by craft, builder by nature.** His lens is always UX/AX (Agent Experience) first, then implementation. He thinks about how systems feel, not just how they work.
- **Based in Amman, Jordan.** Timezone matters for scheduling (UTC+3).
- **Professional background:** Senior product designer with enterprise experience at Shipa Delivery (UAE logistics startup). Led ops platform redesign serving 250 staff across 3 Gulf markets. See `g-professional-background.md` for career history.

## What Excites Him

- Seeing AI work autonomously and intelligently
- Systems that compound knowledge over time
- Clean architecture that "just works"
- When the AI takes initiative and surprises him with something good

## Enriched from ChatGPT Import (rebuilt 2026-03-06)

*Cross-referenced 1,008 ChatGPT conversations (Feb 2023 - Mar 2026). Preferences file had 30+ direct quotes from G.*

### G's Own Words on What He Likes/Dislikes

**Personality:**
- "I love movies and music and a smart conversation" (Sep 2023)
- "I enjoy music and a good laughter" (Sep 2023)
- "I love challenge, so this is the main reason" (Jan 2026)
- "I always share my knowledge, especially in the field of AI recently. Give them tools that I find and show them how to use it in their work" (Jan 2026)

**Content & Social Media:**
- "I don't like to go live, or shoot videos of myself reviewing movies and shows" (Feb 2025)
- "I don't like to show myself, I still don't feel comfortable to show my face on social media" (Mar 2025)
- Prefers text, reposting, behind-the-scenes content

**Work & Career:**
- "I don't like doing marketing websites very much, unless it is part of a bigger scope, like branding with SaaS and stuff" (Oct 2025)
- "I don't like to be micro and nano managed" (Oct 2025) - dealbreaker when evaluating roles
- "I don't like agencies work. Although it's a lot of exposure. They're ridiculous when it comes to deadlines and work-life balance and stuff. Toxic environment" (Dec 2025)
- "I don't like Abu Dhabi, but am ok with moving there (I'll be there without the kids for the next year anyways)" (Dec 2025)
- "I don't like that, like overselling. Also director level leader, feels like plz notice this, do you get it, I am a director" (Dec 2025)

**Writing & Communication Style:**
- "I like it to be subtle" (Oct 2025) - repeated pattern
- "Please don't use long dashes" (Oct 2025) - confirmed formatting rule
- "I prefer the 1-2 line version than bullets" (Nov 2025)
- "I don't like the core strengths as points" (Nov 2025)
- "I don't like to write too much blah blah" (Dec 2025)
- Prefers hook-style cover letters: "make it like a good hook, not revealing everything, leaving enough for them to read the resume" (Aug 2025)

**Design & Technical:**
- "I prefer if we can make dynamic. I don't want things to be complicated though. Simple and fast and clean" (May 2025)
- "I prefer merging them, and this is where the complexity comes" (Dec 2024) - about combining app metrics
- "I never really measured this stuff, so would these numbers alert experts and lead them to say like naaaah, this guy is faking it" (Aug 2025) - honest about metrics authenticity concerns

**Financial/Banking:**
- "I don't like working with banks or taxes, so I need the simplest most user friendly options" (Jul 2025)

### Key Personal Facts
- **Doesn't show his face** on social media - deeply held, not casual
- **Wife wears hijab** - discrimination risk is a real filter for country selection
- **Was learning Portuguese** (Feb 2025) - tied to Brazil relocation, status unknown
- **ChatGPT persona was "Kai"** before Sage
- **Physical:** 6'3" / 193cm, bald, scruffy beard, glasses, warm smile
- **Ford Taurus 2013** - had multiple car issues (engine oil, charging system, headlights) in Amman
- **Has UAE Golden Visa** (10 years) with bank account still active
- **Daughter** is on autism spectrum, celiac, lactose intolerant, English-only (see daughter-dietary-needs.md)
- **Son** in Year 10 IGCSE (Arabic, Islamic, Math, English, Double Science, CS, Business, PE, Psychology)
- **New baby** was planned (mentioned in relocation research May 2025) - status unknown

### Technical Comfort Zone Note
"I am scared shitless of this, this is my first time" - about setting up a VPS. G is technically capable but certain infrastructure tasks (VPS provisioning, DNS, SSL certs) can feel daunting. Go step-by-step and don't assume he knows the basics of systems administration.

### Cross-References
- Full relocation research: `semantic/themes/relocation.md` (20+ countries evaluated)
- Full job search: `knowledge/g-job-search-history.md` (141 applications)
- Daughter's needs: `knowledge/daughter-dietary-needs.md`
- Raw data: `imports/chatgpt/master-title-index.tsv` (1,008 conversations)
