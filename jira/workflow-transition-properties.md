---
created: 2026-01-09
tags: [type/api-reference, api/workflow-transition-properties]
api_name: The Jira Cloud platform REST API
category: Workflow transition properties
endpoint_count: 4
---

# The Jira Cloud platform REST API - Workflow Transition Properties

[[README|Back to Overview]]

---

## DELETE /rest/api/3/workflow/transitions/{transitionId}/properties

**Delete workflow transition property**

This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2570); delete transition properties using [Bulk update workflows](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflows/#api-rest-api-3-workflows-update-post) instead.

Deletes a property from a workflow transition. Transition properties are used to change the behavior of a transition. For more information, see [Transition properties](https://confluence.atlassian.com/x/zIhKLg#Advancedworkflowconfiguration-transitionproperties) and [Workflow properties](https://confluence.atlassian.com/x/JYlKLg).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `transitionId` | path | integer | Yes | The ID of the transition. To get the ID, view the  |
| `key` | query | string | Yes | The name of the transition property to delete, als |
| `workflowName` | query | string | Yes | The name of the workflow that the transition belon |
| `workflowMode` | query | string | No | The workflow status. Set to `live` for inactive wo |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflow/transitions/{transitionId}/properties"
```

---

## GET /rest/api/3/workflow/transitions/{transitionId}/properties

**Get workflow transition properties**

This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2570); fetch transition properties from [Bulk get workflows](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflows/#api-rest-api-3-workflows-post) instead.

Returns the properties on a workflow transition. Transition properties are used to change the behavior of a transition. For more information, see [Transition properties](https://confluence.atlassian.com/x/zIhKLg#Advancedworkflowconfiguration-transitionproperties) and [Workflow properties](https://confluence.atlassian.com/x/JYlKLg).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `transitionId` | path | integer | Yes | The ID of the transition. To get the ID, view the  |
| `includeReservedKeys` | query | boolean | No | Some properties with keys that have the *jira.* pr |
| `key` | query | string | No | The key of the property being returned, also known |
| `workflowName` | query | string | Yes | The name of the workflow that the transition belon |
| `workflowMode` | query | string | No | The workflow status. Set to *live* for active and  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflow/transitions/{transitionId}/properties"
```

---

## POST /rest/api/3/workflow/transitions/{transitionId}/properties

**Create workflow transition property**

This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2570); add transition properties using [Bulk update workflows](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflows/#api-rest-api-3-workflows-update-post) instead.

Adds a property to a workflow transition. Transition properties are used to change the behavior of a transition. For more information, see [Transition properties](https://confluence.atlassian.com/x/zIhKLg#Advancedworkflowconfiguration-transitionproperties) and [Workflow properties](https://confluence.atlassian.com/x/JYlKLg).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `transitionId` | path | integer | Yes | The ID of the transition. To get the ID, view the  |
| `key` | query | string | Yes | The key of the property being added, also known as |
| `workflowName` | query | string | Yes | The name of the workflow that the transition belon |
| `workflowMode` | query | string | No | The workflow status. Set to *live* for inactive wo |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflow/transitions/{transitionId}/properties"
```

---

## PUT /rest/api/3/workflow/transitions/{transitionId}/properties

**Update workflow transition property**

This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2570); update transition properties using [Bulk update workflows](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflows/#api-rest-api-3-workflows-update-post) instead.

Updates a workflow transition by changing the property value. Trying to update a property that does not exist results in a new property being added to the transition. Transition properties are used to change the behavior of a transition. For more information, see [Transition properties](https://confluence.atlassian.com/x/zIhKLg#Advancedworkflowconfiguration-transitionproperties) and [Workflow properties](https://confluence.atlassian.com/x/JYlKLg).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `transitionId` | path | integer | Yes | The ID of the transition. To get the ID, view the  |
| `key` | query | string | Yes | The key of the property being updated, also known  |
| `workflowName` | query | string | Yes | The name of the workflow that the transition belon |
| `workflowMode` | query | string | No | The workflow status. Set to `live` for inactive wo |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/workflow/transitions/{transitionId}/properties"
```

---
