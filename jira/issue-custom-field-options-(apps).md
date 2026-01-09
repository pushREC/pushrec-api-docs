---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-options-(apps)]
api_name: The Jira Cloud platform REST API
category: Issue custom field options (apps)
endpoint_count: 8
---

# The Jira Cloud platform REST API - Issue Custom Field Options (Apps)

[[README|Back to Overview]]

---

## GET /rest/api/3/field/{fieldKey}/option

**Get all issue field options**

Returns a [paginated](#pagination) list of all the options of a select list issue field. A select list issue field is a type of [issue field](https://developer.atlassian.com/cloud/jira/platform/modules/issue-field/) that enables a user to select a value from a list of options.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `fieldKey` | path | string | Yes | The field key is specified in the following format |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option"
```

---

## POST /rest/api/3/field/{fieldKey}/option

**Create issue field option**

Creates an option for a select list issue field.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

Each field can have a maximum of 10000 options, and each option can have a maximum of 10000 scopes.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldKey` | path | string | Yes | The field key is specified in the following format |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option"
```

---

## GET /rest/api/3/field/{fieldKey}/option/suggestions/edit

**Get selectable issue field options**

Returns a [paginated](#pagination) list of options for a select list issue field that can be viewed and selected by the user.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `projectId` | query | integer | No | Filters the results to options that are only avail |
| `fieldKey` | path | string | Yes | The field key is specified in the following format |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/suggestions/edit"
```

---

## GET /rest/api/3/field/{fieldKey}/option/suggestions/search

**Get visible issue field options**

Returns a [paginated](#pagination) list of options for a select list issue field that can be viewed by the user.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** Permission to access Jira.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `projectId` | query | integer | No | Filters the results to options that are only avail |
| `fieldKey` | path | string | Yes | The field key is specified in the following format |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/suggestions/search"
```

---

## DELETE /rest/api/3/field/{fieldKey}/option/{optionId}

**Delete issue field option**

Deletes an option from a select list issue field.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldKey` | path | string | Yes | The field key is specified in the following format |
| `optionId` | path | integer | Yes | The ID of the option to be deleted. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/{optionId}"
```

---

## GET /rest/api/3/field/{fieldKey}/option/{optionId}

**Get issue field option**

Returns an option from a select list issue field.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldKey` | path | string | Yes | The field key is specified in the following format |
| `optionId` | path | integer | Yes | The ID of the option to be returned. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/{optionId}"
```

---

## PUT /rest/api/3/field/{fieldKey}/option/{optionId}

**Update issue field option**

Updates or creates an option for a select list issue field. This operation requires that the option ID is provided when creating an option, therefore, the option ID needs to be specified as a path and body parameter. The option ID provided in the path and body must be identical.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldKey` | path | string | Yes | The field key is specified in the following format |
| `optionId` | path | integer | Yes | The ID of the option to be updated. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/{optionId}"
```

---

## DELETE /rest/api/3/field/{fieldKey}/option/{optionId}/issue

**Replace issue field option**

Deselects an issue-field select-list option from all issues where it is selected. A different option can be selected to replace the deselected option. The update can also be limited to a smaller set of issues by using a JQL query.

Connect and Forge app users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) can override the screen security configuration using `overrideScreenSecurity` and `overrideEditableFlag`.

This is an [asynchronous operation](#async). The response object contains a link to the long-running task.

Note that this operation **only works for issue field select list options added by Connect apps**, it cannot be used with issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). Jira permissions are not required for the app providing the field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `replaceWith` | query | integer | No | The ID of the option that will replace the current |
| `jql` | query | string | No | A JQL query that specifies the issues to be update |
| `overrideScreenSecurity` | query | boolean | No | Whether screen security is overridden to enable hi |
| `overrideEditableFlag` | query | boolean | No | Whether screen security is overridden to enable un |
| `fieldKey` | path | string | Yes | The field key is specified in the following format |
| `optionId` | path | integer | Yes | The ID of the option to be deselected. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldKey}/option/{optionId}/issue"
```

---
