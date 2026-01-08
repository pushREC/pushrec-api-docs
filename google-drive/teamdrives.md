---
created: 2026-01-08
tags: [type/api-reference, api/teamdrives]
api_name: Google Drive API
resource: teamdrives
method_count: 5
---

# Google Drive API - Teamdrives

[[README|Back to Overview]]

---

## POST teamdrives.create

**Deprecated: Use `drives.create` instead.**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/teamdrives`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `requestId` | string | query | Yes | Required. An ID, such as a random UUID, which uniquely ident... |

### Request Body

Schema: `TeamDrive`

### Response

Schema: `TeamDrive`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/teamdrives"
```

---

## DELETE teamdrives.delete

**Deprecated: Use `drives.delete` instead.**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `teamDriveId` | string | path | Yes | The ID of the Team Drive |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}"
```

---

## GET teamdrives.get

**Deprecated: Use `drives.get` instead.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}`

### Required Scopes

- `drive`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `teamDriveId` | string | path | Yes | The ID of the Team Drive |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Response

Schema: `TeamDrive`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}"
```

---

## GET teamdrives.list

**Deprecated: Use `drives.list` instead.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/teamdrives`

### Required Scopes

- `drive`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `pageSize` | integer | query | No | Maximum number of Team Drives to return. |
| `pageToken` | string | query | No | Page token for Team Drives. |
| `q` | string | query | No | Query string for searching Team Drives. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Response

Schema: `TeamDriveList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/teamdrives"
```

---

## PATCH teamdrives.update

**Deprecated: Use `drives.update` instead.**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `teamDriveId` | string | path | Yes | The ID of the Team Drive |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Request Body

Schema: `TeamDrive`

### Response

Schema: `TeamDrive`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/teamdrives/{teamDriveId}"
```

---
