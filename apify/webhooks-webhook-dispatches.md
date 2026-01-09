---
created: 2026-01-09
tags: [type/api-reference, api/webhooks/webhook-dispatches]
api_name: Apify API
category: Webhooks/Webhook dispatches
endpoint_count: 2
---

# Apify API - Webhooks/Webhook Dispatches

[[README|Back to Overview]]

---

## GET /v2/webhook-dispatches

**Get list of webhook dispatches**

Gets the list of webhook dispatches that the user have.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.
By default, the records are sorted by the `createdAt` field in ascending
order. To sort the records in descending order, use the `desc=1`
parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `offset` | query | number | No | Number of records that should be skipped at the st |
| `limit` | query | number | No | Maximum number of records to return. The default v |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhook-dispatches"
```

---

## GET /v2/webhook-dispatches/{dispatchId}

**Get webhook dispatch**

Gets webhook dispatch object with all details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dispatchId` | path | string | Yes | Webhook dispatch ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/webhook-dispatches/{dispatchId}"
```

---
