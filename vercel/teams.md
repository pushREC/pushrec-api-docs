---
created: 2026-01-08
tags: [type/api-reference, api/teams]
api_name: Vercel API
category: teams
endpoint_count: 14
---

# Vercel API - Teams

[[README|Back to Overview]]

---

## GET /v3/teams/{teamId}/members

**List team members**

Get a paginated list of team members for the provided team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | number | No | Limit how many teams should be returned |
| `since` | query | number | No | Timestamp in milliseconds to only include members  |
| `until` | query | number | No | Timestamp in milliseconds to only include members  |
| `search` | query | string | No | Search team members by their name, username, and e |
| `role` | query | string | No | Only return members with the specified team role. |
| `excludeProject` | query | string | No | Exclude members who belong to the specified projec |
| `eligibleMembersForProjectId` | query | string | No | Include team members who are eligible to be member |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v3/teams/{teamId}/members"
```

---

## POST /v2/teams/{teamId}/members

**Invite a user**

Invite a user to join the team specified in the URL. The authenticated user needs to be an `OWNER` in order to successfully invoke this endpoint. The user to be invited must be specified by email.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/teams/{teamId}/members"
```

---

## POST /v1/teams/{teamId}/request

**Request access to a team**

Request access to a team as a member. An owner has to approve the request. Only 10 users can request access to a team at the same time.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/request"
```

---

## GET /v1/teams/{teamId}/request/{userId}

**Get access request status**

Check the status of a join request. It'll respond with a 404 if the request has been declined. If no `userId` path segment was provided, this endpoint will instead return the status of the authenticated user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `userId` | path | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/request/{userId}"
```

---

## POST /v1/teams/{teamId}/members/teams/join

**Join a team**

Join a team with a provided invite code or team ID.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/members/teams/join"
```

---

## PATCH /v1/teams/{teamId}/members/{uid}

**Update a Team Member**

Update the membership of a Team Member on the Team specified by `teamId`, such as changing the _role_ of the member, or confirming a request to join the Team for an unconfirmed member. The authenticated user must be an `OWNER` of the Team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uid` | path | string | Yes | The ID of the member. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/members/{uid}"
```

---

## DELETE /v1/teams/{teamId}/members/{uid}

**Remove a Team Member**

Remove a Team Member from the Team, or dismiss a user that requested access, or leave a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uid` | path | string | Yes | The user ID of the member. |
| `newDefaultTeamId` | query | string | No | The ID of the team to set as the new default team  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/members/{uid}"
```

---

## GET /v2/teams/{teamId}

**Get a Team**

Get information for the Team specified by the `teamId` parameter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `slug` | query | string | No |  |
| `teamId` | path | string | No | The Team identifier to perform the request on beha |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/teams/{teamId}"
```

---

## PATCH /v2/teams/{teamId}

**Update a Team**

Update the information of a Team specified by the `teamId` parameter. The request body should contain the information that will be updated on the Team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | path | string | Yes | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/teams/{teamId}"
```

---

## GET /v2/teams

**List all teams**

Get a paginated list of all the Teams the authenticated User is a member of.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `limit` | query | number | No | Maximum number of Teams which may be returned. |
| `since` | query | number | No | Timestamp (in milliseconds) to only include Teams  |
| `until` | query | number | No | Timestamp (in milliseconds) to only include Teams  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/teams"
```

---

## POST /v1/teams

**Create a Team**

Create a new Team under your account. You need to send a POST request with the desired Team slug, and optionally the Team name.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams"
```

---

## POST /v1/teams/{teamId}/dsync-roles

**Update Team Directory Sync Role Mappings**

Update the Directory Sync role mappings for a Team. This endpoint allows updating the mapping between directory groups and team roles or access groups.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | path | string | Yes | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/dsync-roles"
```

---

## DELETE /v1/teams/{teamId}

**Delete a Team**

Delete a team under your account. You need to send a `DELETE` request with the desired team `id`. An optional array of reasons for deletion may also be sent.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `newDefaultTeamId` | query | string | No | Id of the team to be set as the new default team |
| `teamId` | path | string | Yes | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}"
```

---

## DELETE /v1/teams/{teamId}/invites/{inviteId}

**Delete a Team invite code**

Delete an active Team invite code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `inviteId` | path | string | Yes | The Team invite code ID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/teams/{teamId}/invites/{inviteId}"
```

---
