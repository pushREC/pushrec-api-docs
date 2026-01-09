---
created: 2026-01-09
tags: [type/api-reference, api/store]
api_name: Apify API
category: Store
endpoint_count: 1
---

# Apify API - Store

[[README|Back to Overview]]

---

## GET /v2/store

**Get list of Actors in store**

Gets the list of public Actors in Apify Store. You can use `search`
parameter to search Actors by string in title, name, description, username
and readme.
If you need detailed info about a specific Actor, use the [Get
Actor](#/reference/actors/actor-object/get-actor) endpoint.

The endpoint supports pagination using the `limit` and `offset` parameters.
It will not return more than 1,000 records.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | number | No | Maximum number of elements to return. The default  |
| `offset` | query | number | No | Number of elements that should be skipped at the s |
| `search` | query | string | No | String to search by. The search runs on the follow |
| `sortBy` | query | string | No | Specifies the field by which to sort the results.  |
| `category` | query | string | No | Filters the results by the specified category. |
| `username` | query | string | No | Filters the results by the specified username. |
| `pricingModel` | query | string | No | Only return Actors with the specified pricing mode |
| `allowsAgenticUsers` | query | boolean | No | If true, only return Actors that allow agentic use |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.apify.com/v2/store"
```

---
