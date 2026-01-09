---
created: 2026-01-09
tags: [type/api-reference, api/dynamic-modules]
api_name: The Jira Cloud platform REST API
category: Dynamic modules
endpoint_count: 3
---

# The Jira Cloud platform REST API - Dynamic Modules

[[README|Back to Overview]]

---

## DELETE /rest/atlassian-connect/1/app/module/dynamic

**Remove modules**

Remove all or a list of modules registered by the calling app.

**[Permissions](#permissions) required:** Only Connect apps can make this request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `moduleKey` | query | array | No | The key of the module to remove. To include multip |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/app/module/dynamic"
```

---

## GET /rest/atlassian-connect/1/app/module/dynamic

**Get modules**

Returns all modules registered dynamically by the calling app.

**[Permissions](#permissions) required:** Only Connect apps can make this request.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/app/module/dynamic"
```

---

## POST /rest/atlassian-connect/1/app/module/dynamic

**Register modules**

Registers a list of modules.

**[Permissions](#permissions) required:** Only Connect apps can make this request.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/app/module/dynamic"
```

---
