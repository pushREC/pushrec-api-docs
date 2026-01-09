---
created: 2026-01-09
tags: [type/api-reference, api/application-roles]
api_name: The Jira Cloud platform REST API
category: Application roles
endpoint_count: 2
---

# The Jira Cloud platform REST API - Application Roles

[[README|Back to Overview]]

---

## GET /rest/api/3/applicationrole

**Get all application roles**

Returns all application roles. In Jira, application roles are managed using the [Application access configuration](https://confluence.atlassian.com/x/3YxjL) page.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/applicationrole"
```

---

## GET /rest/api/3/applicationrole/{key}

**Get application role**

Returns an application role.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `key` | path | string | Yes | The key of the application role. Use the [Get all  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/applicationrole/{key}"
```

---
