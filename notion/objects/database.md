---
source: https://developers.notion.com/reference/database
scraped: 2026-01-08
---

# Database Object

## Overview

The database object represents a container for one or more data sources within Notion's workspace. As of the September 2025 API update, databases parent data sources, which in turn parent pages, establishing a hierarchical structure.

## Key Characteristics

- Databases can be displayed inline (`is_inline: true`) or as full pages (`is_inline: false`)
- Each data source maintains independent properties and row sets
- Permission management occurs at the database level, not individual data sources
- Workspace-level databases must be full-page rather than inline

## Core Object Fields

| Field | Type | Purpose |
|-------|------|---------|
| `object` | string | Always returns `"database"` |
| `id` | UUID string | Unique identifier for the database |
| `data_sources` | array | Child data sources with `id` and `name` properties |
| `created_time` | ISO 8601 | Database creation timestamp |
| `created_by` | Partial User | User who created the database |
| `last_edited_time` | ISO 8601 | Last modification timestamp |
| `last_edited_by` | Partial User | User responsible for last edit |
| `title` | Rich text array | Database name as displayed in Notion |
| `description` | Rich text array | Database description |
| `icon` | File/Emoji object | Database icon |
| `cover` | File object | Cover image |
| `parent` | object | Parent reference information |
| `url` | string | Notion database URL |
| `archived` | boolean | Archival status |
| `in_trash` | boolean | Deletion status |
| `is_inline` | boolean | Inline versus full-page display |
| `public_url` | string | Published URL or null |

## Architecture Change (2025-09-03)

The update introduced the Data source object which now holds properties previously at the database level, requiring integrations to upgrade accordingly.
