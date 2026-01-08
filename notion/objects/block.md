---
source: https://developers.notion.com/reference/block
scraped: 2026-01-08
---

# Block Object

## Overview

The Block object represents content within Notion, translating UI elements like headings, toggles, paragraphs, lists, and media into different block type objects through the API.

## Core Block Properties

| Property | Type | Description |
|----------|------|-------------|
| `object` | string | Always `"block"` |
| `id` | string (UUIDv4) | Unique block identifier |
| `parent` | object | Block's parent information |
| `type` | string (enum) | Block classification |
| `created_time` | ISO 8601 | Creation timestamp |
| `last_edited_time` | ISO 8601 | Last modification timestamp |
| `created_by` | Partial User | Creator information |
| `last_edited_by` | Partial User | Last editor information |
| `archived` | boolean | Archival status |
| `in_trash` | boolean | Deletion status |
| `has_children` | boolean | Contains nested blocks |

## Supported Block Types

### Text Blocks

- Heading 1, 2, 3 (with toggleable option)
- Paragraph
- Bulleted list item
- Numbered list item
- Quote
- Callout
- Code

### Media Blocks

- Image
- Video
- Audio
- File
- PDF
- Embed

### Structural Blocks

- Table (with table_row children)
- Column list and column
- Divider
- Table of contents
- Synced block

### Special Blocks

- Bookmark
- Breadcrumb
- Child database
- Child page
- To do
- Toggle
- Template
- Link preview

## Block Types Supporting Children

Certain blocks can contain nested content:

- Bulleted lists
- Callouts
- Child databases/pages
- Columns
- Toggleable headings
- Numbered lists
- Paragraphs
- Quotes
- Synced blocks
- Tables
- Templates
- To-dos
- Toggles

## Rich Text Support

Many block types include rich text arrays with formatting:

- bold
- italic
- strikethrough
- underline
- code
- color options

A `plain_text` property provides unformatted content access.

## File Handling

Blocks support three file type configurations:

| Type | Description |
|------|-------------|
| `file` | Notion-hosted with expiring URLs |
| `external` | Public URLs |
| `file_upload` | Attached via File Upload API |

## Key Limitations

- The API doesn't support all Notion block types; unsupported types return `"unsupported"`
- Template block creation was discontinued March 27, 2023
- Synced block updates aren't supported
- Table width cannot be modified after creation
- Link preview blocks are read-only
