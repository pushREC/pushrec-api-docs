---
created: 2026-01-08
tags: [type/api-reference, api/access-groups]
api_name: Vercel API
category: access-groups
endpoint_count: 11
---

# Vercel API - Access-Groups

[[README|Back to Overview]]

---

## GET /v1/access-groups/{idOrName}

**Reads an access group**

Allows to read an access group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{idOrName}"
```

---

## POST /v1/access-groups/{idOrName}

**Update an access group**

Allows to update an access group metadata

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{idOrName}"
```

---

## DELETE /v1/access-groups/{idOrName}

**Deletes an access group**

Allows to delete an access group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{idOrName}"
```

---

## GET /v1/access-groups/{idOrName}/members

**List members of an access group**

List members of an access group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the Access Group. |
| `limit` | query | integer | No | Limit how many access group members should be retu |
| `next` | query | string | No | Continuation cursor to retrieve the next page of r |
| `search` | query | string | No | Search project members by their name, username, an |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{idOrName}/members"
```

---

## GET /v1/access-groups

**List access groups for a team, project or member**

List access groups

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | No | Filter access groups by project. |
| `search` | query | string | No | Search for access groups by name. |
| `membersLimit` | query | integer | No | Number of members to include in the response. |
| `projectsLimit` | query | integer | No | Number of projects to include in the response. |
| `limit` | query | integer | No | Limit how many access group should be returned. |
| `next` | query | string | No | Continuation cursor to retrieve the next page of r |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups"
```

---

## POST /v1/access-groups

**Creates an access group**

Allows to create an access group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups"
```

---

## GET /v1/access-groups/{idOrName}/projects

**List projects of an access group**

List projects of an access group

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the Access Group. |
| `limit` | query | integer | No | Limit how many access group projects should be ret |
| `next` | query | string | No | Continuation cursor to retrieve the next page of r |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{idOrName}/projects"
```

---

## POST /v1/access-groups/{accessGroupIdOrName}/projects

**Create an access group project**

Allows creation of an access group project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accessGroupIdOrName` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{accessGroupIdOrName}/projects"
```

---

## GET /v1/access-groups/{accessGroupIdOrName}/projects/{projectId}

**Reads an access group project**

Allows reading an access group project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accessGroupIdOrName` | path | string | Yes |  |
| `projectId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{accessGroupIdOrName}/projects/{projectId}"
```

---

## PATCH /v1/access-groups/{accessGroupIdOrName}/projects/{projectId}

**Update an access group project**

Allows update of an access group project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accessGroupIdOrName` | path | string | Yes |  |
| `projectId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{accessGroupIdOrName}/projects/{projectId}"
```

---

## DELETE /v1/access-groups/{accessGroupIdOrName}/projects/{projectId}

**Delete an access group project**

Allows deletion of an access group project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accessGroupIdOrName` | path | string | Yes |  |
| `projectId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/access-groups/{accessGroupIdOrName}/projects/{projectId}"
```

---
