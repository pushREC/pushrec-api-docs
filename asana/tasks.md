---
created: 2026-01-09
tags: [type/api-reference, api/tasks]
api_name: Asana
category: Tasks
endpoint_count: 27
---

# Asana - Tasks

[[README|Back to Overview]]

---

## GET /tasks

**Get multiple tasks**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact task records for some filtered set of tasks. Use one or more of the parameters provided to filter the tasks returned. You must specify a `project` or `tag` if you do not specify `assignee` and `workspace`.

For more complex task retrieval, use [workspaces/{workspace_gid}/tasks/search](/reference/searchtasksforworkspace).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `assignee` | query | string | No | The assignee to filter tasks on. If searching for  |
| `project` | query | string | No | The project to filter tasks on. |
| `section` | query | string | No | The section to filter tasks on. |
| `workspace` | query | string | No | The workspace to filter tasks on.
*Note: If you sp |
| `completed_since` | query | string | No | Only return tasks that are either incomplete or th |
| `modified_since` | query | string | No | Only return tasks that have been modified since th |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks"
```

---

## POST /tasks

**Create a task**

<b>Required scope: </b><code>tasks:write</code>

Creating a new task is as easy as POSTing to the `/tasks` endpoint with a
data block containing the fields you’d like to set on the task. Any
unspecified fields will take on default values.

Every task is required to be created in a specific workspace, and this
workspace cannot be changed once set. The workspace need not be set
explicitly if you specify `projects` or a `parent` task instead.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks"
```

---

## GET /tasks/{task_gid}

**Get a task**

<b>Required scope: </b><code>tasks:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>memberships</code></td>
    <td><code>projects:read</code>, <code>project_sections:read</code></td>
  </tr>
  <tr>
    <td><code>actual_time_minutes</code></td>
    <td><code>time_tracking_entries:read</code></td>
  </tr>
</table>

Returns the complete task record for a single task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}"
```

---

## PUT /tasks/{task_gid}

**Update a task**

<b>Required scope: </b><code>tasks:write</code>

A specific, existing task can be updated by making a PUT request on the
URL for that task. Only the fields provided in the `data` block will be
updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated task record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}"
```

---

## DELETE /tasks/{task_gid}

**Delete a task**

<b>Required scope: </b><code>tasks:delete</code>

A specific, existing task can be deleted by making a DELETE request on
the URL for that task. Deleted tasks go into the “trash” of the user
making the delete request. Tasks can be recovered from the trash within a
period of 30 days; afterward they are completely removed from the system.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}"
```

---

## POST /tasks/{task_gid}/duplicate

**Duplicate a task**

<b>Required scope: </b><code>tasks:write</code>

Creates and returns a job that will asynchronously handle the duplication.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/duplicate"
```

---

## GET /projects/{project_gid}/tasks

**Get tasks from a project**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact task records for all tasks within the given project, ordered by their priority within the project. Tasks can exist in more than one project at a time.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/tasks"
```

---

## GET /sections/{section_gid}/tasks

**Get tasks from a section**

<b>Required scope: </b><code>tasks:read</code>

*Board view only*: Returns the compact section records for all tasks within the given section.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/sections/{section_gid}/tasks"
```

---

## GET /tags/{tag_gid}/tasks

**Get tasks from a tag**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact task records for all tasks with the given tag. Tasks can have more than one tag at a time.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tags/{tag_gid}/tasks"
```

---

## GET /user_task_lists/{user_task_list_gid}/tasks

**Get tasks from a user task list**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact list of tasks in a user’s My Tasks list.
*Note: Access control is enforced for this endpoint as with all Asana API endpoints, meaning a user’s private tasks will be filtered out if the API-authenticated user does not have access to them.*
*Note: Both complete and incomplete tasks are returned by default unless they are filtered out (for example, setting `completed_since=now` will return only incomplete tasks, which is the default view for “My Tasks” in Asana.)*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/user_task_lists/{user_task_list_gid}/tasks"
```

