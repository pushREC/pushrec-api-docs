---
source: https://developers.notion.com/reference/create-a-comment
scraped: 2026-01-08
---

# Create Comment

## Endpoint

**POST** `https://api.notion.com/v1/comments`

## Description

Add comments to Notion pages, blocks, or existing discussion threads.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `parent.page_id` | string | Conditional | Page ID to comment on |
| `parent.block_id` | string | Conditional | Block ID to comment on |
| `discussion_id` | string | Conditional | Discussion thread ID to reply to |
| `rich_text` | array | Yes | Rich text content of the comment |
| `attachments` | array | No | File attachments (max 3) |
| `display_name` | object | No | Custom display name configuration |

## Valid Comment Locations

Comments can be added in three ways:

| Location | Parameter Required |
|----------|-------------------|
| On a page | `parent.page_id` |
| On a block | `parent.block_id` |
| In a discussion thread | `discussion_id` |

**Important:** Only one of these parameters can be specified per request.

## Response

Returns a Comment object for the newly created comment.

## Required Capabilities

Integration must have **insert comment** capabilities enabled. Comment capabilities are disabled by default.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing insert comment capabilities |
| 404 | Parent page/block doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
