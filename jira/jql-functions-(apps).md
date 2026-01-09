---
created: 2026-01-09
tags: [type/api-reference, api/jql-functions-(apps)]
api_name: The Jira Cloud platform REST API
category: JQL functions (apps)
endpoint_count: 3
---

# The Jira Cloud platform REST API - Jql Functions (Apps)

[[README|Back to Overview]]

---

## GET /rest/api/3/jql/function/computation

**Get precomputations (apps)**

Returns the list of a function's precomputations along with information about when they were created, updated, and last used. Each precomputation has a `value` \- the JQL fragment to replace the custom function clause with.

**[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.

The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `functionKey` | query | array | No | The function key in format:

 *  Forge: `ari:cloud |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `f |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/jql/function/computation"
```

---

## POST /rest/api/3/jql/function/computation

**Update precomputations (apps)**

Update the precomputation value of a function created by a Forge/Connect app.

**[Permissions](#permissions) required:** An API for apps to update their own precomputations.

The new `write:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `skipNotFoundPrecomputations` | query | boolean | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/jql/function/computation"
```

---

## POST /rest/api/3/jql/function/computation/search

**Get precomputations by ID (apps)**

Returns function precomputations by IDs, along with information about when they were created, updated, and last used. Each precomputation has a `value` \- the JQL fragment to replace the custom function clause with.

**[Permissions](#permissions) required:** This API is only accessible to apps and apps can only inspect their own functions.

The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `orderBy` | query | string | No | [Order](#ordering) the results by a field:

 *  `f |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/jql/function/computation/search"
```

---
