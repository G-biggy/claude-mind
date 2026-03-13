---
date: 2026-03-12
title: CV Builder Pipeline Shipped
updated_by: sage
tags: [cv, job-hunt, weasyprint, skills, pdf]
---

# CV Builder Pipeline Shipped

Full end-to-end CV tailoring pipeline is live:

- Figma design specs extracted and pixel-matched into weasyprint PDF generator
- Three CV versions (Director, Principal, Resume) templated
- Two skills created: job-fit-assessment + cv-builder
- Workflow: paste JD → assess → go/no-go → tailor → PDF → send
- Works from phone via Claude mobile
- No extra API cost (runs in conversation, not artifact)
- PDFs are ATS-readable, properly paginated, send-ready
