---
created: 2026-01-09
tags: [type/api-reference, api/allocations]
api_name: Asana
category: Allocations
endpoint_count: 5
---

# Asana - Allocations

[[README|Back to Overview]]

---

## GET /allocations/{allocation_gid}

**Get an allocation**

Returns the complete allocation record for a single allocation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/allocations/{allocation_gid}"
```

---

## PUT /allocations/{allocation_gid}

**Update an allocation**

An existing allocation can be updated by making a PUT request on the URL for
that allocation. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated allocation record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/allocations/{allocation_gid}"
```

---

## DELETE /allocations/{allocation_gid}

**Delete an allocation**

A specific, existing allocation can be deleted by making a DELETE request on the URL for that allocation.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/allocations/{allocation_gid}"
```

---

## GET /allocations

**Get multiple allocations**

Returns a list of allocations filtered to a specific project, user or placeholder.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent` | query | string | No | Globally unique identifier for the project to filt |
| `assignee` | query | string | No | Globally unique identifier for the user or placeho |
| `workspace` | query | string | No | Globally unique identifier for the workspace. |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/allocations"
```

---

## POST /allocations

**Create an allocation**

Creates a new allocation.

Returns the full record of the newly created allocation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/allocations"
```

---
