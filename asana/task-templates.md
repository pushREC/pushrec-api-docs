---
created: 2026-01-09
tags: [type/api-reference, api/task-templates]
api_name: Asana
category: Task templates
endpoint_count: 4
---

# Asana - Task Templates

[[README|Back to Overview]]

---

## GET /task_templates

**Get multiple task templates**

<b>Required scope: </b><code>task_templates:read</code>

Returns the compact task template records for some filtered set of task templates. You must specify a `project`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `project` | query | string | No | The project to filter task templates on. |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/task_templates"
```

---

## GET /task_templates/{task_template_gid}

**Get a task template**

<b>Required scope: </b><code>task_templates:read</code>

Returns the complete task template record for a single task template.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/task_templates/{task_template_gid}"
```

---

## DELETE /task_templates/{task_template_gid}

**Delete a task template**

A specific, existing task template can be deleted by making a DELETE request on the URL for that task template. Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/task_templates/{task_template_gid}"
```

---

## POST /task_templates/{task_template_gid}/instantiateTask

**Instantiate a task from a task template**

Creates and returns a job that will asynchronously handle the task instantiation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/task_templates/{task_template_gid}/instantiateTask"
```

---
