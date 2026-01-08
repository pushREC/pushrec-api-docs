---
source: 'https://developers.notion.com/reference'
scraped: '2026-01-08'
api_provider: 'Notion'
discovery_tier: 3
verified: true
---
# Notion API Documentation Coverage Report

> **Last Updated**: 2026-01-08
> **Coverage**: 70/73 pages (96%)
> **Status**: COMPLETE

---

## Coverage by Category

| Category | Total | Scraped | Coverage | Status |
|----------|-------|---------|----------|--------|
| Getting Started | 6 | 6 | 100% | Complete |
| Webhooks | 2 | 2 | 100% | Complete |
| Objects | 17 | 17 | 100% | Complete |
| Authentication | 5 | 5 | 100% | Complete |
| Blocks API | 5 | 5 | 100% | Complete |
| Pages API | 6 | 6 | 100% | Complete |
| Databases API | 8 | 8 | 100% | Complete |
| Data Sources API | 8 | 8 | 100% | Complete |
| Comments API | 3 | 3 | 100% | Complete |
| File Uploads API | 5 | 5 | 100% | Complete |
| Search API | 2 | 2 | 100% | Complete |
| Users API | 3 | 3 | 100% | Complete |
| **TOTAL** | **70** | **70** | **100%** | **Complete** |

---

## API Endpoint Coverage

### Pages API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a page | POST | `/v1/pages` | Documented |
| Retrieve a page | GET | `/v1/pages/{page_id}` | Documented |
| Retrieve page property | GET | `/v1/pages/{page_id}/properties/{property_id}` | Documented |
| Update page | PATCH | `/v1/pages/{page_id}` | Documented |
| Trash a page | PATCH | `/v1/pages/{page_id}` | Documented |
| Move page | POST | `/v1/pages/{page_id}/move` | Documented |

### Databases API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a database | POST | `/v1/databases` | Documented |
| Retrieve a database | GET | `/v1/databases/{database_id}` | Documented |
| Update a database | PATCH | `/v1/databases/{database_id}` | Documented |
| Query a database | POST | `/v1/databases/{database_id}/query` | Documented (deprecated) |
| List databases | GET | `/v1/databases` | Documented (deprecated) |

### Data Sources API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a data source | POST | `/v1/data_sources` | Documented |
| Retrieve a data source | GET | `/v1/data_sources/{data_source_id}` | Documented |
| Update a data source | PATCH | `/v1/data_sources/{data_source_id}` | Documented |
| Query a data source | POST | `/v1/data_sources/{data_source_id}/query` | Documented |
| List templates | GET | `/v1/data_sources/{data_source_id}/templates` | Documented |

### Blocks API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Retrieve a block | GET | `/v1/blocks/{block_id}` | Documented |
| Update a block | PATCH | `/v1/blocks/{block_id}` | Documented |
| Delete a block | DELETE | `/v1/blocks/{block_id}` | Documented |
| Retrieve block children | GET | `/v1/blocks/{block_id}/children` | Documented |
| Append block children | PATCH | `/v1/blocks/{block_id}/children` | Documented |

### Users API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| List all users | GET | `/v1/users` | Documented |
| Retrieve a user | GET | `/v1/users/{user_id}` | Documented |
| Retrieve bot user | GET | `/v1/users/me` | Documented |

### Comments API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a comment | POST | `/v1/comments` | Documented |
| Retrieve a comment | GET | `/v1/comments/{comment_id}` | Documented |
| List comments | GET | `/v1/comments` | Documented |

### File Uploads API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a file upload | POST | `/v1/file_uploads` | Documented |
| Send a file upload | POST | `/v1/file_uploads/{id}/send` | Documented |
| Complete a file upload | POST | `/v1/file_uploads/{id}/complete` | Documented |
| Retrieve a file upload | GET | `/v1/file_uploads/{id}` | Documented |
| List file uploads | GET | `/v1/file_uploads` | Documented |

### Search API

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Search by title | POST | `/v1/search` | Documented |

### Authentication

| Endpoint | Method | Path | Status |
|----------|--------|------|--------|
| Create a token | POST | `/v1/oauth/token` | Documented |
| Introspect token | POST | `/v1/oauth/introspect` | Documented |
| Revoke token | POST | `/v1/oauth/revoke` | Documented |
| Refresh a token | POST | `/v1/oauth/token` | Documented |

---

## Discovery Tier

**Tier 3: Official Documentation Scraped**

Source: https://developers.notion.com/reference

---

## Refresh Schedule

| Frequency | Action |
|-----------|--------|
| Monthly | Check for new endpoints |
| On API version change | Full re-scrape |

---

## Notes

- Database endpoints from version 2022-06-28 are marked as deprecated
- New Data Sources API introduced in version 2025-09-03
- Some deprecated endpoints documented for backward compatibility
- 3 pages not scraped are duplicates or redirects from sitemap

---

*Coverage validated: 2026-01-08*
*Generated by api-docs-finder HARVEST mode*
