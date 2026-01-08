---
source: https://developers.notion.com/reference/retrieve-a-data-source
scraped: 2026-01-08
---

# Retrieve a Data Source

## Endpoint

**GET** `https://api.notion.com/v1/data_sources/{data_source_id}`

## Description

Retrieves a data source object that describes the structure and columns of a data source for a given ID.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `data_source_id` | string | Yes | The ID of the data source to retrieve |

## Response

Returns a Data Source object containing structure and property information.

## Finding a Data Source ID

| Method | Description |
|--------|-------------|
| From Database URL | 32-character alphanumeric string in the database URL |
| Via Retrieve Database API | Access the `data_sources` list in the response |
| From Notion App | Use "Copy data source ID" in database's "Manage data sources" menu |

## Important Constraints

### Related Database Sharing Requirement

To retrieve properties from database relations, the related database must be shared with your integration alongside the primary database. Properties based on unshared relations won't appear in responses.

### Linked Data Sources Limitation

The API cannot retrieve linked data source information directly. Share the original source database with your integration instead.
