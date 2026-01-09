---
created: 2026-01-09
tags: [type/api-reference, api/issue-comments]
api_name: The Jira Cloud platform REST API
category: Issue comments
endpoint_count: 6
---

# The Jira Cloud platform REST API - Issue Comments

[[README|Back to Overview]]

---

## POST /rest/api/3/comment/list

**Get comments by IDs**

Returns a [paginated](#pagination) list of comments specified by a list of comment IDs.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Comments are returned where the user:

 *  has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the comment has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/comment/list"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/comment

**Get comments**

Returns all comments for an issue.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Comments are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the comment has visibility restrictions, belongs to the group or has the role visibility is role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `startAt` | query | integer | No | The index of the first item to return in a page of |
| `maxResults` | query | integer | No | The maximum number of items to return per page. |
| `orderBy` | query | string | No | [Order](#ordering) the results by a field. Accepts |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/comment"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/comment

**Add comment**

Adds a comment to an issue.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* and *Add comments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/comment"
```

---

## DELETE /rest/api/3/issue/{issueIdOrKey}/comment/{id}

**Delete comment**

Deletes a comment.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Delete all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to delete any comment or *Delete own comments* to delete comment created by the user,
 *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `id` | path | string | Yes | The ID of the comment. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/comment/{id}"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/comment/{id}

**Get comment**

Returns a comment.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the comment.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `id` | path | string | Yes | The ID of the comment. |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/comment/{id}"
```

---

## PUT /rest/api/3/issue/{issueIdOrKey}/comment/{id}

**Update comment**

Updates a comment.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue containing the comment is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  *Edit all comments*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any comment or *Edit own comments* to update comment created by the user.
 *  If the comment has visibility restrictions, the user belongs to the group or has the role visibility is restricted to.

**WARNING:** Child comments inherit visibility from their parent comment. Attempting to update a child comment's visibility will result in a 400 (Bad Request) error.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `id` | path | string | Yes | The ID of the comment. |
| `notifyUsers` | query | boolean | No | Whether users are notified when a comment is updat |
| `overrideEditableFlag` | query | boolean | No | Whether screen security is overridden to enable un |
| `expand` | query | string | No | Use [expand](#expansion) to include additional inf |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/comment/{id}"
```

---
