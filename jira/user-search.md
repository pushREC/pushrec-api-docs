---
created: 2026-01-09
tags: [type/api-reference, api/user-search]
api_name: The Jira Cloud platform REST API
category: User search
endpoint_count: 8
---

# The Jira Cloud platform REST API - User Search

[[README|Back to Overview]]

---

## GET /rest/api/3/user/assignable/multiProjectSearch

**Find users assignable to projects**

Returns a list of users who can be assigned issues in one or more projects. The list may be restricted to users whose attributes match a string.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned issues in the projects. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned issues in the projects, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for each project specified in `projectKeys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A query string that is matched against user attrib |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | No | A query string that is matched exactly against use |
| `projectKeys` | query | string | Yes | A list of project keys (case sensitive). This para |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/assignable/multiProjectSearch"
```

---

## GET /rest/api/3/user/assignable/search

**Find users assignable to issues**

Returns a list of users that can be assigned to an issue. Use this operation to find the list of users who can be assigned to:

 *  a new issue, by providing the `projectKeyOrId`.
 *  an updated issue, by providing the `issueKey` or `issueId`.
 *  to an issue during a transition (workflow action), by providing the `issueKey` or `issueId` and the transition id in `actionDescriptorId`. You can obtain the IDs of an issue's valid transitions using the `transitions` option in the `expand` parameter of [ Get issue](#api-rest-api-3-issue-issueIdOrKey-get).

In all these cases, you can pass an account ID to determine if a user can be assigned to an issue. The user is returned in the response if they can be assigned to the issue or issue transition.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned the issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned the issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Assign issues* [project permission](https://confluence.atlassian.com/x/yodKLg)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A query string that is matched against user attrib |
| `sessionId` | query | string | No | The sessionId of this request. SessionId is the sa |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | No | A query string that is matched exactly against use |
| `project` | query | string | No | The project ID or project key (case sensitive). Re |
| `issueKey` | query | string | No | The key of the issue. Required, unless `issueId` o |
| `issueId` | query | string | No | The ID of the issue. Required, unless `issueKey` o |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return. This operat |
| `actionDescriptorId` | query | integer | No | The ID of the transition. |
| `recommend` | query | boolean | No |  |
| `accountType` | query | array | No |  |
| `appType` | query | array | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/assignable/search"
```

---

## GET /rest/api/3/user/permission/search

**Find users with permissions**

Returns a list of users who fulfill these criteria:

 *  their user attributes match a search string.
 *  they have a set of permissions for a project or issue.

If no search string is provided, a list of all users with the permissions is returned.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission for the project or issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission for the project or issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to get users for any project.
 *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project, to get users for that project.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A query string that is matched against user attrib |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | No | A query string that is matched exactly against use |
| `permissions` | query | string | Yes | A comma separated list of permissions. Permissions |
| `issueKey` | query | string | No | The issue key for the issue. |
| `projectKey` | query | string | No | The project key for the project (case sensitive). |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/permission/search"
```

---

## GET /rest/api/3/user/picker

**Find users for picker**

Returns a list of users whose attributes match the query term. The returned object includes the `html` field where the matched query term is highlighted with the HTML strong tag. A list of account IDs can be provided to exclude users from the results.

This operation takes the users in the range defined by `maxResults`, up to the thousandth user, and then returns only the users from that range that match the query term. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the query term, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return search results for an exact name match only.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | Yes | A query string that is matched against user attrib |
| `maxResults` | query | integer | No | The maximum number of items to return. The total n |
| `showAvatar` | query | boolean | No | Include the URI to the user's avatar. |
| `exclude` | query | array | No | This parameter is no longer available. See the [de |
| `excludeAccountIds` | query | array | No | A list of account IDs to exclude from the search r |
| `avatarSize` | query | string | No |  |
| `excludeConnectUsers` | query | boolean | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/picker"
```

---

## GET /rest/api/3/user/search

**Find users**

Returns a list of active users that match the search string and property.

This operation first applies a filter to match the search string and property, and then takes the filtered users in the range defined by `startAt` and `maxResults`, up to the thousandth user. To get all the users who match the search string and property, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

This operation can be accessed anonymously.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls or calls by users without the required permission return empty search results.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A query string that is matched against user attrib |
| `username` | query | string | No |  |
| `accountId` | query | string | No | A query string that is matched exactly against a u |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `property` | query | string | No | A query string used to search properties. Property |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/search"
```

---

## GET /rest/api/3/user/search/query

**Find users by query**

Finds users with a structured query and returns a [paginated](#pagination) list of user details.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

The query statements are:

 *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.
 *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.
 *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.
 *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.
 *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.
 *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.
 *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.
 *  `[propertyKey].entity.property.path is "property value"` Returns users with the entity property value. For example, if user property `location` is set to value `{"office": {"country": "AU", "city": "Sydney"}}`, then it's possible to use `[location].office.city is "Sydney"` to match the user.

The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:

`is assignee of PROJ AND [propertyKey].entity.property.path is "property value"`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | Yes | The search query. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/search/query"
```

---

## GET /rest/api/3/user/search/query/key

**Find user keys by query**

Finds users with a structured query and returns a [paginated](#pagination) list of user keys.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

The query statements are:

 *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.
 *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.
 *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.
 *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.
 *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.
 *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.
 *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.
 *  `[propertyKey].entity.property.path is "property value"` Returns users with the entity property value. For example, if user property `location` is set to value `{"office": {"country": "AU", "city": "Sydney"}}`, then it's possible to use `[location].office.city is "Sydney"` to match the user.

The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:

`is assignee of PROJ AND [propertyKey].entity.property.path is "property value"`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | Yes | The search query. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResult` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/search/query/key"
```

---

## GET /rest/api/3/user/viewissue/search

**Find users with browse permission**

Returns a list of users who fulfill these criteria:

 *  their user attributes match a search string.
 *  they have permission to browse issues.

Use this resource to find users who can browse:

 *  an issue, by providing the `issueKey`.
 *  any issue in a project, by providing the `projectKey`.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission to browse issues. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission to browse issues, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return empty search results.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No | A query string that is matched against user attrib |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | No | A query string that is matched exactly against use |
| `issueKey` | query | string | No | The issue key for the issue. Required, unless `pro |
| `projectKey` | query | string | No | The project key for the project (case sensitive).  |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/user/viewissue/search"
```

---
