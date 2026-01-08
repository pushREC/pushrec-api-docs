---
created: 2026-01-08
tags: [type/api-reference, api/approvals]
api_name: Google Drive API
resource: approvals
method_count: 2
---

# Google Drive API - Approvals

[[README|Back to Overview]]

---

## GET approvals.get

**Gets an Approval by ID.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/approvals/{approvalId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `approvalId` | string | path | Yes | Required. The ID of the Approval. |
| `fileId` | string | path | Yes | Required. The ID of the file the Approval is on. |

### Response

Schema: `Approval`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/approvals/{approvalId}"
```

---

## GET approvals.list

**Lists the Approvals on a file.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/approvals`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | Required. The ID of the file the Approval is on. |
| `pageSize` | integer | query | No | The maximum number of Approvals to return. When not set, at ... |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |

### Response

Schema: `ApprovalList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/approvals"
```

---
