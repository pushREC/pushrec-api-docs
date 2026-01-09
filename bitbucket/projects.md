---
created: 2026-01-09
tags: [type/api-reference, api/projects]
api_name: Bitbucket API
category: Projects
endpoint_count: 16
---

# Bitbucket API - Projects

[[README|Back to Overview]]

---

## POST /workspaces/{workspace}/projects

**Create a project in a workspace**

Creates a new project.

Note that the avatar has to be embedded as either a data-url
or a URL to an external image as shown in the examples below:

```
$ body=$(cat << EOF
{
    "name": "Mars Project",
    "key": "MARS",
    "description": "Software for colonizing mars.",
    "links": {
        "avatar": {
            "href": "data:image/gif;base64,R0lGODlhEAAQAMQAAORHHOVSKudfOulrSOp3WOyDZu6QdvCchPGolfO0o/..."
        }
    },
    "is_private": false
}
EOF
)
$ curl -H "Content-Type: application/json" \
       -X POST \
       -d "$body" \
       https://api.bitbucket.org/2.0/workspaces/teams-in-space/projects/ | jq .
{
  // Serialized project document
}
```

or even:

```
$ body=$(cat << EOF
{
    "name": "Mars Project",
    "key": "MARS",
    "description": "Software for colonizing mars.",
    "links": {
        "avatar": {
            "href": "http://i.imgur.com/72tRx4w.gif"
        }
    },
    "is_private": false
}
EOF
)
$ curl -H "Content-Type: application/json" \
       -X POST \
       -d "$body" \
       https://api.bitbucket.org/2.0/workspaces/teams-in-space/projects/ | jq .
{
  // Serialized project document
}
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects"
```

---

## DELETE /workspaces/{workspace}/projects/{project_key}

**Delete a project for a workspace**

Deletes this project. This is an irreversible operation.

You cannot delete a project that still contains repositories.
To delete the project, [delete](/cloud/bitbucket/rest/api-group-repositories/#api-repositories-workspace-repo-slug-delete)
or transfer the repositories first.

Example:
```
$ curl -X DELETE https://api.bitbucket.org/2.0/workspaces/bbworkspace1/projects/PROJ
```

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}

**Get a project for a workspace**

Returns the requested project.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}"
```

---

## PUT /workspaces/{workspace}/projects/{project_key}

**Update a project for a workspace**

Since this endpoint can be used to both update and to create a
project, the request body depends on the intent.

#### Creation

See the POST documentation for the project collection for an
example of the request body.

Note: The `key` should not be specified in the body of request
(since it is already present in the URL). The `name` is required,
everything else is optional.

#### Update

See the POST documentation for the project collection for an
example of the request body.

Note: The key is not required in the body (since it is already in
the URL). The key may be specified in the body, if the intent is
to change the key itself. In such a scenario, the location of the
project is changed and is returned in the `Location` header of the
response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/default-reviewers

**List the default reviewers in a project**

Return a list of all default reviewers for a project. This is a list of users that will be added as default
reviewers to pull requests for any repository within the project.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/default-reviewers"
```

---

## DELETE /workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}

**Remove the specific user from the project's default reviewers**

Removes a default reviewer from the project.

Example:
```
$ curl https://api.bitbucket.org/2.0/.../default-reviewers/%7Bf0e0e8e9-66c1-4b85-a784-44a9eb9ef1a6%7D

HTTP/1.1 204
```

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}

**Get a default reviewer**

Returns the specified default reviewer.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}"
```

---

## PUT /workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}

**Add the specific user as a default reviewer for the project**

Adds the specified user to the project's list of default reviewers. The method is
idempotent. Accepts an optional body containing the `uuid` of the user to be added.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/default-reviewers/{selected_user}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/permissions-config/groups

**List explicit group permissions for a project**

Returns a paginated list of explicit group permissions for the given project.
This endpoint does not support BBQL features.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/groups"
```

---

## DELETE /workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}

**Delete an explicit group permission for a project**

Deletes the project group permission between the requested project and group, if one exists.

Only users with admin permission for the project may access this resource.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}

**Get an explicit group permission for a project**

Returns the group permission for a given group and project.

Only users with admin permission for the project may access this resource.

Permissions can be:

* `admin`
* `create-repo`
* `write`
* `read`
* `none`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}"
```

---

## PUT /workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}

**Update an explicit group permission for a project**

Updates the group permission, or grants a new permission if one does not already exist.

Only users with admin permission for the project may access this resource.

Due to security concerns, the JWT and OAuth authentication methods are unsupported.
This is to ensure integrations and add-ons are not allowed to change permissions.

Permissions can be:

* `admin`
* `create-repo`
* `write`
* `read`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The permission to grant |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/groups/{group_slug}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/permissions-config/users

**List explicit user permissions for a project**

Returns a paginated list of explicit user permissions for the given project.
This endpoint does not support BBQL features.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/users"
```

---

## DELETE /workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}

**Delete an explicit user permission for a project**

Deletes the project user permission between the requested project and user, if one exists.

Only users with admin permission for the project may access this resource.

Due to security concerns, the JWT and OAuth authentication methods are unsupported.
This is to ensure integrations and add-ons are not allowed to change permissions.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}

**Get an explicit user permission for a project**

Returns the explicit user permission for a given user and project.

Only users with admin permission for the project may access this resource.

Permissions can be:

* `admin`
* `create-repo`
* `write`
* `read`
* `none`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}"
```

---

## PUT /workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}

**Update an explicit user permission for a project**

Updates the explicit user permission for a given user and project. The selected
user must be a member of the workspace, and cannot be the workspace owner.

Only users with admin permission for the project may access this resource.

Due to security concerns, the JWT and OAuth authentication methods are unsupported.
This is to ensure integrations and add-ons are not allowed to change permissions.

Permissions can be:

* `admin`
* `create-repo`
* `write`
* `read`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The permission to grant |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/permissions-config/users/{selected_user_id}"
```

---
