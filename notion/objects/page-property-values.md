---
source: https://developers.notion.com/reference/page-property-values
scraped: 2026-01-08
---

# Page Property Values

## Overview

Page properties form the core data structure within Notion's API. A page object comprises properties containing data about that page. When creating pages via the API, developers set properties in the `properties` object body parameter. When retrieving pages, the API surfaces each property's identifier, type, and value.

Pages that live in a data source are easier to query and manage than standalone pages, which only support a `title` property.

## Core Attributes

Every page property value object contains:

| Attribute | Description |
|-----------|-------------|
| `id` | An underlying identifier (historically UUID-based, now short URL-encoded IDs) that remains constant when property names change |
| `type` | The property classification (e.g., checkbox, date, select, etc.) |
| Property-specific object | Contains type-dependent values and metadata |

## Supported Property Types

### Simple Value Types

| Type | Description |
|------|-------------|
| **Checkbox** | Boolean field storing `true` or `false` state |
| **Number** | Numeric values with optional formatting |
| **Email** | String containing email addresses |
| **Phone number** | String representation (no format enforcement) |
| **URL** | Web address strings |
| **Title** | Array of rich text objects representing page name |
| **Rich text** | Arrays of formatted text segments with annotations (bold, italic, color, etc.) |

### Selection Properties

| Type | Description |
|------|-------------|
| **Select** | Single-option choice with ID, name, and color attributes |
| **Multi-select** | Array of multiple options, each containing ID, name, and color |
| **Status** | Named status option with color coding (distinct from select) |

### Relationship & Reference Properties

| Type | Description |
|------|-------------|
| **People** | Array of user objects representing assigned individuals |
| **Relation** | Array of page references linking to entries in related data sources, with `has_more` flag for pagination |
| **Created by** / **Last edited by** | User objects capturing authorship metadata |

### Temporal Properties

| Type | Description |
|------|-------------|
| **Date** | ISO 8601 formatted dates with optional start/end ranges and timezone support |
| **Created time** / **Last edited time** | Read-only timestamps (ISO 8601 format) |

### Computed Properties

| Type | Description |
|------|-------------|
| **Formula** | Calculated value with types including boolean, date, number, or string—results cannot be updated directly |
| **Rollup** | Aggregated values using functions like `sum`, `count`, `average`, `max`, `min` across related entries |

### File & Media

| Type | Description |
|------|-------------|
| **Files** | Array of file objects supporting both external URLs and Notion-hosted uploads, with required `name` parameter for external links |
| **Icon** | Emoji or uploaded image file type with expiry timestamps for file-based icons |

### Specialized Properties

| Type | Description |
|------|-------------|
| **Unique ID** | Auto-incrementing numeric identifier with optional prefix (read-only via API) |
| **Verification** | State indicator (`verified`/`unverified`) for wiki database pages, including verified-by user and optional expiration date |
| **Unsupported properties** | Return `null` values and should be excluded during updates |

## Size Limitations

The API enforces size restrictions on property values. Consult the limits documentation for specifics on individual property types.

## Pagination Handling

Properties supporting multiple references—`title`, `rich_text`, `relation`, and `people`—return paginated list objects. Each response includes:

- Result set of up to 25 items
- `next_url` for retrieving additional pages
- `property_item` metadata indicating property type

Use the dedicated Retrieve a Page Property Item endpoint for properties exceeding 25 references to ensure complete data accuracy.

## API Operations

| Operation | Description |
|-----------|-------------|
| **Create** | Set properties in POST requests to establish page data |
| **Retrieve** | GET requests surface current property values |
| **Update** | PATCH requests modify specific property values |
| **Property Item Retrieval** | Dedicated endpoint for individual property pagination |

## Developer Notes

- Write permissions to parent data sources required when creating new select/multi-select options or updating relations
- Relations require the related database to be shared with the integration for complete results
- Formula and rollup properties depend on sufficient integration permissions for accurate calculations
