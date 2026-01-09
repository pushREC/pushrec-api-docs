---
created: 2026-01-09
tags: [type/api-reference, api/issue-votes]
api_name: The Jira Cloud platform REST API
category: Issue votes
endpoint_count: 3
---

# The Jira Cloud platform REST API - Issue Votes

[[README|Back to Overview]]

---

## DELETE /rest/api/3/issue/{issueIdOrKey}/votes

**Delete vote**

Deletes a user's vote from an issue. This is the equivalent of the user clicking *Unvote* on an issue in Jira.

This operation requires the **Allow users to vote on issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/votes"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/votes

**Get votes**

Returns details about the votes on an issue.

This operation requires the **Allow users to vote on issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is ini
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

Note that users with the necessary permissions for this operation but without the *View voters and watchers* project permissions are not returned details in the `voters` field.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/votes"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/votes

**Add vote**

Adds the user's vote to an issue. This is the equivalent of the user clicking *Vote* on an issue in Jira.

This operation requires the **Allow users to vote on issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/votes"
```

---
