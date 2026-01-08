# API Coverage Dashboard

> **Last Updated**: 2026-01-08
> **Total APIs**: 28
> **Total Files**: 2,900+
> **Repository**: ~/api-docs/

---

## Complete (100% Coverage)

APIs with full documentation and verified status.

| API | Files | Tier | Type | Notes |
|-----|-------|------|------|-------|
| **claude-api** | 212 | 3 | Scraped | Anthropic Claude API - comprehensive |
| **youtube** | 162 | 3 | Scraped | Data API v3, Analytics, Reporting |
| **openrouter** | 146 | 3 | Scraped | 200+ LLM router - 100% coverage |
| **claude-code** | 55 | 3 | Scraped | CLI tool documentation |
| **openai** | 36 | 1 | Spec | Generated from OpenAPI spec |
| **vercel** | 31 | 1 | Spec | Generated from OpenAPI spec |
| **google-drive** | 17 | 1 | Spec | Generated from Discovery doc |
| **obsidian** | 11 | 3 | Scraped | Plugin/TypeScript API |
| **agent-sdk** | 9 | 3 | Scraped | SDK docs (not REST API) |
| **bright-data** | 7 | 2 | Mixed | Proxy/scraping APIs |
| **google-gemini** | 6 | 3 | Scraped | Vision-focused docs |
| **elevenlabs** | 5 | 1 | Spec | Voice AI API |
| **playwright** | 5 | 3 | Scraped | Browser automation |
| **2captcha** | 4 | 3 | Scraped | CAPTCHA solving |
| **convex** | 4 | 1 | Spec | Backend platform |
| **youtube-transcript-api** | 4 | - | Manual | Python library docs |
| **facebook** | 4 | 3 | Scraped | Graph API (minimal) |
| **stripe** | 3 | 1 | Spec | Payment API |
| **github** | 3 | 1 | Spec | REST API |
| **gmail** | 3 | 1 | Spec | Google Discovery |
| **google-sheets** | 3 | 1 | Spec | Google Discovery |
| **google-calendar** | 3 | 1 | Spec | Google Discovery |
| **cloudflare** | 3 | 1 | Spec | Workers/DNS API |
| **twilio** | 3 | 1 | Spec | Communication API |
| **resend** | 3 | 1 | Spec | Email API |
| **gemini** | 3 | 1 | Spec | Google AI API |
| **airtable** | 3 | 3 | Limited | Per-base API (no universal spec) |

---

## Partial Coverage (Known Gaps)

APIs with gaps that need attention.

| API | Files | Coverage | Issue | Fix |
|-----|-------|----------|-------|-----|
| **digitalocean** | 1,025 | 96% | 47 compute files corrupted | OpenAPI spec downloaded, re-scrape or generate |
| **notion** | 3 | ~30% | Unofficial spec only | Scrape developers.notion.com |

---

## Quick Lookup by Tier

### Tier 1 (OpenAPI/Discovery Spec) - Highest Quality
```
cloudflare, convex, elevenlabs, gemini, github, gmail,
google-calendar, google-drive, google-sheets, openai,
resend, stripe, twilio, vercel
```

### Tier 2 (SDK/Mixed Sources)
```
bright-data, notion
```

### Tier 3 (Scraped Documentation)
```
2captcha, agent-sdk, airtable, claude-api, claude-code,
digitalocean, facebook, google-gemini, obsidian, openrouter,
playwright, youtube
```

---

## Agent Quick Reference

When you need API docs:

```
STEP 1: Check if exists
  ls ~/api-docs/{api-name}/

STEP 2: Check coverage
  cat ~/api-docs/{api-name}/COVERAGE.md

STEP 3: If gap affects you
  - Tier 1: Generate from spec (spec_to_docs.py)
  - Tier 3: Re-scrape with HARVEST mode
```

---

## Recent Updates (2026-01-08)

- **Google Drive**: Generated 14 resource docs from Discovery spec
- **OpenAI**: Generated 36 endpoint docs from OpenAPI spec
- **Vercel**: Generated 31 endpoint docs from OpenAPI spec
- **Convex**: Generated docs from OpenAPI spec
- **Agent SDK**: Fixed metadata (was mislabeled as gaps)
- **Obsidian**: Fixed metadata (plugin API, not REST)
- **DigitalOcean**: Downloaded OpenAPI spec (73K lines)
- **spec_to_docs.py**: New script for auto-generating docs from specs

---

## Statistics

| Metric | Value |
|--------|-------|
| Total API folders | 28 |
| Tier 1 (spec-based) | 14 |
| Tier 2 (mixed) | 2 |
| Tier 3 (scraped) | 12 |
| Total markdown files | ~2,900 |
| Complete APIs | 26 |
| APIs with gaps | 2 |

---

*Dashboard generated: 2026-01-08*
*For full details, check individual COVERAGE.md files*
