---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-contexts]
api_name: The Jira Cloud platform REST API
category: Issue custom field contexts
endpoint_count: 13
---

# The Jira Cloud platform REST API - Issue Custom Field Contexts

[[README|Back to Overview]]

---

## GET /rest/api/3/field/{fieldId}/context

**Get custom field contexts**

Returns a [paginated](#pagination) list of [ contexts](https://confluence.atlassian.com/adminjiracloud/what-are-custom-field-contexts-991923859.html) for a custom field. Contexts can be returned as follows:

 *  With no other parameters set, all contexts.
 *  By defining `id` only, all contexts from the list of IDs.
 *  By defining `isAnyIssueType`, limit the list of contexts returned to either those that apply to all issue types (true) or those that apply to only a subset of issue types (false)
 *  By defining `isGlobalContext`, limit the list of contexts return to either those that apply to all projects (global contexts) (true) or those that apply to only a subset of projects (false).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `isAnyIssueType` | query | boolean | No | Whether to return contexts that apply to all issue |
| `isGlobalContext` | query | boolean | No | Whether to return contexts that apply to all proje |
| `contextId` | query | array | No | The list of context IDs. To include multiple conte |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context"
```

---

## POST /rest/api/3/field/{fieldId}/context

**Create custom field context**

Creates a custom field context.

If `projectIds` is empty, a global context is created. A global context is one that applies to all project. If `issueTypeIds` is empty, the context applies to all issue types.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context"
```

---

## GET /rest/api/3/field/{fieldId}/context/defaultValue

**Get custom field contexts default values**

Returns a [paginated](#pagination) list of defaults for a custom field. The results can be filtered by `contextId`, otherwise all values are returned. If no defaults are set for a context, nothing is returned.  
The returned object depends on type of the custom field:

 *  `CustomFieldContextDefaultValueDate` (type `datepicker`) for date fields.
 *  `CustomFieldContextDefaultValueDateTime` (type `datetimepicker`) for date-time fields.
 *  `CustomFieldContextDefaultValueSingleOption` (type `option.single`) for single choice select lists and radio buttons.
 *  `CustomFieldContextDefaultValueMultipleOption` (type `option.multiple`) for multiple choice select lists and checkboxes.
 *  `CustomFieldContextDefaultValueCascadingOption` (type `option.cascading`) for cascading select lists.
 *  `CustomFieldContextSingleUserPickerDefaults` (type `single.user.select`) for single users.
 *  `CustomFieldContextDefaultValueMultiUserPicker` (type `multi.user.select`) for user lists.
 *  `CustomFieldContextDefaultValueSingleGroupPicker` (type `grouppicker.single`) for single choice group pickers.
 *  `CustomFieldContextDefaultValueMultipleGroupPicker` (type `grouppicker.multiple`) for multiple choice group pickers.
 *  `CustomFieldContextDefaultValueURL` (type `url`) for URLs.
 *  `CustomFieldContextDefaultValueProject` (type `project`) for project pickers.
 *  `CustomFieldContextDefaultValueFloat` (type `float`) for floats (floating-point numbers).
 *  `CustomFieldContextDefaultValueLabels` (type `labels`) for labels.
 *  `CustomFieldContextDefaultValueTextField` (type `textfield`) for text fields.
 *  `CustomFieldContextDefaultValueTextArea` (type `textarea`) for text area fields.
 *  `CustomFieldContextDefaultValueReadOnly` (type `readonly`) for read only (text) fields.
 *  `CustomFieldContextDefaultValueMultipleVersion` (type `version.multiple`) for single choice version pickers.
 *  `CustomFieldContextDefaultValueSingleVersion` (type `version.single`) for multiple choice version pickers.

Forge custom fields [types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/#data-types) are also supported, returning:

 *  `CustomFieldContextDefaultValueForgeStringFieldBean` (type `forge.string`) for Forge string fields.
 *  `CustomFieldContextDefaultValueForgeMultiStringFieldBean` (type `forge.string.list`) for Forge string collection fields.
 *  `CustomFieldContextDefaultValueForgeObjectFieldBean` (type `forge.object`) for Forge object fields.
 *  `CustomFieldContextDefaultValueForgeDateTimeFieldBean` (type `forge.datetime`) for Forge date-time fields.
 *  `CustomFieldContextDefaultValueForgeGroupFieldBean` (type `forge.group`) for Forge group fields.
 *  `CustomFieldContextDefaultValueForgeMultiGroupFieldBean` (type `forge.group.list`) for Forge group collection fields.
 *  `CustomFieldContextDefaultValueForgeNumberFieldBean` (type `forge.number`) for Forge number fields.
 *  `CustomFieldContextDefaultValueForgeUserFieldBean` (type `forge.user`) for Forge user fields.
 *  `CustomFieldContextDefaultValueForgeMultiUserFieldBean` (type `forge.user.list`) for Forge user collection fields.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field, for example `customfie |
| `contextId` | query | array | No | The IDs of the contexts. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/defaultValue"
```

---

## PUT /rest/api/3/field/{fieldId}/context/defaultValue

**Set custom field contexts default values**

Sets default for contexts of a custom field. Default are defined using these objects:

 *  `CustomFieldContextDefaultValueDate` (type `datepicker`) for date fields.
 *  `CustomFieldContextDefaultValueDateTime` (type `datetimepicker`) for date-time fields.
 *  `CustomFieldContextDefaultValueSingleOption` (type `option.single`) for single choice select lists and radio buttons.
 *  `CustomFieldContextDefaultValueMultipleOption` (type `option.multiple`) for multiple choice select lists and checkboxes.
 *  `CustomFieldContextDefaultValueCascadingOption` (type `option.cascading`) for cascading select lists.
 *  `CustomFieldContextSingleUserPickerDefaults` (type `single.user.select`) for single users.
 *  `CustomFieldContextDefaultValueMultiUserPicker` (type `multi.user.select`) for user lists.
 *  `CustomFieldContextDefaultValueSingleGroupPicker` (type `grouppicker.single`) for single choice group pickers.
 *  `CustomFieldContextDefaultValueMultipleGroupPicker` (type `grouppicker.multiple`) for multiple choice group pickers.
 *  `CustomFieldContextDefaultValueURL` (type `url`) for URLs.
 *  `CustomFieldContextDefaultValueProject` (type `project`) for project pickers.
 *  `CustomFieldContextDefaultValueFloat` (type `float`) for floats (floating-point numbers).
 *  `CustomFieldContextDefaultValueLabels` (type `labels`) for labels.
 *  `CustomFieldContextDefaultValueTextField` (type `textfield`) for text fields.
 *  `CustomFieldContextDefaultValueTextArea` (type `textarea`) for text area fields.
 *  `CustomFieldContextDefaultValueReadOnly` (type `readonly`) for read only (text) fields.
 *  `CustomFieldContextDefaultValueMultipleVersion` (type `version.multiple`) for single choice version pickers.
 *  `CustomFieldContextDefaultValueSingleVersion` (type `version.single`) for multiple choice version pickers.

Forge custom fields [types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/#data-types) are also supported, returning:

 *  `CustomFieldContextDefaultValueForgeStringFieldBean` (type `forge.string`) for Forge string fields.
 *  `CustomFieldContextDefaultValueForgeMultiStringFieldBean` (type `forge.string.list`) for Forge string collection fields.
 *  `CustomFieldContextDefaultValueForgeObjectFieldBean` (type `forge.object`) for Forge object fields.
 *  `CustomFieldContextDefaultValueForgeDateTimeFieldBean` (type `forge.datetime`) for Forge date-time fields.
 *  `CustomFieldContextDefaultValueForgeGroupFieldBean` (type `forge.group`) for Forge group fields.
 *  `CustomFieldContextDefaultValueForgeMultiGroupFieldBean` (type `forge.group.list`) for Forge group collection fields.
 *  `CustomFieldContextDefaultValueForgeNumberFieldBean` (type `forge.number`) for Forge number fields.
 *  `CustomFieldContextDefaultValueForgeUserFieldBean` (type `forge.user`) for Forge user fields.
 *  `CustomFieldContextDefaultValueForgeMultiUserFieldBean` (type `forge.user.list`) for Forge user collection fields.

Only one type of default object can be included in a request. To remove a default for a context, set the default parameter to `null`.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/defaultValue"
```

---

## GET /rest/api/3/field/{fieldId}/context/issuetypemapping

**Get issue types for custom field context**

Returns a [paginated](#pagination) list of context to issue type mappings for a custom field. Mappings are returned for all contexts or a list of contexts. Mappings are ordered first by context ID and then by issue type ID.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | query | array | No | The ID of the context. To include multiple context |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/issuetypemapping"
```

---

## POST /rest/api/3/field/{fieldId}/context/mapping

**Get custom field contexts for projects and issue types**

Returns a [paginated](#pagination) list of project and issue type mappings and, for each mapping, the ID of a [custom field context](https://confluence.atlassian.com/x/k44fOw) that applies to the project and issue type.

If there is no custom field context assigned to the project then, if present, the custom field context that applies to all projects is returned if it also applies to the issue type or all issue types. If a custom field context is not found, the returned custom field context ID is `null`.

Duplicate project and issue type mappings cannot be provided in the request.

The order of the returned values is the same as provided in the request.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/mapping"
```

---

## GET /rest/api/3/field/{fieldId}/context/projectmapping

**Get project mappings for custom field context**

Returns a [paginated](#pagination) list of context to project mappings for a custom field. The result can be filtered by `contextId`. Otherwise, all mappings are returned. Invalid IDs are ignored.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field, for example `customfie |
| `contextId` | query | array | No | The list of context IDs. To include multiple conte |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/projectmapping"
```

---

## DELETE /rest/api/3/field/{fieldId}/context/{contextId}

**Delete custom field context**

Deletes a [ custom field context](https://confluence.atlassian.com/adminjiracloud/what-are-custom-field-contexts-991923859.html).

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldId` | path | string | Yes | The ID of the custom field. |
| `contextId` | path | integer | Yes | The ID of the context. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}"
```

---

## PUT /rest/api/3/field/{fieldId}/context/{contextId}

**Update custom field context**

Updates a [ custom field context](https://confluence.atlassian.com/adminjiracloud/what-are-custom-field-contexts-991923859.html).

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
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}"
```

---

## PUT /rest/api/3/field/{fieldId}/context/{contextId}/issuetype

**Add issue types to context**

Adds issue types to a custom field context, appending the issue types to the issue types list.

A custom field context without any issue types applies to all issue types. Adding issue types to such a custom field context would result in it applying to only the listed issue types.

If any of the issue types exists in the custom field context, the operation fails and no issue types are added.

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
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/issuetype"
```

---

## POST /rest/api/3/field/{fieldId}/context/{contextId}/issuetype/remove

**Remove issue types from context**

Removes issue types from a custom field context.

A custom field context without any issue types applies to all issue types.

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
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/issuetype/remove"
```

---

## PUT /rest/api/3/field/{fieldId}/context/{contextId}/project

**Assign custom field context to projects**

Assigns a custom field context to projects.

If any project in the request is assigned to any context of the custom field, the operation fails.

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
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/project"
```

---

## POST /rest/api/3/field/{fieldId}/context/{contextId}/project/remove

**Remove custom field context from projects**

Removes a custom field context from projects.

A custom field context without any projects applies to all projects. Removing all projects from a custom field context would result in it applying to all projects.

If any project in the request is not assigned to the context, or the operation would result in two global contexts for the field, the operation fails.

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
  "https://your-domain.atlassian.net/rest/api/3/field/{fieldId}/context/{contextId}/project/remove"
```

---
