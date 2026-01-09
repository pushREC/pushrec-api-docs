---
created: 2026-01-09
tags: [type/api-reference, api/organization-exports]
api_name: Asana
category: Organization exports
endpoint_count: 2
---

# Asana - Organization Exports

[[README|Back to Overview]]

---

## POST /organization_exports

**Create an organization export request**

This method creates a request to export an Organization. Asana will complete the export at some point after you create the request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/organization_exports"
```

---

## GET /organization_exports/{organization_export_gid}

**Get details on an org export request**

Returns details of a previously-requested Organization export.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/organization_exports/{organization_export_gid}"
```

---
