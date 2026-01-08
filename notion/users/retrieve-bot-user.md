---
source: https://developers.notion.com/reference/get-self
scraped: 2026-01-08
---

# Retrieve Your Token's Bot User

## Endpoint

**GET** `https://api.notion.com/v1/users/me`

## Description

Retrieves the bot User associated with the API token provided in the authorization header. The returned bot object includes an `owner` field containing details about the person who authorized the integration.

## Response

Returns a User object (bot type) that adheres to the integration's defined capabilities.

## Key Features

| Feature | Description |
|---------|-------------|
| Universal Access | Available to integrations at any capability level |
| Capability-Aware | Returned user object respects integration limitations |
| Owner Information | Includes data about the authorizing user |

## Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `object` | string | Always `"user"` |
| `id` | string | Bot's unique identifier |
| `type` | string | Always `"bot"` |
| `name` | string | Bot display name |
| `avatar_url` | string | Bot avatar URL |
| `bot.owner` | object | Information about the authorizing user |
| `bot.workspace_name` | string | Workspace name |
| `bot.workspace_id` | string | Workspace ID |
