---
date: 2026-03-12
title: CV Builder System — Template + Two-Skill Workflow
updated_by: sage
tags: [cv, job-hunt, skills, weasyprint, pdf, workflow]
---

# CV Builder System — Template + Two-Skill Workflow

## What Happened

Built a complete CV-to-PDF pipeline for G's job hunting workflow. Started from a design/UX conversation about MCP accessibility, evolved into a full system for generating tailored, send-ready CVs from phone.

G uploaded 3 CV versions (Director, Principal, Resume) and shared a Figma file (Master-CV). Used Figma forge plugin to extract exact design specs, then cross-validated against the original PDFs using pdfplumber to get precise measurements.

Built and iterated a weasyprint-based PDF generator that exactly matches the Figma design. Key iterations:
- Fixed font size (was using px, should be pt — weasyprint shrinks px)
- Matched page dimensions (original was Letter 612×792pt, switched to A4 842pt)
- Added italic contact row (matched original exactly)
- Applied bold to pink section labels, weight 500 to blue titles
- Added live hyperlinks to all 4 contact items
- Extracted exact line heights from PDF (18pt for 12pt body text)

## Decisions Made

- **No Claude API in artifacts** — G is on Max5, no extra cost wanted. Everything runs here in conversation.
- **PDF generation via weasyprint** — not print-to-PDF from browser. Generates proper multi-page, ATS-readable PDFs directly.
- **Two-skill architecture** for job applications:
  - `job-fit-assessment` — scores fit, recommends version, produces tailoring brief, ends with go/no-go
  - `cv-builder` — activates only after G confirms go, takes brief, rewrites content slots, generates PDF
- **Template is locked** — CSS never changes, only content slots get rewritten per application
- **File naming**: `G-CV-[Version]-[Company].pdf` so G can identify each application

## System Changes

- Both skills created and live in /mnt/skills/user/
- `job-fit-assessment` — G created independently
- `cv-builder` — spec written by Sage this session, G created the file
- Python generator script lives in conversation context (not yet saved to disk as a standalone file)

## CV Template Specs (locked)

```
Page:         612pt × 842pt (A4)
Margins:      top 36pt, sides 48pt, bottom 48pt
Font:         Helvetica Neue (fallback: Helvetica, Arial)
Name:         24pt, normal, #000000
Subtitle:     12pt, weight 500, #00A2FF
Links:        12pt, normal, #000000
Contact:      10pt, italic, #929292
Section label: 10pt, bold, #FF42A1, uppercase
Body:         12pt, normal, #000000, line-height 18pt
Job title:    12pt, weight 500, #00A2FF
Company:      12pt, normal, #000000
Meta/dates:   10pt, italic, #929292
Section gap:  margin-top 22pt
```

## Fixed Personal Details

```
Name:     Ghayyath "G" Huzayen
Email:    gheyath@gmail.com
Website:  https://ghayyath.com/
LinkedIn: https://www.linkedin.com/in/gheyath-huzayen/
Medium:   https://medium.com/@ghayyath
Phone:    UAE: +971 58 554 3395 / +971 55 114 6306 · JO: +962 79 757 6169
```

## Open Questions for G

- Save the Python generator as a standalone script to disk (so Forge can also run it autonomously via bridge)?
- Apply same changes (A4, pt units, bold labels, links) to Director and Resume versions?
- Consider Forge autonomy: paste JD → Sage plans → Forge generates PDF → drops to a folder?
