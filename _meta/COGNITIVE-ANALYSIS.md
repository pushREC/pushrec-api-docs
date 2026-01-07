---
created: 2026-01-07
type: analysis
status: complete
---

# Cognitive Excellence Analysis: API-Docs System

Post-run analysis from comprehensive A-Z test with actionable improvements.

## Test Results Summary

| Phase | Status | Notes |
|-------|--------|-------|
| Pre-flight checks | PASSED | Config, structure, deps all OK |
| Scraping (3 parallel agents) | SUCCESS | 45KB total content |
| Hash detection | PASSED | ADDED files detected correctly |
| Validation | 2 issues | README.md expected failures |
| Deprecation | PASSED | Frontmatter + banner working |
| Index building | PASSED | 4 layers populated |
| Vault symlink | PASSED | Files accessible |

## Key Learnings

### 1. URL Discovery Pattern

**Finding:** Claude Code docs redirected from multiple URLs before settling on the correct pattern.

| Attempted URL | Result |
|---------------|--------|
| `docs.anthropic.com/en/docs/claude-code/*` | 301 redirect |
| `platform.claude.com/docs/en/*` | 301 redirect |
| `code.claude.com/docs/en/*` | SUCCESS |

**Recommendation:** Update `sources.yaml` with verified base URLs:

```yaml
claude-code:
  base_url: "https://code.claude.com/docs/en"  # Updated
  # NOT: "https://docs.anthropic.com/en/docs/claude-code"
```

### 2. JavaScript-Rendered Content

**Finding:** WebFetch tool failed on JS-rendered pages. Agent 3 successfully used Playwright.

**Pattern for JS Pages:**
```python
from playwright.async_api import async_playwright

async def fetch_js_page(url):
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page()
        await page.goto(url, wait_until="networkidle")
        content = await page.content()
        await browser.close()
        return content
```

**Recommendation:** Add `scrape_method` field to sources.yaml:
- `webfetch` - Static pages (fast, cheap)
- `playwright` - JS-rendered pages (slower, reliable)

### 3. Parallel Agent Efficiency

**Finding:** 3 parallel agents with `model="haiku"` completed efficiently.

| Agent | Task | Time | File Size |
|-------|------|------|-----------|
| 1 | Overview | ~60s | 4,385 bytes |
| 2 | CLI Reference | ~90s | 7,759 bytes |
| 3 | Hooks (Playwright) | ~120s | 33,522 bytes |

**Cost Estimate:** ~$0.03 for 3 pages (haiku model)

**Recommendation:** Scale to 5-10 parallel agents for full scrape (~90 pages).

### 4. Content Extraction Quality

| Metric | Agent 1 | Agent 2 | Agent 3 |
|--------|---------|---------|---------|
| Clean markdown | Yes | Yes | Yes |
| Frontmatter | Valid | Valid | Valid |
| Code blocks preserved | Yes | Yes | Yes |
| Navigation removed | Yes | Yes | Partial |

**Issue:** Agent 3 left some navigation text in output.

**Fix:** Add post-processing cleanup:
```python
NAV_PATTERNS = [
    'Skip to main content', 'On this page', 'Ask AI',
    'Copy page', 'Navigation', 'Search...'
]

def cleanup(text):
    lines = [l for l in text.split('\n')
             if not any(p in l for p in NAV_PATTERNS)]
    return '\n'.join(lines)
```

## Improvement Recommendations

### 1. Parallel Processing Enhancements

**Current:** Manual parallel agent launch.

**Proposed:** Add `scraper.py` batch mode:

```python
def scrape_batch(sources: List[str], max_concurrent: int = 5):
    """Dispatch multiple agents in parallel batches."""
    for batch in chunks(sources, max_concurrent):
        agents = [
            Task(
                description=f"Scrape {s}",
                prompt=generate_scrape_prompt(s),
                model="haiku",
                run_in_background=True
            )
            for s in batch
        ]
        # Wait for batch completion
        wait_all(agents)
```

### 2. Error Recovery Patterns

**Current:** Errors fail silently or crash.

**Add to all modules:**

```python
class ScrapeResult:
    success: bool
    content: Optional[str]
    error: Optional[str]
    retry_count: int
    method_used: str  # 'webfetch' | 'playwright'

def scrape_with_retry(url: str, max_retries: int = 3) -> ScrapeResult:
    for attempt in range(max_retries):
        try:
            # Try WebFetch first (cheaper)
            content = webfetch(url)
            if len(content) > MIN_CONTENT:
                return ScrapeResult(success=True, content=content, method_used='webfetch')

            # Fallback to Playwright
            content = playwright_fetch(url)
            return ScrapeResult(success=True, content=content, method_used='playwright')

        except Exception as e:
            if attempt == max_retries - 1:
                return ScrapeResult(success=False, error=str(e))
            time.sleep(2 ** attempt)  # Exponential backoff
```

### 3. Configuration Extensibility

**Add to `sources.yaml`:**

```yaml
sources:
  claude-code:
    scrape_method: "auto"  # auto | webfetch | playwright
    url_pattern: "code.claude.com/docs/en/{page}"
    pages:
      - overview
      - cli-reference
      - hooks
      # ... enumerate known pages
    retry_config:
      max_attempts: 3
      backoff_multiplier: 2
```

### 4. Testing Automation

**Gap:** No automated test suite for the api-docs system.

**Proposed test structure:**

```
scripts/tests/
├── test_config.py       # Config loading tests
├── test_hasher.py       # Hash detection tests
├── test_validation.py   # Validation logic tests
├── test_deprecation.py  # Deprecation workflow tests
├── test_scraper.py      # Scraper integration tests
└── fixtures/
    ├── valid_doc.md
    ├── invalid_doc.md
    └── sample_hash.json
```

**Minimum test coverage:**
- Config loading with missing/invalid YAML
- Hash detection for ADD/MODIFY/REMOVE
- Validation for all 26 checks
- Deprecation frontmatter injection
- Index layer keyword matching

### 5. URL Discovery Automation

**Proposed:** Add sitemap parser:

```python
def discover_pages(sitemap_url: str) -> List[str]:
    """Parse sitemap.xml to discover all doc pages."""
    response = fetch(sitemap_url)
    urls = extract_urls(response)
    return [u for u in urls if is_doc_page(u)]
```

**Add to sources.yaml:**
```yaml
claude-code:
  sitemap_url: "https://code.claude.com/sitemap.xml"
  discover_method: "sitemap"  # sitemap | manual | crawl
```

## Implementation Priority

| Priority | Improvement | Effort | Impact |
|----------|-------------|--------|--------|
| P1 | Update base URLs in sources.yaml | Low | High |
| P1 | Add Playwright fallback to scraper | Medium | High |
| P2 | Batch parallel scraping mode | Medium | Medium |
| P2 | Error recovery with retry | Medium | High |
| P3 | Automated test suite | High | Medium |
| P3 | Sitemap-based page discovery | Medium | Medium |

## Metrics to Track

| Metric | Current | Target |
|--------|---------|--------|
| Scrape success rate | 100% | >95% |
| Average page size | 15KB | N/A |
| Cost per full update | ~$0.09 | <$0.10 |
| Time for full scrape | N/A | <5 min |
| Validation pass rate | 60% | 100% |

## Next Steps

1. **Immediate:** Update `sources.yaml` with correct URLs
2. **This week:** Add Playwright fallback to scraper
3. **This month:** Implement batch parallel mode
4. **Future:** Automated test suite

---

*Analysis generated: 2026-01-07*
*Based on: Complete A-Z test run with 3 parallel agents*
*Model: Opus 4.5 with cognitive-excellence skill*
