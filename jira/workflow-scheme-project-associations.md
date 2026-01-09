---
created: 2026-01-09
tags: [type/api-reference, api/workflow-scheme-project-associations]
api_name: The Jira Cloud platform REST API
category: Workflow scheme project associations
endpoint_count: 2
---

# The Jira Cloud platform REST API - Workflow Scheme Project Associations

[[README|Back to Overview]]

---

## GET /rest/api/3/workflowscheme/project

**Get workflow scheme project associations**

Returns a list of the workflow schemes associated with a list of projects. Each returned workflow scheme includes a list of the requested projects associated with it. Any team-managed or non-existent projects in the request are ignored and no errors are returned.

If the project is associated with the `Default Workflow Scheme` no ID is returned. This is because the way the `Default Workflow Scheme` is stored means it has no ID.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | array | Yes | The ID of a project to return the workflow schemes |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/project"
```

---

## PUT /rest/api/3/workflowscheme/project

**Assign workflow scheme to project**

Assigns a workflow scheme to a project. This operation is performed only when there are no issues in the project.

Workflow schemes can only be assigned to classic projects.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/project"
```

---
