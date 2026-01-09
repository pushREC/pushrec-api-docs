---
created: 2026-01-09
tags: [type/api-reference, api/migration-of-connect-modules-to-forge]
api_name: The Jira Cloud platform REST API
category: Migration of Connect modules to Forge
endpoint_count: 1
---

# The Jira Cloud platform REST API - Migration Of Connect Modules To Forge

[[README|Back to Overview]]

---

## GET /rest/atlassian-connect/1/migration/{connectKey}/{jiraIssueFieldsKey}/task

**Get Connect issue field migration task**

Returns the details of a Connect issue field's migration to Forge.

When migrating a Connect app to Forge, [Issue Field](https://developer.atlassian.com/cloud/jira/software/modules/issue-field/) modules
must be converted to [Custom field](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/). When the
Forge version of the app is installed, Forge creates a
[background task](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-tasks/#api-group-tasks) to track the
migration of field data across. This endpoint returns the status and other details of that background task.

For more details, see
[Jira modules > Jira Custom Fields](https://developer.atlassian.com/platform/adopting-forge-from-connect/migrate-jira-custom-fields/).

**[Permissions](#permissions) required:** Only Connect and Forge apps can make this request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `connectKey` | path | string | Yes | The key of the Connect app that contains the Jira  |
| `jiraIssueFieldsKey` | path | string | Yes | The module key of the Connect issue field being mi |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/migration/{connectKey}/{jiraIssueFieldsKey}/task"
```

---
