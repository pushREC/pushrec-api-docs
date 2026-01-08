---
source: https://developers.notion.com/reference/property-item-object
scraped: 2026-01-08
---

# Page Property Items

## Overview

The `property_item` object describes the identifier, type, and value of a page property, returned from the "Retrieve a page property item" API endpoint. It extends the structure found in page properties with additional details specific to retrieving individual items, including value pagination capabilities.

## Common Fields

Every property item contains:

| Field | Type | Purpose |
|-------|------|---------|
| `object` | string | Always `"property_item"` |
| `id` | string | Underlying identifier (UUID or short string) that remains constant when property names change |
| `type` | string (enum) | Property classification |

### Supported Types

- rich_text
- number
- select
- multi_select
- date
- formula
- relation
- rollup
- title
- people
- files
- checkbox
- url
- email
- phone_number
- created_time
- created_by
- last_edited_time
- last_edited_by

## Paginated Values

Title, rich_text, relation, and people properties return as paginated `list` objects containing:

| Field | Description |
|-------|-------------|
| `object` | Always `"list"` |
| `type` | Always `"property_item"` |
| `results` | Array of property_item objects |
| `next_url` | URL for subsequent pages (or null) |
| `property_item` | Describes the paginated property |

## Property Types

### Title & Rich Text

Contains arrays of rich text objects with formatting metadata (bold, italic, strikethrough, underline, code, color).

### Number

Simple numeric value within the `number` property.

### Select & Multi-select

Option objects containing:

| Field | Description |
|-------|-------------|
| `id` | UUIDv4 identifier |
| `name` | Option name |
| `color` | Enum: default, gray, brown, red, orange, yellow, green, blue, purple, pink |

### Date

| Field | Description |
|-------|-------------|
| `start` | ISO 8601 date string |
| `end` | Optional end date |
| `time_zone` | Optional IANA format timezone |

### Formula

Result objects with `type` field (string, number, boolean, date) and corresponding typed value.

### Relation

Array of relation items with page references containing UUIDv4 IDs.

### Rollup

Paginated list with aggregation function and computed results. Supports number, date, array, unsupported, and incomplete types.

### People

Array of user objects with id, name, avatar_url, and person details.

### Files

Array of file references with filename and File Object data.

### Checkbox

Boolean value.

### URL, Email, Phone Number

String values (no enforced structure for phone numbers).

### Created/Last Edited Time

ISO 8601 formatted datetime strings.

### Created By/Last Edited By

User objects describing the relevant actor.
