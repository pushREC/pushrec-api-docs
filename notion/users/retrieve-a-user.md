---
source: https://developers.notion.com/reference/get-user
scraped: 2026-01-08
---

# Retrieve a User

## Endpoint

**GET** `https://api.notion.com/v1/users/{user_id}`

## Description

Retrieves a User object by user ID.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `user_id` | string | Yes | The ID of the user to retrieve |

## Response

Returns a User object.

## Required Capabilities

Integration must have **user information** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing user information capabilities |
| 404 | User doesn't exist or access denied |
| 400/429 | Request exceeds rate limits |
