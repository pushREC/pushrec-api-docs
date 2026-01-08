---
source: https://developers.notion.com/reference/post-page
scraped: 2026-01-08
---

# Create a Page

## Endpoint

**POST** `https://api.notion.com/v1/pages`

## Description

Creates a new page as a child of an existing page or data source.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `parent` | object | Yes* | Parent page or data source (*optional for public integrations) |
| `properties` | object | Yes | Page properties matching parent schema |
| `children` | array | No | Array of block objects for page content |
| `icon` | object | No | Emoji or file object for page icon |
| `cover` | object | No | File object for page cover |
| `template` | string | No | Template option: `none`, `default`, or template page ID |

## Parent Selection

| Parent Type | Integration Type | Description |
|-------------|------------------|-------------|
| `page_id` | All | Create as child of existing page |
| `data_source` | All | Create as child of data source (database) |
| `workspace: true` | Public only | Create private workspace-level page |

## Page Properties

| Parent Type | Valid Properties |
|-------------|------------------|
| Child of page | Only `title` is valid |
| Child of data source | Must match parent data source's schema |

## Template Options

| Value | Description |
|-------|-------------|
| `none` | No template (default) |
| `default` | Data source's default template |
| `template_id` | Specific template page ID |

## Read-Only Properties

The API cannot set these properties (automatically created):

- `rollup`
- `created_by`
- `created_time`
- `last_edited_by`
- `last_edited_time`

## Response

Returns a new Page object.

## Required Capabilities

Integration must have **insert content** capabilities on the target parent.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing insert content capabilities |
| 404 | Parent doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
