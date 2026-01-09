---
created: 2026-01-09
tags: [type/api-reference, api/project-classification-levels]
api_name: The Jira Cloud platform REST API
category: Project classification levels
endpoint_count: 3
---

# The Jira Cloud platform REST API - Project Classification Levels

[[README|Back to Overview]]

---

## DELETE /rest/api/3/project/{projectIdOrKey}/classification-level/default

**Remove the default data classification level from a project**

Remove the default data classification level for a project.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  *Administer jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case-sensitive). |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/classification-level/default"
```

---

## GET /rest/api/3/project/{projectIdOrKey}/classification-level/default

**Get the default data classification level of a project**

Returns the default data classification for a project.

**[Permissions](#permissions) required:**

 *  *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  *Administer jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case-sensitive). |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/classification-level/default"
```

---

## PUT /rest/api/3/project/{projectIdOrKey}/classification-level/default

**Update the default data classification level of a project**

Updates the default data classification level for a project.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  *Administer jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectIdOrKey` | path | string | Yes | The project ID or project key (case-sensitive). |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/classification-level/default"
```

---
