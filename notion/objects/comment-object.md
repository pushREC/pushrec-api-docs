---
source: https://developers.notion.com/reference/comment-object
scraped: 2026-01-08
---

# Comment Object

## Overview

The Comment object represents remarks on Notion pages or blocks. Integrations require appropriate capabilities to view or create comments. Comments can be viewed or created by an integration that has access to the page/block and the correct capabilities.

## Core Properties

| Property | Type | Purpose |
|----------|------|---------|
| `object` | string | Always returns `"comment"` |
| `id` | UUIDv4 | Unique comment identifier |
| `parent` | object | References the page or block containing the comment |
| `discussion_id` | UUIDv4 | Identifies the comment thread association |
| `created_time` | ISO 8601 | Timestamp of comment creation |
| `last_edited_time` | ISO 8601 | Timestamp of last modification |
| `created_by` | Partial User | Author information |
| `rich_text` | Rich text array | Formatted comment content with links and mentions |
| `attachments` | array | File attachments with expiration metadata |
| `display_name` | object | Custom or user-based display name |

## Key Characteristics

Comment retrieval returns objects in chronological ascending order. When adding a comment to a page or discussion, the Comment object just added will always be returned.

## API Access Requirements

Integrations must enable either "read comments" or "insert comments" capabilities to interact with Comment objects through the API.
