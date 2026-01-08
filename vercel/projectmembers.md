---
created: 2026-01-08
tags: [type/api-reference, api/projectmembers]
api_name: Vercel API
category: projectMembers
endpoint_count: 3
---

# Vercel API - Projectmembers

[[README|Back to Overview]]

---

## GET /v1/projects/{idOrName}/members

**List project members**

Lists all members of a project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the Project. |
| `limit` | query | integer | No | Limit how many project members should be returned |
| `since` | query | integer | No | Timestamp in milliseconds to only include members  |
| `until` | query | integer | No | Timestamp in milliseconds to only include members  |
| `search` | query | string | No | Search project members by their name, username, an |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/members"
```

---

## POST /v1/projects/{idOrName}/members

**Adds a new member to a project.**

Adds a new member to the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the Project. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/members"
```

---

## DELETE /v1/projects/{idOrName}/members/{uid}

**Remove a Project Member**

Remove a member from a specific project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the Project. |
| `uid` | path | string | Yes | The user ID of the member. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/members/{uid}"
```

---
