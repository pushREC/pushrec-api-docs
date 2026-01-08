---
source: https://openrouter.ai/docs/guides/guides/activity-export
scraped: 2026-01-08
---

# Activity Export

## Summary

OpenRouter enables users to export usage analytics through their Activity page in CSV or PDF formats. The export functionality allows filtering by time period and grouping by model, API key, or organization member.

## Key Metrics Available

The Activity page tracks three primary measurements:

- **Spend**: Total credit expenditure including BYOK estimates
- **Tokens**: Combined prompt and completion token usage
- **Requests**: Count of API calls made

## Export Process

Users can access exports by navigating to the Activity section, selecting desired time parameters and grouping preferences, then choosing the export format from the options menu.

## Export Types

**Summary exports** provide high-level overviews of all three metrics in a single file.

**Detailed exports** require clicking into specific metric cards first, which then present granular breakdowns matching the selected grouping criteria. These detailed reports can be quite comprehensive—for instance, PDF exports spanning a year with API key grouping include summary pages plus individual key breakdowns.

## Important Notes

- BYOK spend figures reflect estimated market rates rather than negotiated pricing
- Reasoning tokens are factored into completion token calculations for billing purposes, though the breakdown shows how many tokens were allocated to the reasoning process
