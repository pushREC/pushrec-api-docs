---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-configuration-(apps)]
api_name: The Jira Cloud platform REST API
category: Issue custom field configuration (apps)
endpoint_count: 3
---

# The Jira Cloud platform REST API - Issue Custom Field Configuration (Apps)

[[README|Back to Overview]]

---

## POST /rest/api/3/app/field/context/configuration/list

**Bulk get custom field configurations**

Returns a [paginated](#pagination) list of configurations for list of custom fields of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).

The result can be filtered by one of these criteria:

 *  `id`.
 *  `fieldContextId`.
 *  `issueId`.
 *  `projectKeyOrId` and `issueTypeId`.

Otherwise, all configurations for the provided list of custom fields are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | query | array | No | The list of configuration IDs. To include multiple |
| `fieldContextId` | query | array | No | The list of field context IDs. To include multiple |
| `issueId` | query | integer | No | The ID of the issue to filter results by. If the i |
| `projectKeyOrId` | query | string | No | The ID or key of the project to filter results by. |
| `issueTypeId` | query | string | No | The ID of the issue type to filter results by. Mus |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/app/field/context/configuration/list"
```

---

## GET /rest/api/3/app/field/{fieldIdOrKey}/context/configuration

**Get custom field configurations**

Returns a [paginated](#pagination) list of configurations for a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).

The result can be filtered by one of these criteria:

 *  `id`.
 *  `fieldContextId`.
 *  `issueId`.
 *  `projectKeyOrId` and `issueTypeId`.

Otherwise, all configurations are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that provided the custom field type.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldIdOrKey` | path | string | Yes | The ID or key of the custom field, for example `cu |
| `id` | query | array | No | The list of configuration IDs. To include multiple |
| `fieldContextId` | query | array | No | The list of field context IDs. To include multiple |
| `issueId` | query | integer | No | The ID of the issue to filter results by. If the i |
| `projectKeyOrId` | query | string | No | The ID or key of the project to filter results by. |
| `issueTypeId` | query | string | No | The ID of the issue type to filter results by. Mus |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/app/field/{fieldIdOrKey}/context/configuration"
```

---

## PUT /rest/api/3/app/field/{fieldIdOrKey}/context/configuration

**Update custom field configurations**

Update the configuration for contexts of a custom field of a [type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) created by a [Forge app](https://developer.atlassian.com/platform/forge/).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the Forge app that created the custom field type.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldIdOrKey` | path | string | Yes | The ID or key of the custom field, for example `cu |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/app/field/{fieldIdOrKey}/context/configuration"
```

---
