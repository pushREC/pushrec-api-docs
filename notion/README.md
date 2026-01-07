# Notion API Documentation

> **Status:** Partial (Unofficial Spec)
> **Last Updated:** 2026-01-08
> **Source:** api.notion.com

## Contents

| Type | Description |
|------|-------------|
| `openapi-unofficial.yaml` | Community OpenAPI spec |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set API key
export NOTION_API_KEY="secret_xxxxxxxxxx"

# Search pages
curl -X POST "https://api.notion.com/v1/search" \
  -H "Authorization: Bearer $NOTION_API_KEY" \
  -H "Notion-Version: 2022-06-28" \
  -H "Content-Type: application/json" \
  -d '{"query": "Meeting Notes"}'
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Search** | `POST /v1/search` | Search pages and databases |
| **Pages** | `GET /v1/pages/{id}` | Get page |
| **Pages** | `POST /v1/pages` | Create page |
| **Databases** | `POST /v1/databases/{id}/query` | Query database |
| **Blocks** | `GET /v1/blocks/{id}/children` | Get block children |

## Authentication

- **Type:** Bearer Token (Integration Token)
- **Header:** `Authorization: Bearer {secret_token}`
- **Version Header:** `Notion-Version: 2022-06-28`
- **Get Token:** https://www.notion.so/my-integrations

## Resources

- [API Docs](https://developers.notion.com)
- [API Reference](https://developers.notion.com/reference)
- [JavaScript SDK](https://github.com/makenotion/notion-sdk-js)

## Note

Notion does not provide an official OpenAPI spec. The included spec is community-maintained and covers core endpoints (search, pages, databases).