---

## GET /tasks/{task_gid}/subtasks

**Get subtasks from a task**

<b>Required scope: </b><code>tasks:read</code>

Returns a compact representation of all of the subtasks of a task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks"
```

---

## POST /tasks/{task_gid}/subtasks

**Create a subtask**

<b>Required scope: </b><code>tasks:write</code>

Creates a new subtask and adds it to the parent task. Returns the full record for the newly created subtask.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/subtasks"
```

---

## POST /tasks/{task_gid}/setParent

**Set the parent of a task**

<b>Required scope: </b><code>tasks:write</code>

Updates the parent of a given task. This endpoint can be used to make a task a subtask of another task, or to remove its existing parent.
When using `insert_before` and `insert_after`, at most one of those two options can be specified, and they must already be subtasks of the parent.
Returns the complete, updated record of the affected [task](/reference/tasks#/task).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/setParent"
```

---

## GET /tasks/{task_gid}/dependencies

**Get dependencies from a task**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact representations of all of the dependencies of a task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/dependencies"
```

---

## POST /tasks/{task_gid}/addDependencies

**Set dependencies for a task**

<b>Required scope: </b><code>tasks:write</code>

Marks a set of tasks as dependencies of this task, if they are not already dependencies. *A task can have at most 30 dependents and dependencies combined*.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/addDependencies"
```

---

## POST /tasks/{task_gid}/removeDependencies

**Unlink dependencies from a task**

<b>Required scope: </b><code>tasks:write</code>

Unlinks a set of dependencies from this task.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependencies"
```

---

## GET /tasks/{task_gid}/dependents

**Get dependents from a task**

<b>Required scope: </b><code>tasks:read</code>

Returns the compact representations of all of the dependents of a task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/dependents"
```

---

## POST /tasks/{task_gid}/addDependents

**Set dependents for a task**

<b>Required scope: </b><code>tasks:write</code>

Marks a set of tasks as dependents of this task, if they are not already dependents. *A task can have at most 30 dependents and dependencies combined*.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/addDependents"
```

---

## POST /tasks/{task_gid}/removeDependents

**Unlink dependents from a task**

<b>Required scope: </b><code>tasks:write</code>

Unlinks a set of dependents from this task.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/removeDependents"
```

---

## POST /tasks/{task_gid}/addProject

**Add a project to a task**

<b>Required scope: </b><code>tasks:write</code>

Adds the task to the specified project, in the optional location
specified. If no location arguments are given, the task will be added to
the end of the project.

`addProject` can also be used to reorder a task within a project or
section that already contains it.

**Positioning the task:**
- Use `insert_before` or `insert_after` with a task ID to position relative to another task
- Use `section` alone to add the task to the end of a section
- Use `section` with `insert_after: null` to add to the **beginning** of a section
- Use `section` with `insert_before: null` to add to the **end** of a section
- Use `section` with `insert_before` or `insert_after` (non-null) to position relative to a task within that section. The anchor task must be in the specified section.

At most one of `insert_before` or `insert_after` should be specified (both cannot be used together).

A task can have at most 20 projects multi-homed to it.

Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/addProject"
```

---

## POST /tasks/{task_gid}/removeProject

**Remove a project from a task**

<b>Required scope: </b><code>tasks:write</code>

Removes the task from the specified project. The task will still exist in
the system, but it will not be in the project anymore.

Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/removeProject"
```

---

## POST /tasks/{task_gid}/addTag

**Add a tag to a task**

<b>Required scope: </b><code>tasks:write</code>

Adds a tag to a task. Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/addTag"
```

---

## POST /tasks/{task_gid}/removeTag

**Remove a tag from a task**

<b>Required scope: </b><code>tasks:write</code>

Removes a tag from a task. Returns an empty data block.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/removeTag"
```

---

## POST /tasks/{task_gid}/addFollowers

**Add followers to a task**

<b>Required scope: </b><code>tasks:write</code>

Adds followers to a task. Returns an empty data block.
Each task can be associated with zero or more followers in the system.
Requests to add/remove followers, if successful, will return the complete updated task record, described above.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/addFollowers"
```

---

## POST /tasks/{task_gid}/removeFollowers

**Remove followers from a task**

<b>Required scope: </b><code>tasks:write</code>

Removes each of the specified followers from the task if they are following. Returns the complete, updated record for the affected task.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/removeFollowers"
```

---

## GET /workspaces/{workspace_gid}/tasks/custom_id/{custom_id}

**Get a task for a given custom ID**

<b>Required scope: </b><code>tasks:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>memberships</code></td>
    <td><code>projects:read</code>, <code>project_sections:read</code></td>
  </tr>
  <tr>
    <td><code>actual_time_minutes</code></td>
    <td><code>time_tracking_entries:read</code></td>
  </tr>
</table>

Returns a task given a custom ID shortcode.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/custom_id/{custom_id}"
```

---

## GET /workspaces/{workspace_gid}/tasks/search

**Search tasks in a workspace**

<b>Required scope: </b><code>tasks:read</code>

To mirror the functionality of the Asana web app's advanced search feature, the Asana API has a task search endpoint that allows you to build complex filters to find and retrieve the exact data you need.
#### Premium access
Like the Asana web product's advance search feature, this search endpoint will only be available to premium Asana users. A user is premium if any of the following is true:

- The workspace in which the search is being performed is a premium workspace - The user is a member of a premium team inside the workspace

Even if a user is only a member of a premium team inside a non-premium workspace, search will allow them to find data anywhere in the workspace, not just inside the premium team. Making a search request using credentials of a non-premium user will result in a `402 Payment Required` error.
#### Pagination
Search results are not stable; repeating the same query multiple times may return the data in a different order, even if the data do not change. Because of this, the traditional [pagination](https://developers.asana.com/docs/#pagination) available elsewhere in the Asana API is not available here. However, you can paginate manually by sorting the search results by their creation time and then modifying each subsequent query to exclude data you have already seen. Page sizes are limited to a maximum of 100 items, and can be specified by the `limit` query parameter.
#### Eventual consistency
Changes in Asana (regardless of whether they’re made though the web product or the API) are forwarded to our search infrastructure to be indexed. This process can take between 10 and 60 seconds to complete under normal operation, and longer during some production incidents. Making a change to a task that would alter its presence in a particular search query will not be reflected immediately. This is also true of the advanced search feature in the web product.
#### Rate limits
You may receive a `429 Too Many Requests` response if you hit any of our [rate limits](https://developers.asana.com/docs/#rate-limits).
#### Custom field parameters
| Parameter name | Custom field type | Accepted type |
|---|---|---|
| custom_fields.{gid}.is_set | All | Boolean |
| custom_fields.{gid}.value | Text | String |
| custom_fields.{gid}.value | Number | Number |
| custom_fields.{gid}.value | Enum | Enum option ID |
| custom_fields.{gid}.starts_with | Text only | String |
| custom_fields.{gid}.ends_with | Text only | String |
| custom_fields.{gid}.contains | Text only | String |
| custom_fields.{gid}.less_than | Number only | Number |
| custom_fields.{gid}.greater_than | Number only | Number |


For example, if the gid of the custom field is 12345, these query parameter to find tasks where it is set would be `custom_fields.12345.is_set=true`. To match an exact value for an enum custom field, use the gid of the desired enum option and not the name of the enum option: `custom_fields.12345.value=67890`.

**Not Supported**: searching for multiple exact matches of a custom field, searching for multi-enum custom field

*Note: If you specify `projects.any` and `sections.any`, you will receive tasks for the project **and** tasks for the section. If you're looking for only tasks in a section, omit the `projects.any` from the request.*

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/workspaces/{workspace_gid}/tasks/search"
```

---
