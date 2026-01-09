---
created: 2026-01-09
tags: [type/api-reference, api/workflow-scheme-drafts]
api_name: The Jira Cloud platform REST API
category: Workflow scheme drafts
endpoint_count: 14
---

# The Jira Cloud platform REST API - Workflow Scheme Drafts

[[README|Back to Overview]]

---

## POST /rest/api/3/workflowscheme/{id}/createdraft

**Create draft workflow scheme**

Create a draft workflow scheme from an active workflow scheme, by copying the active workflow scheme. Note that an active workflow scheme can only have one draft workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the active workflow scheme that the draf |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/createdraft"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/draft

**Delete draft workflow scheme**

Deletes a draft workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the active workflow scheme that the draf |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft"
```

---

## GET /rest/api/3/workflowscheme/{id}/draft

**Get draft workflow scheme**

Returns the draft workflow scheme for an active workflow scheme. Draft workflow schemes allow changes to be made to the active workflow schemes: When an active workflow scheme is updated, a draft copy is created. The draft is modified, then the changes in the draft are copied back to the active workflow scheme. See [Configuring workflow schemes](https://confluence.atlassian.com/x/tohKLg) for more information.  
Note that:

 *  Only active workflow schemes can have draft workflow schemes.
 *  An active workflow scheme can only have one draft workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the active workflow scheme that the draf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft"
```

---

## PUT /rest/api/3/workflowscheme/{id}/draft

**Update draft workflow scheme**

Updates a draft workflow scheme. If a draft workflow scheme does not exist for the active workflow scheme, then a draft is created. Note that an active workflow scheme can only have one draft workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the active workflow scheme that the draf |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/draft/default

**Delete draft default workflow**

Resets the default workflow for a workflow scheme's draft. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/default"
```

---

## GET /rest/api/3/workflowscheme/{id}/draft/default

**Get draft default workflow**

Returns the default workflow for a workflow scheme's draft. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/default"
```

---

## PUT /rest/api/3/workflowscheme/{id}/draft/default

**Update draft default workflow**

Sets the default workflow for a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/default"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}

**Delete workflow for issue type in draft workflow scheme**

Deletes the issue type-workflow mapping for an issue type in a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `issueType` | path | string | Yes | The ID of the issue type. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}"
```

---

## GET /rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}

**Get workflow for issue type in draft workflow scheme**

Returns the issue type-workflow mapping for an issue type in a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `issueType` | path | string | Yes | The ID of the issue type. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}"
```

---

## PUT /rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}

**Set workflow for issue type in draft workflow scheme**

Sets the workflow for an issue type in a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `issueType` | path | string | Yes | The ID of the issue type. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}"
```

---

## POST /rest/api/3/workflowscheme/{id}/draft/publish

**Publish draft workflow scheme**

Publishes a draft workflow scheme.

Where the draft workflow includes new workflow statuses for an issue type, mappings are provided to update issues with the original workflow status to the new workflow status.

This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain updates.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `validateOnly` | query | boolean | No | Whether the request only performs a validation. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/publish"
```

---

## DELETE /rest/api/3/workflowscheme/{id}/draft/workflow

**Delete issue types for workflow in draft workflow scheme**

Deletes the workflow-issue type mapping for a workflow in a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `workflowName` | query | string | Yes | The name of the workflow. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/workflow"
```

---

## GET /rest/api/3/workflowscheme/{id}/draft/workflow

**Get issue types for workflows in draft workflow scheme**

Returns the workflow-issue type mappings for a workflow scheme's draft.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `workflowName` | query | string | No | The name of a workflow in the scheme. Limits the r |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/workflow"
```

---

## PUT /rest/api/3/workflowscheme/{id}/draft/workflow

**Set issue types for workflow in workflow scheme**

Sets the issue types for a workflow in a workflow scheme's draft. The workflow can also be set as the default workflow for the draft workflow scheme. Unmapped issues types are mapped to the default workflow.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | integer | Yes | The ID of the workflow scheme that the draft belon |
| `workflowName` | query | string | Yes | The name of the workflow. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflowscheme/{id}/draft/workflow"
```

---
