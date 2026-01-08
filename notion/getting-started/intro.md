---
source: https://developers.notion.com/reference/intro
scraped: 2026-01-08
---

# Notion API Introduction

## Overview

The Notion API enables integrations to access pages, databases, and users within Notion workspaces. The base URL for all requests is `https://api.notion.com`, and HTTPS is required.

## Key Conventions

### JSON Structure

- Resources include an `"object"` property identifying the type
- Resources are addressable via UUIDv4 `"id"` (dashes optional in requests)
- Property names use `snake_case`
- Temporal values follow ISO 8601 format
- Empty strings are unsupported; use `null` instead

## Authentication

Integrations require a token from the integration settings page. You must be a workspace admin to access integration tokens.

## Core Endpoints

| Category | Operations |
|----------|------------|
| **Blocks** | Append, retrieve, update, and delete block children |
| **Pages** | Create, retrieve, update, and manage page properties |
| **Databases** | Create, query, retrieve, and update databases |
| **Data Sources** | Create, update, query, and retrieve data sources with filtering and sorting |
| **Comments** | Create, retrieve, and list comments |
| **File Uploads** | Manage file uploads with creation, completion, and retrieval |
| **Users** | List all users and retrieve individual user information |
| **Search** | Query by title with optimization options |

## Pagination

Supported endpoints return paginated results with fields:

- `has_more` - Boolean indicating more results exist
- `next_cursor` - Cursor for next page
- `results` - Array of results

The default page size is 100 items maximum. Requests use `start_cursor` to navigate through results.

## SDKs

Official open-source SDKs exist for JavaScript. Code samples show both SDK and cURL implementations.
