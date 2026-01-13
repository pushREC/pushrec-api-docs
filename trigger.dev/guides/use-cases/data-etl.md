# Data Processing & ETL Workflows - Trigger.dev

## Overview
Build complex data pipelines that process large datasets without timeouts. Handle streaming analytics, batch enrichment, web scraping, database sync, and file processing with automatic retries and progress tracking.

## Featured Examples

### Realtime CSV Importer
Import CSV files with progress streamed live to frontend.
[Link](/guides/example-projects/realtime-csv-importer)

### Web Scraper with BrowserBase
Scrape websites using BrowserBase and Puppeteer.
[Link](/guides/examples/scrape-hacker-news)

### Supabase Database Webhooks
Trigger tasks from Supabase database webhooks.
[Link](/guides/frameworks/supabase-edge-functions-database-webhooks)

## Key Benefits

**Process datasets for hours without timeouts:** Handle multi-hour transformations, large file processing, or complete database exports. No execution time limits.

**Parallel processing with built-in rate limiting:** Process thousands of records simultaneously while respecting API rate limits. Scale efficiently without overwhelming downstream services.

**Stream progress to your users in real-time:** Show row-by-row processing status updating live in your dashboard. Users see exactly where processing is and how long remains.

## Production Use Cases

- **MagicSchool AI:** Uses Trigger.dev to generate insights from millions of student interactions
- **Comp AI:** Automates evidence collection at scale for their AI-driven compliance platform
- **Midday:** Syncs large volumes of bank transactions in their financial management platform

## Example Workflow Patterns

### CSV File Import
Simple pipeline: file upload → parse CSV → validate → database import → completion notification

### Multi-source ETL Pipeline
Coordinator pattern: parallel extraction from APIs, databases, and S3 → transform → validate → load to warehouse

### Parallel Web Scraping
Coordinator pattern: parallel browser automation → scrape multiple pages → clean/normalize → store in database

### Batch Data Enrichment
Coordinator pattern: fetch records → parallel API calls with rate limiting → validate → database update

## Related Use Cases
- [Data processing & ETL workflows](/guides/use-cases/data-processing-etl)
- [Media processing workflows](/guides/use-cases/media-processing)
- [AI media generation workflows](/guides/use-cases/media-generation)
- [Marketing workflows](/guides/use-cases/marketing)
