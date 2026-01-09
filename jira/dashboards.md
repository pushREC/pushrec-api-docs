---
created: 2026-01-09
tags: [type/api-reference, api/dashboards]
api_name: The Jira Cloud platform REST API
category: Dashboards
endpoint_count: 17
---

# The Jira Cloud platform REST API - Dashboards

[[README|Back to Overview]]

---

## GET /rest/api/3/dashboard

**Get all dashboards**

Returns a list of dashboards owned by or shared with the user. The list may be filtered to include only favorite or owned dashboards.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `filter` | query | string | No | The filter applied to the list of dashboards. Vali |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard"
```

---

## POST /rest/api/3/dashboard

**Create dashboard**

Creates a dashboard.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `extendAdminPermissions` | query | boolean | No | Whether admin level permissions are used. It shoul |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard"
```

---

## PUT /rest/api/3/dashboard/bulk/edit

**Bulk edit dashboards**

Bulk edit dashboards. Maximum number of dashboards to be edited at the same time is 100.

**[Permissions](#permissions) required:** None

The dashboards to be updated must be owned by the user, or the user must be an administrator.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/bulk/edit"
```

---

## GET /rest/api/3/dashboard/gadgets

**Get available gadgets**

Gets a list of all available gadgets that can be added to all dashboards.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/gadgets"
```

---

## GET /rest/api/3/dashboard/search

**Search for dashboards**

Returns a [paginated](#pagination) list of dashboards. This operation is similar to [Get dashboards](#api-rest-api-3-dashboard-get) except that the results can be refined to include dashboards that have specific attributes. For example, dashboards with a particular name. When multiple attributes are specified only filters matching all attributes are returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The following dashboards that match the query parameters are returned:

 *  Dashboards owned by the user. Not returned for anonymous users.
 *  Dashboards shared with a group that the user is a member of. Not returned for anonymous users.
 *  Dashboards shared with a private project that the user can browse. Not returned for anonymous users.
 *  Dashboards shared with a public project.
 *  Dashboards shared with the public.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardName` | query | string | No | String used to perform a case-insensitive partial  |
| `accountId` | query | string | No | User account ID used to return dashboards with the |
| `owner` | query | string | No | This parameter is deprecated because of privacy ch |
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | Group ID used to return dashboards that are shared |
| `projectId` | query | integer | No | Project ID used to returns dashboards that are sha |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `d |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `status` | query | string | No | The status to filter by. It may be active, archive |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/search"
```

---

## GET /rest/api/3/dashboard/{dashboardId}/gadget

**Get gadgets**

Returns a list of dashboard gadgets on a dashboard.

This operation returns:

 *  Gadgets from a list of IDs, when `id` is set.
 *  Gadgets with a module key, when `moduleKey` is set.
 *  Gadgets from a list of URIs, when `uri` is set.
 *  All gadgets, when no other parameters are set.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | integer | Yes | The ID of the dashboard. |
| `moduleKey` | query | array | No | The list of gadgets module keys. To include multip |
| `uri` | query | array | No | The list of gadgets URIs. To include multiple URIs |
| `gadgetId` | query | array | No | The list of gadgets IDs. To include multiple IDs,  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/gadget"
```

---

## POST /rest/api/3/dashboard/{dashboardId}/gadget

**Add gadget to dashboard**

Adds a gadget to a dashboard.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | integer | Yes | The ID of the dashboard. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/gadget"
```

---

## DELETE /rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}

**Remove gadget from dashboard**

Removes a dashboard gadget from a dashboard.

When a gadget is removed from a dashboard, other gadgets in the same column are moved up to fill the emptied position.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | integer | Yes | The ID of the dashboard. |
| `gadgetId` | path | integer | Yes | The ID of the gadget. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}"
```

---

## PUT /rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}

**Update gadget on dashboard**

Changes the title, position, and color of the gadget on a dashboard.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | integer | Yes | The ID of the dashboard. |
| `gadgetId` | path | integer | Yes | The ID of the gadget. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}"
```

---

## GET /rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties

**Get dashboard item property keys**

Returns the keys of all properties for a dashboard item.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | string | Yes | The ID of the dashboard. |
| `itemId` | path | string | Yes | The ID of the dashboard item. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties"
```

---

## DELETE /rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}

**Delete dashboard item property**

Deletes a dashboard item property.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The user must have edit permission of the dashboard.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | string | Yes | The ID of the dashboard. |
| `itemId` | path | string | Yes | The ID of the dashboard item. |
| `propertyKey` | path | string | Yes | The key of the dashboard item property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}"
```

---

## GET /rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}

**Get dashboard item property**

Returns the key and value of a dashboard item property.

A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).

When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.

There is no resource to set or get dashboard items.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The user must have read permission of the dashboard or have the dashboard shared with them.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | string | Yes | The ID of the dashboard. |
| `itemId` | path | string | Yes | The ID of the dashboard item. |
| `propertyKey` | path | string | Yes | The key of the dashboard item property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}"
```

---

## PUT /rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}

**Set dashboard item property**

Sets the value of a dashboard item property. Use this resource in apps to store custom data against a dashboard item.

A dashboard item enables an app to add user-specific information to a user dashboard. Dashboard items are exposed to users as gadgets that users can add to their dashboards. For more information on how users do this, see [Adding and customizing gadgets](https://confluence.atlassian.com/x/7AeiLQ).

When an app creates a dashboard item it registers a callback to receive the dashboard item ID. The callback fires whenever the item is rendered or, where the item is configurable, the user edits the item. The app then uses this resource to store the item's content or configuration details. For more information on working with dashboard items, see [ Building a dashboard item for a JIRA Connect add-on](https://developer.atlassian.com/server/jira/platform/guide-building-a-dashboard-item-for-a-jira-connect-add-on-33746254/) and the [Dashboard Item](https://developer.atlassian.com/cloud/jira/platform/modules/dashboard-item/) documentation.

There is no resource to set or get dashboard items.

The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The user must have edit permisson of the dashboard.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `dashboardId` | path | string | Yes | The ID of the dashboard. |
| `itemId` | path | string | Yes | The ID of the dashboard item. |
| `propertyKey` | path | string | Yes | The key of the dashboard item property. The maximu |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}"
```

---

## DELETE /rest/api/3/dashboard/{id}

**Delete dashboard**

Deletes a dashboard.

**[Permissions](#permissions) required:** None

The dashboard to be deleted must be owned by the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the dashboard. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{id}"
```

---

## GET /rest/api/3/dashboard/{id}

**Get dashboard**

Returns a dashboard.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

However, to get a dashboard, the dashboard must be shared with the user or the user must own it. Note, users with the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) are considered owners of the System dashboard. The System dashboard is considered to be shared with all other users.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the dashboard. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{id}"
```

---

## PUT /rest/api/3/dashboard/{id}

**Update dashboard**

Updates a dashboard, replacing all the dashboard details with those provided.

**[Permissions](#permissions) required:** None

The dashboard to be updated must be owned by the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the dashboard to update. |
| `extendAdminPermissions` | query | boolean | No | Whether admin level permissions are used. It shoul |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{id}"
```

---

## POST /rest/api/3/dashboard/{id}/copy

**Copy dashboard**

Copies a dashboard. Any values provided in the `dashboard` parameter replace those in the copied dashboard.

**[Permissions](#permissions) required:** None

The dashboard to be copied must be owned by or shared with the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `extendAdminPermissions` | query | boolean | No | Whether admin level permissions are used. It shoul |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/dashboard/{id}/copy"
```

---
