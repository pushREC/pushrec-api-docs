---
created: 2026-01-09
tags: [type/api-reference, api/ui-modifications-(apps)]
api_name: The Jira Cloud platform REST API
category: UI modifications (apps)
endpoint_count: 4
---

# The Jira Cloud platform REST API - Ui Modifications (Apps)

[[README|Back to Overview]]

---

## GET /rest/api/3/uiModifications

**Get UI modifications**

Gets UI modifications. UI modifications can only be retrieved by Forge apps.

**[Permissions](#permissions) required:** None.

The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `expand` | query | string | No | Use expand to include additional information in th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/uiModifications"
```

---

## POST /rest/api/3/uiModifications

**Create UI modification**

Creates a UI modification. UI modification can only be created by Forge apps.

Each app can define up to 3000 UI modifications. Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.

**Context types:**

 *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:
    
     *  `GIC` \- Jira global issue create
     *  `IssueView` \- Jira issue view
     *  `IssueTransition` \- Jira issue transition
 *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:
    
     *  `JSMRequestCreate` \- Jira Service Management request create portal view

**[Permissions](#permissions) required:**

 *  *None* if the UI modification is created without contexts.
 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/uiModifications"
```

---

## DELETE /rest/api/3/uiModifications/{uiModificationId}

**Delete UI modification**

Deletes a UI modification. All the contexts that belong to the UI modification are deleted too. UI modification can only be deleted by Forge apps.

**[Permissions](#permissions) required:** None.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uiModificationId` | path | string | Yes | The ID of the UI modification. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/uiModifications/{uiModificationId}"
```

---

## PUT /rest/api/3/uiModifications/{uiModificationId}

**Update UI modification**

Updates a UI modification. UI modification can only be updated by Forge apps.

Each UI modification can define up to 1000 contexts. The same context can be assigned to maximum 100 UI modifications.

**Context types:**

 *  **Jira contexts:** For Jira view types, use `projectId` and `issueTypeId`. One field can act as a wildcard. Supported Jira views:
    
     *  `GIC` \- Jira global issue create
     *  `IssueView` \- Jira issue view
     *  `IssueTransition` \- Jira issue transition
 *  **Jira Service Management contexts:** For Jira Service Management view types, use `portalId` and `requestTypeId`. Wildcards are not supported. Supported JSM views:
    
     *  `JSMRequestCreate` \- Jira Service Management request create portal view

**[Permissions](#permissions) required:**

 *  *None* if the UI modification is created without contexts.
 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, if the UI modification is created with contexts.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uiModificationId` | path | string | Yes | The ID of the UI modification. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/uiModifications/{uiModificationId}"
```

---
