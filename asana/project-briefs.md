---
created: 2026-01-09
tags: [type/api-reference, api/project-briefs]
api_name: Asana
category: Project briefs
endpoint_count: 4
---

# Asana - Project Briefs

[[README|Back to Overview]]

---

## GET /project_briefs/{project_brief_gid}

**Get a project brief**

Get the full record for a project brief.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_briefs/{project_brief_gid}"
```

---

## PUT /project_briefs/{project_brief_gid}

**Update a project brief**

An existing project brief can be updated by making a PUT request on the URL for
that project brief. Only the fields provided in the `data` block will be updated;
any unspecified fields will remain unchanged.

Returns the complete updated project brief record.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_briefs/{project_brief_gid}"
```

---

## DELETE /project_briefs/{project_brief_gid}

**Delete a project brief**

Deletes a specific, existing project brief.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_briefs/{project_brief_gid}"
```

---

## POST /projects/{project_gid}/project_briefs

**Create a project brief**

Creates a new project brief.

Returns the full record of the newly created project brief.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/project_briefs"
```

---
