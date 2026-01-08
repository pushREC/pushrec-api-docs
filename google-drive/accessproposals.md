---
created: 2026-01-08
tags: [type/api-reference, api/accessproposals]
api_name: Google Drive API
resource: accessproposals
method_count: 3
---

# Google Drive API - Accessproposals

[[README|Back to Overview]]

---

## GET accessproposals.get

**Retrieves an access proposal by ID. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals/{proposalId}`

### Required Scopes

- `drive`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | Required. The ID of the item the request is on. |
| `proposalId` | string | path | Yes | Required. The ID of the access proposal to resolve. |

### Response

Schema: `AccessProposal`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals/{proposalId}"
```

---

## GET accessproposals.list

**List the access proposals on a file. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access). Note: Only approvers are able to list access proposals on a file. If the user isn't an approver, a 403 error is returned.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals`

### Required Scopes

- `drive`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | Required. The ID of the item the request is on. |
| `pageSize` | integer | query | No | Optional. The number of results per page. |
| `pageToken` | string | query | No | Optional. The continuation token on the list of access reque... |

### Response

Schema: `ListAccessProposalsResponse`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals"
```

---

## POST accessproposals.resolve

**Approves or denies an access proposal. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals/{proposalId}:resolve`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | Required. The ID of the item the request is on. |
| `proposalId` | string | path | Yes | Required. The ID of the access proposal to resolve. |

### Request Body

Schema: `ResolveAccessProposalRequest`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/accessproposals/{proposalId}:resolve"
```

---
