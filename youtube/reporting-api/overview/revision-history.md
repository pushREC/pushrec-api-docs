---
source: https://developers.google.com/youtube/reporting/revision_history
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
---
 YouTube Analytics and Reporting APIs - Revision History

## Recent Major Updates

### September 22, 2025
The deprecation of outdated reports has been postponed from September 30 to October 31, 2025, with exceptions for specific Claims reports.

### June 24, 2025
New report versions introduced to reflect changed Shorts view counting methodology. "For Shorts, views will now count the number of times a Short starts to play or replay." Updated reports include a new `engaged_views` column reflecting previous methodology. Previous versions remain available until September 30, 2025.

### April 24, 2025
Targeted Queries API updated with Shorts viewcount changes effective April 30, 2025. New `engagedViews` metric reflects previous counting methodology.

### April 22, 2025
The `isCurated` dimension deprecated for channel and content owner playlist reports as of December 31, 2024.

### March 26, 2025
YouTube changed Shorts view counting. "views will count the number of times your Short starts to play or replay, with no minimum watch time requirement." API updates rolled out through June 2025.

### March 3, 2025
Daily Claims report version 1.0 deprecated for partners, unsupported after April 30, 2025.

### November 15, 2024
Traffic Source reports now return errors if product of queried videos x days exceeds 50,000.

### May 6, 2024
Three new channel reports introduced:
- User Activity by DMA
- Concurrent Viewers
- Member Cancellations

Audience Retention reports enhanced.

### April 7, 2024
`isCurated` dimension deprecated for content owner playlist reports by December 31, 2024.

## Historical Context

The documentation traces changes from October 2012 when the YouTube Analytics API became publicly available through numerous metric additions, deprecations, and structural reorganizations spanning over a decade.

## Key Deprecation Notices

- **Shorts view counting change**: March 2025 - Views now count starts/replays without minimum watch time
- **`isCurated` dimension**: Deprecated December 31, 2024
- **Claims report v1.0**: Deprecated April 30, 2025
- **Traffic Source limits**: 50,000 video-day product maximum (November 2024)

## Migration Notes

When reports are deprecated:
- YouTube continues generating reports for existing jobs for 3 months after deprecation
- New jobs cannot be created for deprecated report types
- Applications should migrate to newer report versions before deprecation dates
