---
created: 2026-01-09
tags: [type/api-reference, api/projects]
api_name: Asana
category: Projects
endpoint_count: 19
---

# Asana - Projects

[[README|Back to Overview]]

---

## GET /projects

**Get multiple projects**

<b>Required scope: </b><code>projects:read</code>

Returns the compact project records for some filtered set of projects. Use one or more of the parameters provided to filter the projects returned.
*Note: This endpoint may timeout for large domains. Try filtering by team!*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `workspace` | query | string | No | The workspace or organization to filter projects o |
| `team` | query | string | No | The team to filter projects on. |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects"
```

---

## POST /projects

**Create a project**

<b>Required scope: </b><code>projects:write</code>

Create a new project in a workspace or team.

Every project is required to be created in a specific workspace or
organization, and this cannot be changed once set. Note that you can use
the `workspace` parameter regardless of whether or not it is an
organization.

If the workspace for your project is an organization, you must also
supply a `team` to share the project with.

Returns the full record of the newly created project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects"
```

---

## GET /projects/{project_gid}

**Get a project**

<b>Required scope: </b><code>projects:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>custom_field_settings</code></td>
    <td><code>custom_fields:read</code></td>
  </tr>
  <tr>
    <td><code>team</code></td>
    <td><code>teams:read</code></td>
  </tr>
</table>

Returns the complete project record for a single project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}"
```

---

## PUT /projects/{project_gid}

**Update a project**

<b>Required scope: </b><code>projects:write</code>

A specific, existing project can be updated by making a PUT request on
the URL for that project. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated project record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}"
```

---

## DELETE /projects/{project_gid}

**Delete a project**

<b>Required scope: </b><code>projects:delete</code>

A specific, existing project can be deleted by making a DELETE request on
the URL for that project.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}"
```

---

## POST /projects/{project_gid}/duplicate

**Duplicate a project**

<b>Required scope: </b><code>projects:write</code>

Creates and returns a job that will asynchronously handle the duplication.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/duplicate"
```

---

## GET /tasks/{task_gid}/projects

**Get projects a task is in**

<b>Required scope: </b><code>projects:read</code>

Returns a compact representation of all of the projects the task is in.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/projects"
```

---

## GET /teams/{team_gid}/projects

**Get a team's projects**

<b>Required scope: </b><code>projects:read</code>

Returns the compact project records for all projects in the team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/projects"
```

---

## POST /teams/{team_gid}/projects

**Create a project in a team**

<b>Required scope: </b><code>projects:write</code>

Creates a project shared with the given team.

Returns the full record of the newly created project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/teams/{team_gid}/projects"
```

---

## GET /workspaces/{workspace_gid}/projects

**Get all projects in a workspace**

<b>Required scope: </b><code>projects:read</code>

Returns the compact project records for all projects in the workspace.
*Note: This endpoint may timeout for large domains. Prefer the `/teams/{team_gid}/projects` endpoint.*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects"
```

---

## POST /workspaces/{workspace_gid}/projects

**Create a project in a workspace**

<b>Required scope: </b><code>projects:write</code>

Creates a project in the workspace.

If the workspace for your project is an organization, you must also
supply a team to share the project with.

Returns the full record of the newly created project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/projects"
```

---

## POST /projects/{project_gid}/addCustomFieldSetting

**Add a custom field to a project**

<b>Required scope: </b><code>projects:write</code>

Custom fields are associated with projects by way of custom field settings.  This method creates a setting for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/addCustomFieldSetting"
```

---

## POST /projects/{project_gid}/removeCustomFieldSetting

**Remove a custom field from a project**

<b>Required scope: </b><code>projects:write</code>

Removes a custom field setting from a project.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/removeCustomFieldSetting"
```

---

## GET /projects/{project_gid}/task_counts

**Get task count of a project**

<b>Required scope: </b><code>projects:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>custom_field_settings</code></td>
    <td><code>custom_fields:read</code></td>
  </tr>
  <tr>
    <td><code>team</code></td>
    <td><code>teams:read</code></td>
  </tr>
</table>

Get an object that holds task count fields. **All fields are excluded by default**. You must [opt in](/docs/inputoutput-options) using `opt_fields` to get any information from this endpoint.

This endpoint has an additional [rate limit](/docs/rate-limits) and each field counts especially high against our [cost limits](/docs/rate-limits#cost-limits).

Milestones are just tasks, so they are included in the `num_tasks`, `num_incomplete_tasks`, and `num_completed_tasks` counts.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/task_counts"
```

---

## POST /projects/{project_gid}/addMembers

**Add users to a project**

Adds the specified list of users as members of the project. Note that a user being added as a member may also be added as a *follower* as a result of this operation. This is because the user's default notification settings (i.e., in the "Notifications" tab of "My Profile Settings") will override this endpoint's default behavior of setting "Tasks added" notifications to `false`.
Returns the updated project record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/addMembers"
```

---

## POST /projects/{project_gid}/removeMembers

**Remove users from a project**

Removes the specified list of users from members of the project.
Returns the updated project record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/removeMembers"
```

---

## POST /projects/{project_gid}/addFollowers

**Add followers to a project**

Adds the specified list of users as followers to the project. Followers are a subset of members who have opted in to receive "tasks added" notifications for a project. Therefore, if the users are not already members of the project, they will also become members as a result of this operation.
Returns the updated project record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/addFollowers"
```

---

## POST /projects/{project_gid}/removeFollowers

**Remove followers from a project**

Removes the specified list of users from following the project, this will not affect project membership status.
Returns the updated project record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/removeFollowers"
```

---

## POST /projects/{project_gid}/saveAsTemplate

**Create a project template from a project**

Creates and returns a job that will asynchronously handle the project template creation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/saveAsTemplate"
```

---
