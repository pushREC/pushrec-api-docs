---
updated: 2025-01-07
---

# Quality Metrics

Documentation quality tracking and validation results.

## Current Status

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Coverage | 100% | 0% | PENDING |
| Freshness | <30 days | N/A | PENDING |
| Frontmatter | Required | N/A | PENDING |
| Index | Current | N/A | PENDING |

## Source Coverage

| Source | Expected | Actual | Coverage |
|--------|----------|--------|----------|
| claude-code | ~43 | 0 | 0% |
| claude-api | ~35 | 0 | 0% |
| agent-sdk | ~12 | 0 | 0% |
| **Total** | ~90 | 0 | 0% |

## Validation Checks

All files must pass:

1. **Frontmatter** - YAML block with source URL and scraped date
2. **Content Length** - Minimum 500 characters
3. **Main Heading** - `# Title` present
4. **Valid Links** - All wikilinks resolve

## Staleness Thresholds

| Age | Status |
|-----|--------|
| <7 days | Fresh |
| 7-30 days | Current |
| >30 days | Stale |

---

*Run `api-docs validate` for full validation*
*Run `api-docs status` for quick overview*
