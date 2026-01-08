---
source: https://developers.notion.com/reference/webhooks-events-delivery
scraped: 2026-01-08
---

# Event Types & Delivery

## Overview

Notion webhooks notify integrations about changes to pages and databases. Events signal that something changed but don't contain the full modified content. Integrations must follow up with API calls to retrieve updated information.

**Example**: When a page title updates, you receive a `page.content_updated` event with the page ID, then use the retrieve page endpoint to fetch the new title.

## Event Properties

All webhook events share these core fields:

| Field | Type | Purpose |
|-------|------|---------|
| `id` | UUID | Unique event identifier |
| `timestamp` | ISO 8601 | When the event occurred |
| `workspace_id` | UUID | Source workspace |
| `subscription_id` | UUID | Webhook subscription ID |
| `integration_id` | UUID | Associated integration |
| `type` | String | Event category (e.g., `page.created`) |
| `authors` | Array | Users/bots who triggered the action |
| `accessible_by` | Array | Bots and users with access (public integrations only) |
| `attempt_number` | Number | Delivery attempt (1-8) |
| `entity` | Object | The changed resource (page, block, or database) |
| `data` | Object | Event-specific details |

## Supported Event Types

### Page Events

| Event | Description | Aggregated |
|-------|-------------|------------|
| `page.created` | New page | Yes |
| `page.properties_updated` | Property changes | Yes |
| `page.content_updated` | Content/block changes | Yes |
| `page.moved` | Page relocation | Yes |
| `page.deleted` | Moved to trash | Yes |
| `page.undeleted` | Restored from trash | Yes |
| `page.locked` | Edit lock applied | No |
| `page.unlocked` | Lock removed | No |

### Database Events

| Event | Description | Aggregated | Status |
|-------|-------------|------------|--------|
| `database.created` | New database | Yes | Active |
| `database.content_updated` | Content updates | Yes | **Deprecated 2025-09-03** |
| `database.schema_updated` | Schema changes | Yes | **Deprecated 2025-09-03** |
| `database.moved` | Database moved | Yes | Active |
| `database.deleted` | Moved to trash | Yes | Active |
| `database.undeleted` | Restored from trash | Yes | Active |

### Data Source Events (New in 2025-09-03)

| Event | Description | Aggregated |
|-------|-------------|------------|
| `data_source.content_updated` | Content changes | Yes |
| `data_source.created` | New data source | Yes |
| `data_source.schema_updated` | Schema updates | Yes |
| `data_source.deleted` | Moved to trash | Yes |
| `data_source.undeleted` | Restored from trash | Yes |
| `data_source.moved` | Relocation between databases | Yes |

### Comment Events

| Event | Description | Aggregated |
|-------|-------------|------------|
| `comment.created` | New comment/suggested edit | No |
| `comment.updated` | Comment edited | No |
| `comment.deleted` | Comment removed | No |

## Event Delivery Details

| Aspect | Details |
|--------|---------|
| **Timing** | Events typically deliver within 1 minute; maximum 5 minutes |
| **Aggregation** | High-frequency events batch changes within a brief window into single notifications |
| **Ordering** | Events may arrive out of sequence; use `timestamp` field to reorder |
| **Retries** | Up to 8 attempts with exponential backoff; final retry ~24 hours after initial trigger |
| **Delivery** | Targets at-most-once delivery |

## Sample Event Payloads

### page.created

```json
{
  "id": "367cba44-b6f3-4c92-81e7-6a2e9659efd4",
  "timestamp": "2024-12-05T23:55:34.285Z",
  "workspace_id": "13950b26-c203-4f3b-b97d-93ec06319565",
  "type": "page.created",
  "authors": [{"id": "c7c11cca-1d73-471d-9b6e-bdef51470190", "type": "person"}],
  "entity": {"id": "153104cd-477e-809d-8dc4-ff2d96ae3090", "type": "page"},
  "data": {"parent": {"id": "0ef104cd-477e-80e1-8571-cfd10e92339a", "type": "page"}}
}
```

### page.properties_updated

```json
{
  "type": "page.properties_updated",
  "entity": {"id": "153104cd-477e-809d-8dc4-ff2d96ae3090", "type": "page"},
  "data": {
    "updated_properties": ["XGe%40", "bDf%5B", "DbAu"],
    "parent": {"id": "13950b26-c203-4f3b-b97d-93ec06319565", "type": "space"}
  }
}
```

### database.schema_updated

```json
{
  "type": "database.schema_updated",
  "entity": {"id": "153104cd-477e-80eb-ae76-e1c2a32c7b35", "type": "database"},
  "data": {
    "updated_properties": [
      {"id": "kqLW", "name": "Created at", "action": "created"},
      {"id": "wX%7Bd", "name": "Blurb", "action": "updated"},
      {"id": "LIM%5D", "name": "Description", "action": "deleted"}
    ]
  }
}
```

### comment.created

```json
{
  "type": "comment.created",
  "entity": {"id": "153104cd-477e-80ca-8f75-001d9e2b6839", "type": "comment"},
  "data": {
    "page_id": "0ef104cd-477e-80e1-8571-cfd10e92339a",
    "parent": {"id": "0ef104cd-477e-80e1-8571-cfd10e92339a", "type": "page"}
  }
}
```

## Important Notes

- Subscriptions don't automatically update when Notion adds new event types—manually update to receive additional events
- Webhook events may not show the most current state; always fetch latest data via API
- "Aggregated" events group rapid successive changes; may delay delivery slightly for efficiency
