---
created: 2026-01-09
tags: [type/api-reference, api/custom-types]
api_name: Asana
category: Custom types
endpoint_count: 2
---

# Asana - Custom Types

[[README|Back to Overview]]

---

## GET /custom_types

**Get all custom types associated with an object**

Returns a list of all of the custom types associated with an object. Currently, only projects are supported. Note that, as in all queries to collections which return compact representation, `opt_fields` can be used to include more data than is returned in the compact representation. See the [documentation for input/output options](https://developers.asana.com/docs/inputoutput-options) for more information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/custom_types"
```

---

## GET /custom_types/{custom_type_gid}

**Get a custom type**

Returns the complete custom type record for a single custom type.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/custom_types/{custom_type_gid}"
```

---
