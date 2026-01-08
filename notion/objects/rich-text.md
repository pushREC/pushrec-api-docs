---
source: https://developers.notion.com/reference/rich-text
scraped: 2026-01-08
---

# Rich Text Object

## Overview

Rich text in Notion enables customizable content formatting through styling (italics, font size, color) and structural elements (hyperlinks, code blocks). The API returns rich text as objects within block structures, allowing developers to access both styled and plain text versions.

## Rich Text Object Structure

Each rich text object contains:

| Field | Type | Purpose |
|-------|------|---------|
| `type` | enum | Identifies object category: `"text"`, `"mention"`, or `"equation"` |
| `text`/`mention`/`equation` | object | Type-specific configuration |
| `annotations` | object | Styling information |
| `plain_text` | string | Unformatted content |
| `href` | string (optional) | URL for links or Notion references |

## Annotation Object

Controls text styling with boolean flags and color enumeration:

### Boolean Properties

- `bold`
- `italic`
- `strikethrough`
- `underline`
- `code`

### Color Property

Accepts values like `"blue"`, `"green"`, `"red"`, with optional `"_background"` variants, or `"default"`.

## Rich Text Types

### Text Objects

Contains `content` (string) and optional `link` object with `url`. Links populate the parent's `href` field.

### Mention Objects

References databases, dates, link previews, pages, template elements, or users. Each type contains specific nested data:

| Type | Description |
|------|-------------|
| **Database** | ID reference; returns `"Untitled"` if inaccessible |
| **Date** | Structured date with `start` and optional `end` |
| **Link Preview** | URL string |
| **Page** | ID reference; returns `"Untitled"` if inaccessible |
| **Template** | Placeholder types (`"template_mention_date"` or `"template_mention_user"`) |
| **User** | Full user object; shows `"@Anonymous"` without proper access |

### Equation Objects

Contains `expression` field with LaTeX string (e.g., `"E = mc^2"`).

## Key Implementation Notes

- Plain text extraction provides accessible content regardless of formatting
- Inaccessible references display generic names while maintaining structural data
- Template mentions populate with actual values upon duplication
- Color annotations support 16 base colors with background variants
- Request limits apply to rich text object sizes
