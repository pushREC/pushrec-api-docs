---
created: 2026-01-09
tags: [type/api-reference, api/workflow-schemes]
api_name: The Jira Cloud platform REST API
category: Workflow schemes
endpoint_count: 19
---

# The Jira Cloud platform REST API - Workflow Schemes

[[README|Back to Overview]]

---

## GET /rest/api/3/workflowscheme

**Get all workflow schemes**

Returns a [paginated](#pagination) list of all workflow schemes, not including draft workflow schemes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme"
```

---

## POST /rest/api/3/workflowscheme

**Create workflow scheme**

Creates a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme"
```

---

## POST /rest/api/3/workflowscheme/project/switch

**Switch workflow scheme for project**

Switches a workflow scheme for a project.

Workflow schemes can only be assigned to classic projects.

**Calculating required mappings:** If statuses from the current workflow scheme won't exist in the target workflow scheme, you must provide `mappingsByIssueTypeOverride` to specify how issues with those statuses should be migrated. Use [the required workflow scheme mappings API](#api-rest-api-3-workflowscheme-update-mappings-post) to determine which statuses and issue types require mappings.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/project/switch"
```

---

## POST /rest/api/3/workflowscheme/read

**Bulk get workflow schemes**

Returns a list of workflow schemes by providing workflow scheme IDs or project IDs.

**[Permissions](#permissions) required:**

 *  *Administer Jira* global permission to access all, including project-scoped, workflow schemes
 *  *Administer projects* project permissions to access project-scoped workflow schemes

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/read"
```

---

## POST /rest/api/3/workflowscheme/update

**Update workflow scheme**

Updates company-managed and team-managed project workflow schemes. This API doesn't have a concept of draft, so any changes made to a workflow scheme are immediately available. When changing the available statuses for issue types, an [asynchronous task](#async) migrates the issues as defined in the provided mappings.

**[Permissions](#permissions) required:**

 *  *Administer Jira* project permission to update all, including global-scoped, workflow schemes.
 *  *Administer projects* project permission to update project-scoped workflow schemes.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/update"
```

---

## POST /rest/api/3/workflowscheme/update/mappings

**Get required status mappings for workflow scheme update**

Gets the required status mappings for the desired changes to a workflow scheme. The results are provided per issue type and workflow. When updating a workflow scheme, status mappings can be provided per issue type, per workflow, or both.

**[Permissions](#permissions) required:**

 *  *Administer Jira* permission to update all, including global-scoped, workflow schemes.
 *  *Administer projects* project permission to update project-scoped workflow schemes.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/update/mappings"
```

---

## DELETE /rest/api/3/workflowscheme/{id}

**Delete workflow scheme**

Deletes a workflow scheme. Note that a workflow scheme cannot be deleted if it is active (that is, being used by at least one project).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. Find this ID by edi |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}"
```

---

## GET /rest/api/3/workflowscheme/{id}

**Get workflow scheme**

Returns a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. Find this ID by edi |
| `returnDraftIfExists` | query | boolean | No | Returns the workflow scheme's draft rather than sc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}"
```

---

## PUT /rest/api/3/workflowscheme/{id}

**Classic update workflow scheme**

Updates a company-manged project workflow scheme, including the name, default workflow, issue type to project mappings, and more. If the workflow scheme is active (that is, being used by at least one project), then a draft workflow scheme is created or updated instead, provided that `updateDraftIfNeeded` is set to `true`.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. Find this ID by edi |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/default

**Delete default workflow**

Resets the default workflow for a workflow scheme. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the default workflow reset. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `updateDraftIfNeeded` | query | boolean | No | Set to true to create or update the draft of a wor |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/default"
```

---

## GET /rest/api/3/workflowscheme/{id}/default

**Get default workflow**

Returns the default workflow for a workflow scheme. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `returnDraftIfExists` | query | boolean | No | Set to `true` to return the default workflow for t |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/default"
```

---

## PUT /rest/api/3/workflowscheme/{id}/default

**Update default workflow**

Sets the default workflow for a workflow scheme.

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request object and a draft workflow scheme is created or updated with the new default workflow. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/default"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/issuetype/{issueType}

**Delete workflow for issue type in workflow scheme**

Deletes the issue type-workflow mapping for an issue type in a workflow scheme.

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the issue type-workflow mapping deleted. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `issueType` | path | string | Yes | The ID of the issue type. |
| `updateDraftIfNeeded` | query | boolean | No | Set to true to create or update the draft of a wor |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/issuetype/{issueType}"
```

---

## GET /rest/api/3/workflowscheme/{id}/issuetype/{issueType}

**Get workflow for issue type in workflow scheme**

Returns the issue type-workflow mapping for an issue type in a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `issueType` | path | string | Yes | The ID of the issue type. |
| `returnDraftIfExists` | query | boolean | No | Returns the mapping from the workflow scheme's dra |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/issuetype/{issueType}"
```

---

## PUT /rest/api/3/workflowscheme/{id}/issuetype/{issueType}

**Set workflow for issue type in workflow scheme**

Sets the workflow for an issue type in a workflow scheme.

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new issue type-workflow mapping. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `issueType` | path | string | Yes | The ID of the issue type. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/issuetype/{issueType}"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/workflow

**Delete issue types for workflow in workflow scheme**

Deletes the workflow-issue type mapping for a workflow in a workflow scheme.

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the workflow-issue type mapping deleted. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `workflowName` | query | string | Yes | The name of the workflow. |
| `updateDraftIfNeeded` | query | boolean | No | Set to true to create or update the draft of a wor |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/workflow"
```

---

## GET /rest/api/3/workflowscheme/{id}/workflow

**Get issue types for workflows in workflow scheme**

Returns the workflow-issue type mappings for a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `workflowName` | query | string | No | The name of a workflow in the scheme. Limits the r |
| `returnDraftIfExists` | query | boolean | No | Returns the mapping from the workflow scheme's dra |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/workflow"
```

---

## PUT /rest/api/3/workflowscheme/{id}/workflow

**Set issue types for workflow in workflow scheme**

Sets the issue types for a workflow in a workflow scheme. The workflow can also be set as the default workflow for the workflow scheme. Unmapped issues types are mapped to the default workflow.

Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new workflow-issue types mappings. The draft workflow scheme can be published in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme. |
| `workflowName` | query | string | Yes | The name of the workflow. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/workflow"
```

---

## GET /rest/api/3/workflowscheme/{workflowSchemeId}/projectUsages

**Get projects which are using a given workflow scheme**

Returns a page of projects using a given workflow scheme.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workflowSchemeId` | path | string | Yes | The workflow scheme ID |
| `nextPageToken` | query | string | No | The cursor for pagination |
| `maxResults` | query | integer | No | The maximum number of results to return. Must be a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{workflowSchemeId}/projectUsages"
```

---
