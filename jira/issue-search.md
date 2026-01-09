---
created: 2026-01-09
tags: [type/api-reference, api/issue-search]
api_name: The Jira Cloud platform REST API
category: Issue search
endpoint_count: 7
---

# The Jira Cloud platform REST API - Issue Search

[[README|Back to Overview]]

---

## GET /rest/api/3/issue/picker

**Get issue picker suggestions**

Returns lists of issues matching a query string. Use this resource to provide auto-completion suggestions when the user is looking for an issue using a word or string.

This operation returns two lists:

 *  `History Search` which includes issues from the user's history of created, edited, or viewed issues that contain the string in the `query` parameter.
 *  `Current Search` which includes issues that match the JQL expression in `currentJQL` and contain the string in the `query` parameter.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A string to match against text fields in the issue |
| `currentJQL` | query | string | No | A JQL query defining a list of issues to search fo |
| `currentIssueKey` | query | string | No | The key of an issue to exclude from search results |
| `currentProjectId` | query | string | No | The ID of a project that suggested issues must bel |
| `showSubTasks` | query | boolean | No | Indicate whether to include subtasks in the sugges |
| `showSubTaskParent` | query | boolean | No | When `currentIssueKey` is a subtask, whether to in |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/picker"
```

---

## POST /rest/api/3/jql/match

**Check issues against JQL**

Checks whether one or more issues would be returned by one or more JQL queries.

**[Permissions](#permissions) required:** None, however, issues are only matched against JQL queries where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/jql/match"
```

---

## GET /rest/api/3/search

**Currently being removed. Search for issues using JQL (GET)**

Endpoint is currently being removed. [More details](https://developer.atlassian.com/changelog/#CHANGE-2046)

Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ).

If the JQL query expression is too large to be encoded as a query parameter, use the [POST](#api-rest-api-3-search-post) version of this resource.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `jql` | query | string | No | The [JQL](https://confluence.atlassian.com/x/egORL |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. To |
| `validateQuery` | query | string | No | Determines how to validate the JQL query and treat |
| `fields` | query | array | No | A list of fields to return for each issue, use it  |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `properties` | query | array | No | A list of issue property keys for issue properties |
| `fieldsByKeys` | query | boolean | No | Reference fields by their key (rather than ID). |
| `failFast` | query | boolean | No | Whether to fail the request quickly in case of an  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/search"
```

---

## POST /rest/api/3/search

**Currently being removed. Search for issues using JQL (POST)**

Endpoint is currently being removed. [More details](https://developer.atlassian.com/changelog/#CHANGE-2046)

Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ).

There is a [GET](#api-rest-api-3-search-get) version of this resource that can be used for smaller JQL query expressions.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/search"
```

---

## POST /rest/api/3/search/approximate-count

**Count issues using JQL**

Provide an estimated count of the issues that match the [JQL](https://confluence.atlassian.com/x/egORLQ). Recent updates might not be immediately visible in the returned output. This endpoint requires JQL to be bounded.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/search/approximate-count"
```

---

## GET /rest/api/3/search/jql

**Search for issues using JQL enhanced search (GET)**

Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ). Recent updates might not be immediately visible in the returned search results. If you need [read-after-write](https://developer.atlassian.com/cloud/jira/platform/search-and-reconcile/) consistency, you can utilize the `reconcileIssues` parameter to ensure stronger consistency assurances. This operation can be accessed anonymously.

If the JQL query expression is too large to be encoded as a query parameter, use the [POST](#api-rest-api-3-search-post) version of this resource.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `jql` | query | string | No | A [JQL](https://confluence.atlassian.com/x/egORLQ) |
| `nextPageToken` | query | string | No | The token for a page to fetch that is not the firs |
| `maxResults` | query | integer | No | The maximum number of items to return per page. To |
| `fields` | query | array | No | A list of fields to return for each issue, use it  |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |
| `properties` | query | array | No | A list of up to 5 issue properties to include in t |
| `fieldsByKeys` | query | boolean | No | Reference fields by their key (rather than ID). Th |
| `failFast` | query | boolean | No | Fail this request early if we can't retrieve all f |
| `reconcileIssues` | query | array | No | Strong consistency issue ids to be reconciled with |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/search/jql"
```

---

## POST /rest/api/3/search/jql

**Search for issues using JQL enhanced search (POST)**

Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ). Recent updates might not be immediately visible in the returned search results. If you need [read-after-write](https://developer.atlassian.com/cloud/jira/platform/search-and-reconcile/) consistency, you can utilize the `reconcileIssues` parameter to ensure stronger consistency assurances. This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/search/jql"
```

---
