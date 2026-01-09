---
created: 2026-01-09
tags: [type/api-reference, api/issue-watchers]
api_name: The Jira Cloud platform REST API
category: Issue watchers
endpoint_count: 4
---

# The Jira Cloud platform REST API - Issue Watchers

[[README|Back to Overview]]

---

## POST /rest/api/3/issue/watching

**Get is watching issue bulk**

Returns, for the user, details of the watched status of issues from a list. If an issue ID is invalid, the returned watched status is `false`.

This operation requires the **Allow users to watch issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/watching"
```

---

## DELETE /rest/api/3/issue/{issueIdOrKey}/watchers

**Delete watcher**

Deletes a user as a watcher of an issue.

This operation requires the **Allow users to watch issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  To remove users other than themselves from the watchlist, *Manage watcher list* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |
| `username` | query | string | No | This parameter is no longer available. See the [de |
| `accountId` | query | string | No | The account ID of the user, which uniquely identif |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/watchers"
```

---

## GET /rest/api/3/issue/{issueIdOrKey}/watchers

**Get issue watchers**

Returns the watchers for an issue.

This operation requires the **Allow users to watch issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is ini
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  To see details of users on the watchlist other than themselves, *View voters and watchers* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/watchers"
```

---

## POST /rest/api/3/issue/{issueIdOrKey}/watchers

**Add watcher**

Adds a user as a watcher of an issue by passing the account ID of the user. For example, `"5b10ac8d82e05b22cc7d4ef5"`. If no user is specified the calling user is added.

This operation requires the **Allow users to watch issues** option to be *ON*. This option is set in General configuration for Jira. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  To add users other than themselves to the watchlist, *Manage watcher list* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `issueIdOrKey` | path | string | Yes | The ID or key of the issue. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/issue/{issueIdOrKey}/watchers"
```

---
