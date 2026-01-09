---
created: 2026-01-09
tags: [type/api-reference, api/time-periods]
api_name: Asana
category: Time periods
endpoint_count: 2
---

# Asana - Time Periods

[[README|Back to Overview]]

---

## GET /time_periods/{time_period_gid}

**Get a time period**

Returns the full record for a single time period.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_periods/{time_period_gid}"
```

---

## GET /time_periods

**Get time periods**

Returns compact time period records.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `start_on` | query | string | No | ISO 8601 date string |
| `end_on` | query | string | No | ISO 8601 date string |
| `workspace` | query | string | Yes | Globally unique identifier for the workspace. |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_periods"
```

---
