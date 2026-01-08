---
created: 2026-01-08
tags: [type/api-reference, api/operations]
api_name: Google Drive API
resource: operations
method_count: 1
---

# Google Drive API - Operations

[[README|Back to Overview]]

---

## GET operations.get

**Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/operations/{name}`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `name` | string | path | Yes | The name of the operation resource. |

### Response

Schema: `Operation`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/operations/{name}"
```

---
