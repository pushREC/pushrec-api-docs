---
created: 2026-01-09
tags: [type/api-reference, api/app-migration]
api_name: The Jira Cloud platform REST API
category: App migration
endpoint_count: 3
---

# The Jira Cloud platform REST API - App Migration

[[README|Back to Overview]]

---

## PUT /rest/atlassian-connect/1/migration/field

**Bulk update custom field value**

Updates the value of a custom field added by Connect apps on one or more issues.
The values of up to 200 custom fields can be updated.

**[Permissions](#permissions) required:** Only Connect apps can make this request

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Atlassian-Transfer-Id` | header | string | Yes | The ID of the transfer. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/migration/field"
```

---

## PUT /rest/atlassian-connect/1/migration/properties/{entityType}

**Bulk update entity properties**

Updates the values of multiple entity properties for an object, up to 50 updates per request. This operation is for use by Connect apps during app migration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Atlassian-Transfer-Id` | header | string | Yes | The app migration transfer ID. |
| `entityType` | path | string | Yes | The type indicating the object that contains the e |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/migration/properties/{entityType}"
```

---

## POST /rest/atlassian-connect/1/migration/workflow/rule/search

**Get workflow transition rule configurations**

Returns configurations for workflow transition rules migrated from server to cloud and owned by the calling Connect app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Atlassian-Transfer-Id` | header | string | Yes | The app migration transfer ID. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/migration/workflow/rule/search"
```

---
