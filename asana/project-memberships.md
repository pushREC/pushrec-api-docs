---
created: 2026-01-09
tags: [type/api-reference, api/project-memberships]
api_name: Asana
category: Project memberships
endpoint_count: 2
---

# Asana - Project Memberships

[[README|Back to Overview]]

---

## GET /project_memberships/{project_membership_gid}

**Get a project membership**

Returns the complete project record for a single project membership.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/project_memberships/{project_membership_gid}"
```

---

## GET /projects/{project_gid}/project_memberships

**Get memberships from a project**

Returns the compact project membership records for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/projects/{project_gid}/project_memberships"
```

---
