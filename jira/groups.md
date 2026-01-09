---
created: 2026-01-09
tags: [type/api-reference, api/groups]
api_name: The Jira Cloud platform REST API
category: Groups
endpoint_count: 8
---

# The Jira Cloud platform REST API - Groups

[[README|Back to Overview]]

---

## DELETE /rest/api/3/group

**Remove group**

Deletes a group.

**[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* strategic [group](https://confluence.atlassian.com/x/24xjL)).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `groupname` | query | string | No |  |
| `groupId` | query | string | No | The ID of the group. This parameter cannot be used |
| `swapGroup` | query | string | No | As a group's name can change, use of `swapGroupId` |
| `swapGroupId` | query | string | No | The ID of the group to transfer restrictions to. O |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group"
```

---

## GET /rest/api/3/group

**Get group**

This operation is deprecated, use [`group/member`](#api-rest-api-3-group-member-get).

Returns all users in a group.

**[Permissions](#permissions) required:** either of:

 *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | The ID of the group. This parameter cannot be used |
| `expand` | query | string | No | List of fields to expand. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group"
```

---

## POST /rest/api/3/group

**Create group**

Creates a group.

**[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group"
```

---

## GET /rest/api/3/group/bulk

**Bulk get groups**

Returns a [paginated](#pagination) list of groups.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `groupId` | query | array | No | The ID of a group. To specify multiple IDs, pass m |
| `groupName` | query | array | No | The name of a group. To specify multiple names, pa |
| `accessType` | query | string | No | The access level of a group. Valid values: 'site-a |
| `applicationKey` | query | string | No | The application key of the product user groups to  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group/bulk"
```

---

## GET /rest/api/3/group/member

**Get users from group**

Returns a [paginated](#pagination) list of all users in a group.

Note that users are ordered by username, however the username is not returned in the results due to privacy reasons.

**[Permissions](#permissions) required:** either of:

 *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | The ID of the group. This parameter cannot be used |
| `includeInactiveUsers` | query | boolean | No | Include inactive users. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page (nu |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group/member"
```

---

## DELETE /rest/api/3/group/user

**Remove user from group**

Removes a user from a group.

**[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | The ID of the group. This parameter cannot be used |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | Yes | The account ID of the user, which uniquely identif |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group/user"
```

---

## POST /rest/api/3/group/user

**Add user to group**

Adds a user to a group.

**[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `groupname` | query | string | No | As a group's name can change, use of `groupId` is  |
| `groupId` | query | string | No | The ID of the group. This parameter cannot be used |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/group/user"
```

---

## GET /rest/api/3/groups/picker

**Find groups**

Returns a list of groups whose names contain a query string. A list of group names can be provided to exclude groups from the results.

The primary use case for this resource is to populate a group picker suggestions list. To this end, the returned object includes the `html` field where the matched query term is highlighted in the group name with the HTML strong tag. Also, the groups list is wrapped in a response object that contains a header for use in the picker, specifically *Showing X of Y matching groups*.

The list returns with the groups sorted. If no groups match the list criteria, an empty list is returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg). Anonymous calls and calls by users without the required permission return an empty list.

*Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Without this permission, calls where query is not an exact match to an existing group will return an empty list.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `accountId` | query | string | No | This parameter is deprecated, setting it does not  |
| `query` | query | string | No | The string to find in group names. |
| `exclude` | query | array | No | As a group's name can change, use of `excludeGroup |
| `excludeId` | query | array | No | A group ID to exclude from the result. To exclude  |
| `maxResults` | query | integer | No | The maximum number of groups to return. The maximu |
| `caseInsensitive` | query | boolean | No | Whether the search for groups should be case insen |
| `userName` | query | string | No | This parameter is no longer available. See the [de |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/groups/picker"
```

---
