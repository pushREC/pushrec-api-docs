---
source: https://developers.notion.com/reference/emoji-object
scraped: 2026-01-08
---

# Emoji Object

## Overview

The emoji object in Notion's API represents emoji characters, primarily used for page icons in the Notion interface.

## Standard Emoji Structure

An emoji object contains two fields:

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `type` | string | Always `"emoji"` | `"emoji"` |
| `emoji` | string | The emoji character itself | `"😻"` |

### Basic Example

```json
{
  "type": "emoji",
  "emoji": "😻"
}
```

## Using Emojis as Page Icons

### Create a Page

Include the icon property when creating a new page with an emoji:

```json
{
  "parent": { "page_id": "13d6da822f9343fa8ec14c89b8184d5a" },
  "properties": {
    "title": [{
      "type": "text",
      "text": { "content": "A page with an avocado icon" }
    }]
  },
  "icon": { "type": "emoji", "emoji": "🥑" }
}
```

### Update Page

Modify existing page icons using the PATCH endpoint:

```json
{
  "icon": { "type": "emoji", "emoji": "🥨" }
}
```

## Custom Emoji Objects

Custom emojis are workspace-managed icons with extended properties:

| Field | Type | Contents |
|-------|------|----------|
| `type` | string | `"custom_emoji"` |
| `custom_emoji` | object | Contains `id`, `name`, `url` |

### Example Response

```json
{
  "icon": {
    "type": "custom_emoji",
    "custom_emoji": {
      "id": "45ce454c-d427-4f53-9489-e5d0f3d1db6b",
      "name": "bufo",
      "url": "https://s3-us-west-2.amazonaws.com/..."
    }
  }
}
```

### Setting a Custom Emoji Icon

```json
{
  "icon": {
    "type": "custom_emoji",
    "custom_emoji": { "id": "45ce454c-d427-4f53-9489-e5d0f3d1db6b" }
  }
}
```

Custom emojis can appear in page icons and inline within rich text mentions.
