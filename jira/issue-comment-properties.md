---
created: 2026-01-09
tags: [type/api-reference, api/issue-comment-properties]
api_name: The Jira Cloud platform REST API
category: Issue comment properties
endpoint_count: 4
---

# The Jira Cloud platform REST API - Issue Comment Properties

[[README|Back to Overview]]

---

## GET /rest/api/3/comment/{commentId}/properties

**Get comment property keys**

Returns the keys of all the properties of a comment.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the comment has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `commentId` | path | string | Yes | The ID of the comment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/comment/{commentId}/properties"
```

---

## DELETE /rest/api/3/comment/{commentId}/properties/{propertyKey}

**Delete comment property**

Deletes a comment property.

**[Permissions](#permissions) required:** either of:

 *  *Edit All Comments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete a property from any comment.
 *  *Edit Own Comments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete a property from a comment created by the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `commentId` | path | string | Yes | The ID of the comment. |
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/comment/{commentId}/properties/{propertyKey}"
```

---

## GET /rest/api/3/comment/{commentId}/properties/{propertyKey}

**Get comment property**

Returns the value of a comment property.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If the comment has visibility restrictions, belongs to the group or has the role visibility is restricted to.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `commentId` | path | string | Yes | The ID of the comment. |
| `propertyKey` | path | string | Yes | The key of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/comment/{commentId}/properties/{propertyKey}"
```

---

## PUT /rest/api/3/comment/{commentId}/properties/{propertyKey}

**Set comment property**

Creates or updates the value of a property for a comment. Use this resource to store custom data against a comment.

The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

**[Permissions](#permissions) required:** either of:

 *  *Edit All Comments* [project permission](https://confluence.atlassian.com/x/yodKLg) to create or update the value of a property on any comment.
 *  *Edit Own Comments* [project permission](https://confluence.atlassian.com/x/yodKLg) to create or update the value of a property on a comment created by the user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `commentId` | path | string | Yes | The ID of the comment. |
| `propertyKey` | path | string | Yes | The key of the property. The maximum length is 255 |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/comment/{commentId}/properties/{propertyKey}"
```

---
