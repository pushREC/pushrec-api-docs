---
source: https://developers.notion.com/reference/comment-display-name
scraped: 2026-01-08
---

# Comment Display Name

## Overview

The Comment Display Name object defines how an author's name appears on comments in Notion. It provides three naming options that override the default author identification.

## Request Format (Input)

| Parameter | Type | Description | Example |
|-----------|------|-------------|---------|
| `type` | string (enum) | One of: `"integration"`, `"user"`, or `"custom"` | `"user"` |
| `custom` | object | Required when type is `"custom"` | `{ "name": "Notion Bot" }` |

### Type Options

| Type | Description |
|------|-------------|
| `"integration"` | Displays the integration's registered name |
| `"user"` | Shows the authenticating user's name (Public Integrations only) |
| `"custom"` | Allows any arbitrary display name via the custom object |

### Example Request

```json
{
  "parent": {
    "page_id": "d0a1ffaf-a4d8-4acf-a1ed-abae6e110418"
  },
  "rich_text": [{
    "text": {
      "content": "Thanks for checking us out!"
    }
  }],
  "display_name": {
    "type": "custom",
    "custom": {
      "name": "Notion Bot"
    }
  }
}
```

## Response Format (Output)

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `type` | string (enum) | Same values as request | `"custom"` |
| `resolved_name` | string | The actual display name shown | `"Notion Bot"` |

### Example Response

```json
{
  "display_name": {
    "type": "custom",
    "resolved_name": "Notion Bot"
  }
}
```
