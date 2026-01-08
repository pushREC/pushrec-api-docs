---
source: https://developers.notion.com/reference/database-retrieve
scraped: 2026-01-08
---

# Retrieve a Database

## Endpoint

**GET** `https://api.notion.com/v1/databases/{database_id}`

## Description

Retrieves a database object that serves as a container for one or more data sources. The API response respects integration capability limits.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `database_id` | string | Yes | The ID of the database to retrieve |

## Response

Returns a Database object.

## Key Response Fields

| Field | Description |
|-------|-------------|
| `data_sources` | Array containing JSON objects with `id` and `name` of each data source within the database |
| `parent` | Identifies the direct parent (typically `page_id` or `workspace: true`) |

## Finding Your Database ID

The database ID is a 32-character alphanumeric string located in your Notion workspace URL. It appears between the slash following the workspace name and the question mark in the URL path.

## Error Responses

Various error codes are documented in the Status codes section.
