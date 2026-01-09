---
created: 2026-01-09
tags: [type/api-reference, api/rates]
api_name: Asana
category: Rates
endpoint_count: 5
---

# Asana - Rates

[[README|Back to Overview]]

---

## GET /rates

**Get multiple rates**

Returns a list of `rate` records. The possible types for `parent` in this request are `project`. An additional `resource` (`user` GID or `placeholder` GID) can be passed in to filter to a specific rate.

Modifying placeholder rates is only available for Enterprise and Enterprise+ users.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent` | query | string | No | Globally unique identifier for `project`. |
| `resource` | query | string | No | Globally unique identifier for `user` or `placehol |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rates"
```

---

## POST /rates

**Create a rate**

Creates a new rate for a `parent` + `resource` combination.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rates"
```

---

## GET /rates/{rate_gid}

**Get a rate**

Returns the complete rate record for a single rate.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rates/{rate_gid}"
```

---

## PUT /rates/{rate_gid}

**Update a rate**

An existing rate can be updated by making a PUT request on the URL for
that rate. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged. (note that at this time, the only field that can be updated is the `rate` field.)

Returns the complete updated rate record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rates/{rate_gid}"
```

---

## DELETE /rates/{rate_gid}

**Delete a rate**

Deletes a rate.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rates/{rate_gid}"
```

---
