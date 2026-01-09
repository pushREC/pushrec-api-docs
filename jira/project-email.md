---
created: 2026-01-09
tags: [type/api-reference, api/project-email]
api_name: The Jira Cloud platform REST API
category: Project email
endpoint_count: 2
---

# The Jira Cloud platform REST API - Project Email

[[README|Back to Overview]]

---

## GET /rest/api/3/project/{projectId}/email

**Get project's sender email**

Returns the [project's sender email address](https://confluence.atlassian.com/x/dolKLg).

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | integer | Yes | The project ID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectId}/email"
```

---

## PUT /rest/api/3/project/{projectId}/email

**Set project's sender email**

Sets the [project's sender email address](https://confluence.atlassian.com/x/dolKLg).

If `emailAddress` is an empty string, the default email address is restored.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | path | integer | Yes | The project ID. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/project/{projectId}/email"
```

---
