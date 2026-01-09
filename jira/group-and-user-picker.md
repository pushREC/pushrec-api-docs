---
created: 2026-01-09
tags: [type/api-reference, api/group-and-user-picker]
api_name: The Jira Cloud platform REST API
category: Group and user picker
endpoint_count: 1
---

# The Jira Cloud platform REST API - Group And User Picker

[[README|Back to Overview]]

---

## GET /rest/api/3/groupuserpicker

**Find users and groups**

Returns a list of users and groups matching a string. The string is used:

 *  for users, to find a case-insensitive match with display name and e-mail address. Note that if a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.
 *  for groups, to find a case-sensitive match with group name.

For example, if the string *tin* is used, records with the display name *Tina*, email address *sarah@tinplatetraining.com*, and the group *accounting* would be returned.

Optionally, the search can be refined to:

 *  the projects and issue types associated with a custom field, such as a user picker. The search can then be further refined to return only users and groups that have permission to view specific:
    
     *  projects.
     *  issue types.
    
    If multiple projects or issue types are specified, they must be a subset of those enabled for the custom field or no results are returned. For example, if a field is enabled for projects A, B, and C then the search could be limited to projects B and C. However, if the search is limited to projects B and D, nothing is returned.
 *  not return Connect app users and groups.
 *  return groups that have a case-insensitive match with the query.

The primary use case for this resource is to populate a picker field suggestion list with users or groups. To this end, the returned object includes an `html` field for each list. This field highlights the matched query term in the item name with the HTML strong tag. Also, each list is wrapped in a response object that contains a header for use in a picker, specifically *Showing X of Y matching groups*.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/yodKLg).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | Yes | The search string. |
| `maxResults` | query | integer | No | The maximum number of items to return in each list |
| `showAvatar` | query | boolean | No | Whether the user avatar should be returned. If an  |
| `fieldId` | query | string | No | The custom field ID of the field this request is f |
| `projectId` | query | array | No | The ID of a project that returned users and groups |
| `issueTypeId` | query | array | No | The ID of an issue type that returned users and gr |
| `avatarSize` | query | string | No | The size of the avatar to return. If an invalid va |
| `caseInsensitive` | query | boolean | No | Whether the search for groups should be case insen |
| `excludeConnectAddons` | query | boolean | No | Whether Connect app users and groups should be exc |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/groupuserpicker"
```

---
