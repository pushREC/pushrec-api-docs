---
created: 2026-01-09
tags: [type/api-reference, api/workflow-statuses]
api_name: The Jira Cloud platform REST API
category: Workflow statuses
endpoint_count: 2
---

# The Jira Cloud platform REST API - Workflow Statuses

[[README|Back to Overview]]

---

## GET /rest/api/3/status

**Get all statuses**

Returns a list of all statuses associated with active workflows.

This operation can be accessed anonymously.

[Permissions](#permissions) required: *Browse projects* [project permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-permissions/) for the project.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/status"
```

---

## GET /rest/api/3/status/{idOrName}

**Get status**

Returns a status. The status must be associated with an active workflow to be returned.

If a name is used on more than one status, only the status found first is returned. Therefore, identifying the status by its ID may be preferable.

This operation can be accessed anonymously.

[Permissions](#permissions) required: *Browse projects* [project permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-permissions/) for the project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The ID or name of the status. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/status/{idOrName}"
```

---
