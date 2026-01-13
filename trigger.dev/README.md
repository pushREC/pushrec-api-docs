# Trigger.dev API Documentation

Documentation scraped from https://trigger.dev/docs on 2026-01-13.

## Scraping Status

**Agent 1 - Getting Started & CLI (22 pages total)**

### Successfully Scraped (19/22 pages)

**Getting Started:**
- ✅ introduction.md
- ✅ quick-start.md
- ⚠️ manual-setup.md (INCOMPLETE - content too large)
- ✅ video-walkthrough.md
- ⚠️ how-it-works.md (INCOMPLETE - content too large)
- ✅ limits.md
- ⚠️ migrating-from-v3.md (INCOMPLETE - content too large)
- ✅ migration-mergent.md

**CLI:**
- ✅ introduction.md
- ✅ dev.md
- ✅ dev-commands.md
- ✅ deploy-commands.md
- ✅ init-commands.md
- ✅ list-profiles-commands.md
- ✅ login-commands.md
- ✅ logout-commands.md
- ✅ preview-archive.md
- ✅ promote-commands.md
- ✅ switch.md
- ✅ update-commands.md
- ✅ whoami-commands.md
- ✅ guides-introduction.md

### Incomplete Pages (3/22 pages)

The following pages exceeded the WebFetch tool's size limit and contain placeholder content only. To complete the documentation:

1. **manual-setup.md** - https://trigger.dev/docs/manual-setup
2. **how-it-works.md** - https://trigger.dev/docs/how-it-works
3. **migrating-from-v3.md** - https://trigger.dev/docs/migrating-from-v3

These can be scraped using alternative methods:
- Browser automation (Playwright/Puppeteer)
- Direct HTTP request with HTML parsing
- Manual copying from the browser

## Directory Structure

```
~/api-docs/trigger.dev/
├── README.md (this file)
├── getting-started/
│   ├── introduction.md
│   ├── quick-start.md
│   ├── manual-setup.md (INCOMPLETE)
│   ├── video-walkthrough.md
│   ├── how-it-works.md (INCOMPLETE)
│   ├── limits.md
│   ├── migrating-from-v3.md (INCOMPLETE)
│   └── migration-mergent.md
└── cli/
    ├── introduction.md
    ├── dev.md
    ├── dev-commands.md
    ├── deploy-commands.md
    ├── init-commands.md
    ├── list-profiles-commands.md
    ├── login-commands.md
    ├── logout-commands.md
    ├── preview-archive.md
    ├── promote-commands.md
    ├── switch.md
    ├── update-commands.md
    ├── whoami-commands.md
    └── guides-introduction.md
```

## Content Details

All successfully scraped pages include:
- Frontmatter with source URL and scrape date
- Complete markdown content with preserved formatting
- Code blocks with language tags
- Tables with proper formatting
- All headings and hierarchy
- Lists and bullet points
- Links (converted to relative where applicable)

## Notes

- This is Agent 1's assigned portion (Getting Started + CLI sections)
- Total coverage: 19/22 pages complete (86% complete)
- All files include YAML frontmatter for traceability
- Navigation and footer content removed
- Documentation content preserved exactly as published
