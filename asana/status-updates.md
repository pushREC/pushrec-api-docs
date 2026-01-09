---
created: 2026-01-09
tags: [type/api-reference, api/status-updates]
api_name: Asana
category: Status updates
endpoint_count: 4
---

# Asana - Status Updates

[[README|Back to Overview]]

---

## GET /status_updates/{status_update_gid}

**Get a status update**

Returns the complete record for a single status update.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/status_updates/{status_update_gid}"
```

---

## DELETE /status_updates/{status_update_gid}

**Delete a status update**

Deletes a specific, existing status update.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/status_updates/{status_update_gid}"
```

---

## GET /status_updates

**Get status updates from an object**

Returns the compact status update records for all updates on the object.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent` | query | string | Yes | Globally unique identifier for object to fetch sta |
| `created_since` | query | string | No | Only return statuses that have been created since  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/status_updates"
```

---

## POST /status_updates

**Create a status update**

Creates a new status update on an object.
Returns the full record of the newly created status update.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/status_updates"
```

---
