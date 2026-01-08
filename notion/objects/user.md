---
source: https://developers.notion.com/reference/user
scraped: 2026-01-08
---

# User Object

## Overview

The User object represents individuals, guests, and integrations within a Notion workspace. Users include full workspace members, guests, and integrations.

## Core Properties (All Users)

Every user object contains these required fields:

| Property | Type | Description |
|----------|------|-------------|
| `object` | string | Always returns `"user"` |
| `id` | UUID string | Unique identifier for the user |
| `type` | enum (optional) | Either `"person"` or `"bot"` |
| `name` | string (optional) | Display name in Notion |
| `avatar_url` | string (optional) | Avatar image URL |

## Person User Type

When `type` equals `"person"`, an additional property appears:

| Property | Description |
|----------|-------------|
| `person.email` | Email address (only included if integration has appropriate user capability permissions) |

## Bot User Type

Bot users (`type: "bot"`) include expanded metadata:

| Property | Type | Purpose |
|----------|------|---------|
| `bot` | object | Contains owner and workspace information |
| `bot.owner.type` | enum | Either `"workspace"` or `"user"` |
| `bot.workspace_name` | string | Workspace identifier (null if user-owned) |
| `bot.workspace_id` | string | Workspace UUID |
| `bot.workspace_limits` | object | Operational constraints |
| `bot.workspace_limits.max_file_upload_size_in_bytes` | integer | Upload size ceiling |

## Where Users Appear

User objects surface throughout API responses within:

- Block objects (created_by, last_edited_by fields)
- Page objects and people properties
- Database objects
- Rich text mentions
- Property definitions

User objects will always contain `object` and `id` keys. Additional properties depend on context and bot capabilities.
