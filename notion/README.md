# Notion API Documentation

> **Source**: https://developers.notion.com/reference
> **Scraped**: 2026-01-08
> **Version**: API version 2025-09-03 (latest)
> **Coverage**: 100% (70 pages)

## Overview

This documentation covers the complete Notion API reference, including endpoints for pages, databases, data sources, blocks, users, comments, search, and file uploads.

## Quick Reference

| Category | Endpoints | Documentation |
|----------|-----------|---------------|
| Authentication | 5 | `authentication/` |
| Blocks | 5 | `blocks/` |
| Pages | 6 | `pages/` |
| Databases | 8 | `databases/` |
| Data Sources | 8 | `data-sources/` |
| Comments | 3 | `comments/` |
| File Uploads | 5 | `file-uploads/` |
| Search | 2 | `search/` |
| Users | 3 | `users/` |
| Objects | 17 | `objects/` |
| Webhooks | 2 | `webhooks/` |
| Getting Started | 6 | `getting-started/` |

## Base URL

```
https://api.notion.com/v1/
```

## Authentication

All requests require:
- `Authorization: Bearer {token}` header
- `Notion-Version: 2022-06-28` header (or later)

## Key Concepts

### Data Model (2025-09-03+)

```
Workspace
  └── Database
       └── Data Source(s)
            └── Page(s)
                 └── Block(s)
```

### Object Types

| Object | Description |
|--------|-------------|
| Page | Container for content with properties |
| Database | Container for data sources |
| Data Source | Table with schema and pages |
| Block | Content unit (paragraph, heading, list, etc.) |
| User | Person or bot in workspace |
| Comment | Remark on page or block |

## Usage

### JavaScript SDK

```javascript
const { Client } = require('@notionhq/client');

const notion = new Client({
  auth: process.env.NOTION_API_KEY
});

// Query a data source
const response = await notion.dataSources.query({
  data_source_id: 'your-data-source-id'
});
```

### cURL

```bash
curl 'https://api.notion.com/v1/pages/{page_id}' \
  -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
  -H 'Notion-Version: 2022-06-28'
```

## Rate Limits

- Average of 3 requests per second per integration
- Burst requests permitted above average
- HTTP 429 returned when rate limited (check `Retry-After` header)

## Directory Structure

```
notion/
├── README.md
├── SOURCES.md
├── COVERAGE.md
├── getting-started/
├── objects/
├── authentication/
├── blocks/
├── pages/
├── databases/
├── data-sources/
├── comments/
├── file-uploads/
├── search/
├── users/
└── webhooks/
```

## Resources

- [API Docs](https://developers.notion.com)
- [API Reference](https://developers.notion.com/reference)
- [JavaScript SDK](https://github.com/makenotion/notion-sdk-js)
