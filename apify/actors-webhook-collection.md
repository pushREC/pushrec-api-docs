---
created: 2026-01-09
tags: [type/api-reference, api/actors/webhook-collection]
api_name: Apify API
category: Actors/Webhook collection
endpoint_count: 1
---

# Apify API - Actors/Webhook Collection

[[README|Back to Overview]]

---

## GET /v2/acts/{actorId}/webhooks

**Get list of webhooks**

Gets the list of webhooks of a specific Actor. The response is a JSON with
the list of objects, where each object contains basic information about a single webhook.

The endpoint supports pagination using the `limit` and `offset` parameters
and it will not return more than 1000 records.

By default, the records are sorted by the `createdAt` field in ascending
order, to sort the records in descending order, use the `desc=1` parameter.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `actorId` | path | string | Yes | Actor ID or a tilde-separated owner's username and |
| `offset` | query | number | No | Number of array elements that should be skipped at |
| `limit` | query | number | No | Maximum number of array elements to return. The de |
| `desc` | query | boolean | No | If `true` or `1` then the objects are sorted by th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/acts/{actorId}/webhooks"
```

---
