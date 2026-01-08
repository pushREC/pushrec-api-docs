---
source: https://developers.notion.com/reference/create-a-data-source
scraped: 2026-01-08
---

# Create a Data Source

## Endpoint

**POST** `https://api.notion.com/v1/data_sources`

## Description

Add an additional data source to an existing database. The properties structure mirrors what's established during database creation and can be managed independently of the properties of any sibling data sources.

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `parent` | object | Yes | Parent database reference with `database_id` |
| `title` | array | No | Rich text array for data source title |
| `description` | array | No | Rich text array for description |
| `icon` | object | No | Emoji or file object |
| `properties` | object | Yes | Property schema for the data source |

## Response

Returns the newly created Data Source object.

## Automatic View Creation

When a new data source is created, the system automatically generates a standard table view. Managing views is not currently supported in the API.

## Property Structure

Data source properties follow the same schema pattern documented in the Property Object reference.

## Related Endpoints

| Endpoint | Purpose |
|----------|---------|
| Create a Database | Create database with initial data source |
| Update a Data Source | Modify existing data source |
| Query a Data Source | Retrieve pages from data source |
