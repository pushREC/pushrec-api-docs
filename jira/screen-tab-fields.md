---
created: 2026-01-09
tags: [type/api-reference, api/screen-tab-fields]
api_name: The Jira Cloud platform REST API
category: Screen tab fields
endpoint_count: 4
---

# The Jira Cloud platform REST API - Screen Tab Fields

[[README|Back to Overview]]

---

## GET /rest/api/3/screens/{screenId}/tabs/{tabId}/fields

**Get all screen tab fields**

Returns all fields for a screen tab.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) when the project key is specified, providing that the screen is associated with the project through a Screen Scheme and Issue Type Screen Scheme.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |
| `projectKey` | query | string | No | The key of the project. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}/fields"
```

---

## POST /rest/api/3/screens/{screenId}/tabs/{tabId}/fields

**Add screen tab field**

Adds a field to a screen tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}/fields"
```

---

## DELETE /rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}

**Remove screen tab field**

Removes a field from a screen tab.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |
| `id` | path | string | Yes | The ID of the field. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}"
```

---

## POST /rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move

**Move screen tab field**

Moves a screen tab field.

If `after` and `position` are provided in the request, `position` is ignored.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `screenId` | path | integer | Yes | The ID of the screen. |
| `tabId` | path | integer | Yes | The ID of the screen tab. |
| `id` | path | string | Yes | The ID of the field. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move"
```

---
