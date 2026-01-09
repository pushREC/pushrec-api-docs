---
created: 2026-01-09
tags: [type/api-reference, api/goals]
api_name: Asana
category: Goals
endpoint_count: 12
---

# Asana - Goals

[[README|Back to Overview]]

---

## GET /goals/{goal_gid}

**Get a goal**

<b>Required scope: </b><code>goals:read</code>

<table>
  <tr>
    <th>Field</th>
    <th>Required Scope</th>
  </tr>
  <tr>
    <td><code>time_period</code></td>
    <td><code>time_periods:read</code></td>
  </tr>
  <tr>
    <td><code>custom_field_settings</code></td>
    <td><code>custom_fields:read</code></td>
  </tr>
</table>

Returns the complete goal record for a single goal.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}"
```

---

## PUT /goals/{goal_gid}

**Update a goal**

An existing goal can be updated by making a PUT request on the URL for
that goal. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated goal record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}"
```

---

## DELETE /goals/{goal_gid}

**Delete a goal**

A specific, existing goal can be deleted by making a DELETE request on the URL for that goal.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}"
```

---

## GET /goals

**Get goals**

<b>Required scope: </b><code>goals:read</code>

Returns compact goal records.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `portfolio` | query | string | No | Globally unique identifier for supporting portfoli |
| `project` | query | string | No | Globally unique identifier for supporting project. |
| `task` | query | string | No | Globally unique identifier for supporting task. |
| `is_workspace_level` | query | boolean | No | Filter to goals with is_workspace_level set to que |
| `team` | query | string | No | Globally unique identifier for the team. |
| `workspace` | query | string | No | Globally unique identifier for the workspace. |
| `time_periods` | query | array | No | Globally unique identifiers for the time periods. |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals"
```

---

## POST /goals

**Create a goal**

Creates a new goal in a workspace or team.

Returns the full record of the newly created goal.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals"
```

---

## POST /goals/{goal_gid}/setMetric

**Create a goal metric**

Creates and adds a goal metric to a specified goal. Note that this replaces an existing goal metric if one already exists.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/setMetric"
```

---

## POST /goals/{goal_gid}/setMetricCurrentValue

**Update a goal metric**

Updates a goal's existing metric's `current_number_value` if one exists,
otherwise responds with a 400 status code.

Returns the complete updated goal metric record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/setMetricCurrentValue"
```

---

## POST /goals/{goal_gid}/addFollowers

**Add a collaborator to a goal**

Adds followers to a goal. Returns the goal the followers were added to.
Each goal can be associated with zero or more followers in the system.
Requests to add/remove followers, if successful, will return the complete updated goal record, described above.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/addFollowers"
```

---

## POST /goals/{goal_gid}/removeFollowers

**Remove a collaborator from a goal**

Removes followers from a goal. Returns the goal the followers were removed from.
Each goal can be associated with zero or more followers in the system.
Requests to add/remove followers, if successful, will return the complete updated goal record, described above.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/removeFollowers"
```

---

## GET /goals/{goal_gid}/parentGoals

**Get parent goals from a goal**

<b>Required scope: </b><code>goals:read</code>

Returns a compact representation of all of the parent goals of a goal.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/parentGoals"
```

---

## POST /goals/{goal_gid}/addCustomFieldSetting

**Add a custom field to a goal**

<b>Required scope: </b><code>goals:write</code>

Custom fields are associated with goals by way of custom field settings.  This method creates a setting for the goal.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/addCustomFieldSetting"
```

---

## POST /goals/{goal_gid}/removeCustomFieldSetting

**Remove a custom field from a goal**

<b>Required scope: </b><code>goals:write</code>

Removes a custom field setting from a goal.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/goals/{goal_gid}/removeCustomFieldSetting"
```

---
