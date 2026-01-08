---
source: https://developers.notion.com/reference/database-create
scraped: 2026-01-08
---

# Create a Database

## Endpoint

**POST** `https://api.notion.com/v1/databases`

## Description

Creates a database and its initial data source as a subpage within a specified parent page, or as a workspace-level private page. The parent must be either a Notion page or a wiki database.

This endpoint simultaneously creates:
- A new database
- Its first data source
- Its first table view

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `parent` | object | Yes | Parent page or wiki database |
| `title` | array | No | Rich text array for database title |
| `description` | array | No | Rich text array for description |
| `icon` | object | No | Emoji or file object |
| `cover` | object | No | File object for cover image |
| `properties` | object | Yes | Property schema for the data source |
| `is_inline` | boolean | No | Whether to display inline (default: false) |

## Response

Returns the newly created Database object.

## Current Limitations

- Creating new `status` database properties is not currently supported
- The parent parameter must reference a page ID or wiki database

## Required Capabilities

Integration must have **insert content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing insert content capabilities |
| 404 | Parent page doesn't exist or integration lacks access |
| 400 | Incorrectly formatted request |
| 429 | Request exceeds rate limits |

## Related Endpoints

After creating a database, you can:
- Add additional data sources via the Create a data source endpoint
- Modify child data source properties using the Update a data source API
