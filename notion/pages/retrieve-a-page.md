---
source: https://developers.notion.com/reference/retrieve-a-page
scraped: 2026-01-08
---

# Retrieve a Page

## Endpoint

**GET** `https://api.notion.com/v1/pages/{page_id}`

## Description

Fetches a Page object by its ID, returning page properties rather than content. To access actual page content, use the Retrieve block children endpoint.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page_id` | string | Yes | The ID of the page to retrieve |

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `filter_properties` | string | No | Property ID(s) to filter (comma-separated) |

## Response

Returns a Page object.

## Key Limitations

This endpoint will not accurately return properties that exceed 25 references:

| Property Type | Limitation |
|---------------|------------|
| **People properties** | Cannot guarantee more than 25 entries |
| **Relation properties** | Sets `has_more: true` if exceeding 25 related pages |
| **Rich text/title** | Maximum 25 inline mentions supported |

For properties surpassing this threshold, use the dedicated **Retrieve a page property** endpoint.

## Parent Context

| Parent Type | Available Properties |
|-------------|---------------------|
| Database | Properties conform to database schema |
| Standalone | Only title property available |

## Required Capabilities

Integration must have **read content** capabilities.

## Error Responses

| Status | Description |
|--------|-------------|
| 403 | Missing read content capabilities |
| 404 | Page doesn't exist or access denied |
| 400/429 | Request limit violations |
