---
created: 2026-01-09
tags: [type/api-reference, api/permissions]
api_name: The Jira Cloud platform REST API
category: Permissions
endpoint_count: 4
---

# The Jira Cloud platform REST API - Permissions

[[README|Back to Overview]]

---

## GET /rest/api/3/mypermissions

**Get my permissions**

Returns a list of permissions indicating which permissions the user has. Details of the user's permissions can be obtained in a global, project, issue or comment context.

The user is reported as having a project permission:

 *  in the global context, if the user has the project permission in any project.
 *  for a project, where the project permission is determined using issue data, if the user meets the permission's criteria for any issue in the project. Otherwise, if the user has the project permission in the project.
 *  for an issue, where a project permission is determined using issue data, if the user has the permission in the issue. Otherwise, if the user has the project permission in the project containing the issue.
 *  for a comment, where the user has both the permission to browse the comment and the project permission for the comment's parent issue. Only the BROWSE\_PROJECTS permission is supported. If a `commentId` is provided whose `permissions` does not equal BROWSE\_PROJECTS, a 400 error will be returned.

This means that users may be shown as having an issue permission (such as EDIT\_ISSUES) in the global context or a project context but may not have the permission for any or all issues. For example, if Reporters have the EDIT\_ISSUES permission a user would be shown as having this permission in the global context or the context of a project, because any user can be a reporter. However, if they are not the user who reported the issue queried they would not have EDIT\_ISSUES permission for that issue.

For [Jira Service Management project permissions](https://support.atlassian.com/jira-cloud-administration/docs/customize-jira-service-management-permissions/), this will be evaluated similarly to a user in the customer portal. For example, if the BROWSE\_PROJECTS permission is granted to Service Project Customer - Portal Access, any users with access to the customer portal will have the BROWSE\_PROJECTS permission.

Global permissions are unaffected by context.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectKey` | query | string | No | The key of project. Ignored if `projectId` is prov |
| `projectId` | query | string | No | The ID of project. |
| `issueKey` | query | string | No | The key of the issue. Ignored if `issueId` is prov |
| `issueId` | query | string | No | The ID of the issue. |
| `permissions` | query | string | No | A list of permission keys. (Required) This paramet |
| `projectUuid` | query | string | No |  |
| `projectConfigurationUuid` | query | string | No |  |
| `commentId` | query | string | No | The ID of the comment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/mypermissions"
```

---

## GET /rest/api/3/permissions

**Get all permissions**

Returns all permissions, including:

 *  global permissions.
 *  project permissions.
 *  global permissions added by plugins.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/permissions"
```

---

## POST /rest/api/3/permissions/check

**Get bulk permissions**

Returns:

 *  for a list of global permissions, the global permissions granted to a user.
 *  for a list of project permissions and lists of projects and issues, for each project permission a list of the projects and issues a user can access or manipulate.

If no account ID is provided, the operation returns details for the logged in user.

Note that:

 *  Invalid project and issue IDs are ignored.
 *  A maximum of 1000 projects and 1000 issues can be checked.
 *  Null values in `globalPermissions`, `projectPermissions`, `projectPermissions.projects`, and `projectPermissions.issues` are ignored.
 *  Empty strings in `projectPermissions.permissions` are ignored.

**Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.

 *  **Classic**: `read:jira-work`
 *  **Granular**: `read:permission:jira`

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to check the permissions for other users, otherwise none. However, Connect apps can make a call from the app server to the product to obtain permission details for any user, without admin permission. This Connect app ability doesn't apply to calls made using AP.request() in a browser.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/permissions/check"
```

---

## POST /rest/api/3/permissions/project

**Get permitted projects**

Returns all the projects where the user is granted a list of project permissions.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/permissions/project"
```

---
