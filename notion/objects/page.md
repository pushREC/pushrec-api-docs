---
source: https://developers.notion.com/reference/page
scraped: 2026-01-08
---

# Page Object

## Overview

The Page object represents a single Notion page and contains its property values. The Page object contains the page property values of a single Notion page.

## Key Characteristics

Every page has a parent, which can be a data source, another page, or a workspace. When the parent is a data source, property values follow the data source's schema. Otherwise, the only property value is `title`.

Page content exists as blocks and can be accessed through the block children endpoints for reading and appending content.

## Core Properties

| Property | Type | Purpose |
|----------|------|---------|
| `object` | string | Always returns `"page"` |
| `id` | UUIDv4 string | Unique page identifier |
| `created_time` | ISO 8601 timestamp | Page creation date/time |
| `created_by` | Partial User object | User who created the page |
| `last_edited_time` | ISO 8601 timestamp | Most recent modification time |
| `last_edited_by` | Partial User object | User who last edited the page |
| `archived` | boolean | Archived status indicator |
| `in_trash` | boolean | Trash status indicator |
| `icon` | File or Emoji object | Page icon (emoji or image) |
| `cover` | File object | Page cover image |
| `properties` | object | Page property values per schema |
| `parent` | object | Parent information (data source, page, or workspace) |
| `url` | string | Standard Notion page URL |
| `public_url` | string | Public web URL if published; otherwise null |

## Capability Requirements

Properties marked with an asterisk are accessible with any integration capabilities. Other properties require read content capabilities from the Notion API.
