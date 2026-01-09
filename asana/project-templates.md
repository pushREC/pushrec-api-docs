---
created: 2026-01-09
tags: [type/api-reference, api/project-templates]
api_name: Asana
category: Project templates
endpoint_count: 5
---

# Asana - Project Templates

[[README|Back to Overview]]

---

## GET /project_templates/{project_template_gid}

**Get a project template**

<b>Required scope: </b><code>project_templates:read</code>

Returns the complete project template record for a single project template.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_templates/{project_template_gid}"
```

---

## DELETE /project_templates/{project_template_gid}

**Delete a project template**

A specific, existing project template can be deleted by making a DELETE request on the URL for that project template.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_templates/{project_template_gid}"
```

---

## GET /project_templates

**Get multiple project templates**

<b>Required scope: </b><code>project_templates:read</code>

Returns the compact project template records for all project templates in the given team or workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_templates"
```

---

## GET /teams/{team_gid}/project_templates

**Get a team's project templates**

<b>Required scope: </b><code>project_templates:read</code>

Returns the compact project template records for all project templates in the team.

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
  "https://app.asana.com/api/1.0/teams/{team_gid}/project_templates"
```

---

## POST /project_templates/{project_template_gid}/instantiateProject

**Instantiate a project from a project template**

<b>Required scope: </b><code>projects:write</code>

Creates and returns a job that will asynchronously handle the project instantiation.

To form this request, it is recommended to first make a request to [get a project template](/reference/getprojecttemplate). Then, from the response, copy the `gid` from the object in the `requested_dates` array. This `gid` should be used in `requested_dates` to instantiate a project.

_Note: The body of this request will differ if your workspace is an organization. To determine if your workspace is an organization, use the [is_organization](/reference/workspaces) parameter._

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_templates/{project_template_gid}/instantiateProject"
```

---
