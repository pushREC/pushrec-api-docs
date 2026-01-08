---
source: https://developers.notion.com/reference/unfurl-attribute-object
scraped: 2026-01-08
---

# Unfurl Attribute (Link Previews)

## Overview

Link Previews are real-time excerpts of authenticated content that unfurl in Notion when users share enabled links. Developers can customize how links from their domains appear when unfurled in Notion workspaces through unfurl attribute objects.

## Core Requirements

Every unfurl attribute array must contain:
- A `title` attribute (required)
- A `dev` attribute (required, indicates developer/company name)

## Unfurl Attribute Object Structure

Each object in the array contains:

| Field | Type | Purpose |
|-------|------|---------|
| `id` | string | Unique identifier; later values override earlier ones |
| `name` | string | Human-readable description |
| `type` | `inline` \| `embed` | Attribute category |
| `inline` \| `embed` | object | Contains value and section placement |

## Inline Sub-type Options

Supported sub-types for inline attributes:

| Sub-type | Description |
|----------|-------------|
| `color` | RGB value object |
| `date` | Date string |
| `datetime` | ISO 8601 timestamp |
| `enum` | Text value with optional color |
| `plain_text` | Any text content |
| `title` | Main heading (required in array) |

## Embed Sub-types

For rich media content:

| Sub-type | Description |
|----------|-------------|
| `audio` | Audio file from URL |
| `html` | HTML rendered in iframe |
| `image` | Image file from URL |
| `video` | Video file from URL |

## Section Values (Display Locations)

Attributes map to preview locations:

| Section | Display Area | Valid Sub-types |
|---------|--------------|-----------------|
| `avatar` | Bottom-left picture | `image`, `plain_text` |
| `background` | Background color | `color` |
| `body` | Main content area | `plain_text` |
| `embed` | Large media space | Media types |
| `entity` | Small subheading icon | `color`, `image` |
| `identifier` | Bottom subheading | `image`, `plain_text` |
| `primary` | First subheading | `enum`, `date`, `datetime`, `plain_text` |
| `secondary` | Second subheading | `date`, `datetime`, `plain_text` |
| `title` | Main heading (required) | `title` |

## JSON Payload Example

```json
[
  {
    "id": "title",
    "name": "Title",
    "type": "inline",
    "inline": {
      "title": {
        "value": "Feature Request: Link Previews",
        "section": "title"
      }
    }
  },
  {
    "id": "dev",
    "name": "Developer Name",
    "type": "inline",
    "inline": {
      "plain_text": {
        "value": "Acme Inc",
        "section": "secondary"
      }
    }
  }
]
```

## Display Formats

Link Previews render in two formats:
- **Full format**: Complete preview with all customizable sections
- **Mention**: Miniature version using same data
