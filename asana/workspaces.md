---
created: 2026-01-09
tags: [type/api-reference, api/workspaces]
api_name: Asana
category: Workspaces
endpoint_count: 6
---

# Asana - Workspaces

[[README|Back to Overview]]

---

## GET /workspaces

**Get multiple workspaces**

<b>Required scope: </b><code>workspaces:read</code>

Returns the compact records for all workspaces visible to the authorized user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces"
```

---

## GET /workspaces/{workspace_gid}

**Get a workspace**

<b>Required scope: </b><code>workspaces:read</code>

Returns the full workspace record for a single workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}"
```

---

## PUT /workspaces/{workspace_gid}

**Update a workspace**

A specific, existing workspace can be updated by making a PUT request on the URL for that workspace. Only the fields provided in the data block will be updated; any unspecified fields will remain unchanged.
Currently the only field that can be modified for a workspace is its name.
Returns the complete, updated workspace record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}"
```

---

## POST /workspaces/{workspace_gid}/addUser

**Add a user to a workspace or organization**

Add a user to a workspace or organization.
The user can be referenced by their globally unique user ID or their email address. Returns the full user record for the invited user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/addUser"
```

---

## POST /workspaces/{workspace_gid}/removeUser

**Remove a user from a workspace or organization**

Remove a user from a workspace or organization.

The user making this call must be an admin in the workspace. The user can
be referenced by their globally unique user ID or their email address.

When invoked using a **Service Account Token (SAT)**, this endpoint follows the same behavior as the
[SCIM API Delete endpoint](/docs/scim).
To learn more about how Asana handles user deprovisioning, refer to our
[Help Center article on deprovisioning users](https://help.asana.com/s/article/user-deprovisioning).

When invoked using a **Personal Access Token (PAT)**, the endpoint behaves similarly, except that
ownership of the user’s resources is transferred to the **PAT owner** instead of the admin
[specified in the Admin Console](https://help.asana.com/s/article/user-deprovisioning#gl-deprovisioning).

**Note:** If you wish to retain access to a user’s private resources
(i.e., those visible only to that user), you have to make them public manually
(or ask the user to do so) before removal.

Returns an empty data record.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/removeUser"
```

---

## GET /workspaces/{workspace_gid}/events

**Get workspace events**

Returns the full record for all events that have occurred since the sync token was created.
The response is a list of events and the schema of each event is as described [here](/reference/events).
Asana limits a single sync token to 1000 events. If more than 1000 events exist for a given domain, `has_more: true` will be returned in the response, indicating that there are more events to pull.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/events"
```

---
