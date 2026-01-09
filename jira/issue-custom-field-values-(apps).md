---
created: 2026-01-09
tags: [type/api-reference, api/issue-custom-field-values-(apps)]
api_name: The Jira Cloud platform REST API
category: Issue custom field values (apps)
endpoint_count: 2
---

# The Jira Cloud platform REST API - Issue Custom Field Values (Apps)

[[README|Back to Overview]]

---

## POST /rest/api/3/app/field/value

**Update custom fields**

Updates the value of one or more custom fields on one or more issues. Combinations of custom field and issue should be unique within the request.

Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.

**[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `generateChangelog` | query | boolean | No | Whether to generate a changelog for this update. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/app/field/value"
```

---

## PUT /rest/api/3/app/field/{fieldIdOrKey}/value

**Update custom field value**

Updates the value of a custom field on one or more issues.

Apps can only perform this operation on [custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/) and [custom field types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/) declared in their own manifests.

**[Permissions](#permissions) required:** Only the app that owns the custom field or custom field type can update its values with this operation.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `fieldIdOrKey` | path | string | Yes | The ID or key of the custom field. For example, `c |
| `generateChangelog` | query | boolean | No | Whether to generate a changelog for this update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/app/field/{fieldIdOrKey}/value"
```

---
