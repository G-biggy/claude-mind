---
date: 2026-03-04
title: monitor_url missing from dashboard API response
updated_by: sage
---

# monitor_url missing from dashboard API response

## What Failed
Forge added monitor links to dashboard.html but they didn't appear.
Root cause: server.js /api/dashboard handler explicitly whitelists fields
returned to client — monitor_url wasn't in the list.
enrichTasks() had it, but the final .map() stripped it.

## Fix
Added monitor_url to the field whitelist in /api/dashboard handler.
Also added to enrichTasks() return object for consistency.

## Lesson
When dashboard shows plain text instead of links, check the API response
first (curl /api/dashboard) before assuming the HTML template is wrong.
The field whitelist in server.js is the likely culprit.
