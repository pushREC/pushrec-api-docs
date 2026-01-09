---
created: 2026-01-09
tags: [type/api-reference, api/screen-tabs]
api_name: The Jira Cloud platform REST API
category: Screen tabs
endpoint_count: 6
---

# The Jira Cloud platform REST API - Screen Tabs

[[README|Back to Overview]]

---

## GET /rest/api/3/screens/tabs

**Get bulk screen tabs**

Returns the list of tabs for a bulk of screens.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | query | array | No | The list of screen IDs. To include multiple screen |
| `tabId` | query | array | No | The list of tab IDs. To include multiple tab IDs,  |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResult` | query | integer | No | The maximum number of items to return per page. Th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/tabs"
```

---

## GET /rest/api/3/screens/{screenId}/tabs

**Get all screen tabs**

Returns the list of tabs for a screen.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `projectKey` | query | string | No | The key of the project. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs"
```

---

## POST /rest/api/3/screens/{screenId}/tabs

**Create screen tab**

Creates a tab for a screen.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs"
```

---

## DELETE /rest/api/3/screens/{screenId}/tabs/{tabId}

**Delete screen tab**

Deletes a screen tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}"
```

---

## PUT /rest/api/3/screens/{screenId}/tabs/{tabId}

**Update screen tab**

Updates the name of a screen tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}"
```

---

## POST /rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}

**Move screen tab**

Moves a screen tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |
| `pos` | path | integer | Yes | The position of tab. The base index is 0. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}"
```

---
