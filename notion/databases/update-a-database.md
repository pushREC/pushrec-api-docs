---
source: https://developers.notion.com/reference/database-update
scraped: 2026-01-08
---

# Update a Database

## Endpoint

**PATCH** `https://api.notion.com/v1/databases/{database_id}`

## Description

Modifies database attributes such as title, description, icon, or cover settings. Returns the refreshed database object following the update.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `database_id` | string | Yes | The ID of the database to update |

## Request Body

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | array | Rich text array for database title |
| `description` | array | Rich text array for description |
| `icon` | object | Emoji or file object |
| `cover` | object | File object for cover image |

## Response

Returns the updated Database object.

## Important Note

To modify the `properties` associated with data sources under a database, use the "Update a data source" API (available from version `2025-09-03` onward).

## Error Responses

Multiple error codes are possible. Consult the Status codes documentation for comprehensive error code information.
