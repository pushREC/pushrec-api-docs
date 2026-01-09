---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-options]
api_name: The Jira Cloud platform REST API
category: Issue custom field options
endpoint_count: 7
---

# The Jira Cloud platform REST API - Issue Custom Field Options

[[README|Back to Overview]]

---

## GET /rest/api/3/customFieldOption/{id}

**Get custom field option**

Returns a custom field option. For example, an option in a select list.

Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** The custom field option is returned as follows:

 *  if the user has the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  if the user has the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the custom field is used in, and the field is visible in at least one layout the user has permission to view.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the custom field option. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/customFieldOption/{id}"
```

---

## GET /rest/api/3/field/{fieldId}/context/{contextId}/option

**Get custom field options (context)**

Returns a [paginated](#pagination) list of all custom field option for a context. Options are returned first then cascading options, in the order they display in Jira.

This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context. |
| `optionId` | query | integer | No | The ID of the option. |
| `onlyOptions` | query | boolean | No | Whether only options are returned. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option"
```

---

## POST /rest/api/3/field/{fieldId}/context/{contextId}/option

**Create custom field options (context)**

Creates options and, where the custom select field is of the type Select List (cascading), cascading options for a custom select field. The options are added to a context of the field.

The maximum number of options that can be created per request is 1000 and each field can have a maximum of 10000 options.

This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option"
```

---

## PUT /rest/api/3/field/{fieldId}/context/{contextId}/option

**Update custom field options (context)**

Updates the options of a custom field.

If any of the options are not found, no options are updated. Options where the values in the request match the current values aren't updated and aren't reported in the response.

Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect apps.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option"
```

---

## PUT /rest/api/3/field/{fieldId}/context/{contextId}/option/move

**Reorder custom field options (context)**

Changes the order of custom field options or cascading options in a context.

This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option/move"
```

---

## DELETE /rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}

**Delete custom field options (context)**

Deletes a custom field option.

Options with cascading options cannot be deleted without deleting the cascading options first.

This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context from which an option should  |
| `optionId` | path | integer | Yes | The ID of the option to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}"
```

---

## DELETE /rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}/issue

**Replace custom field options**

Replaces the options of a custom field.

Note that this operation **only works for issue field select list options created in Jira or using operations from the [Issue custom field options](#api-group-Issue-custom-field-options) resource**, it cannot be used with issue field select list options created by Connect or Forge apps.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `replaceWith` | query | integer | No | The ID of the option that will replace the current |
| `jql` | query | string | No | A JQL query that specifies the issues to be update |
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `optionId` | path | integer | Yes | The ID of the option to be deselected. |
| `contextId` | path | integer | Yes | The ID of the context. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}/issue"
```

---
