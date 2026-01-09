---
created: 2026-01-09
tags: [type/api-reference, api/time-tracking-entries]
api_name: Asana
category: Time tracking entries
endpoint_count: 6
---

# Asana - Time Tracking Entries

[[README|Back to Overview]]

---

## GET /tasks/{task_gid}/time_tracking_entries

**Get time tracking entries for a task**

<b>Required scope: </b><code>time_tracking_entries:read</code>

Returns time tracking entries for a given task.

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
  "https://app.asana.com/api/1.0/tasks/{task_gid}/time_tracking_entries"
```

---

## POST /tasks/{task_gid}/time_tracking_entries

**Create a time tracking entry**

Creates a time tracking entry on a given task.

Returns the record of the newly created time tracking entry.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/tasks/{task_gid}/time_tracking_entries"
```

---

## GET /time_tracking_entries/{time_tracking_entry_gid}

**Get a time tracking entry**

<b>Required scope: </b><code>time_tracking_entries:read</code>

Returns the complete time tracking entry record for a single time tracking entry.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_tracking_entries/{time_tracking_entry_gid}"
```

---

## PUT /time_tracking_entries/{time_tracking_entry_gid}

**Update a time tracking entry**

A specific, existing time tracking entry can be updated by making a `PUT` request on
the URL for that time tracking entry. Only the fields provided in the `data` block
will be updated; any unspecified fields will remain unchanged.

When using this method, it is best to specify only those fields you wish
to change, or else you may overwrite changes made by another user since
you last retrieved the task.

Returns the complete updated time tracking entry record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_tracking_entries/{time_tracking_entry_gid}"
```

---

## DELETE /time_tracking_entries/{time_tracking_entry_gid}

**Delete a time tracking entry**

A specific, existing time tracking entry can be deleted by making a `DELETE` request on
the URL for that time tracking entry.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_tracking_entries/{time_tracking_entry_gid}"
```

---

## GET /time_tracking_entries

**Get multiple time tracking entries**

<b>Required scope: </b><code>time_tracking_entries:read</code>

Returns a list of time tracking entries filtered to a task, attributed project, portfolio or user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `task` | query | string | No | Globally unique identifier for the task to filter  |
| `attributable_to` | query | string | No | Globally unique identifier for the project the tim |
| `portfolio` | query | string | No | Globally unique identifier for the portfolio to fi |
| `user` | query | string | No | Globally unique identifier for the user to filter  |
| `workspace` | query | string | No | Globally unique identifier for the workspace. At l |
| `entered_on_start_date` | query | string | No | The start date for filtering time tracking entries |
| `entered_on_end_date` | query | string | No | The end date for filtering time tracking entries b |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/time_tracking_entries"
```

---
