---
created: 2026-01-09
tags: [type/api-reference, api/repositories]
api_name: Bitbucket API
category: Repositories
endpoint_count: 25
---

# Bitbucket API - Repositories

[[README|Back to Overview]]

---

## GET /repositories

**List public repositories**

Returns a paginated list of all public repositories.

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

This endpoint is deprecated. We recommend you use the
[workspace scoped alternative](/cloud/bitbucket/rest/api-group-repositories/#api-repositories-workspace-get).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `after` | query | string | No | Filter the results to include only repositories cr |
| `role` | query | string | No | Filters the result based on the authenticated user |
| `q` | query | string | No | Query string to narrow down the response as per [f |
| `sort` | query | string | No | Field by which the results should be sorted as per |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories"
```

---

## GET /repositories/{workspace}

**List repositories in a workspace**

Returns a paginated list of all repositories owned by the specified
workspace.

The result can be narrowed down based on the authenticated user's role.

E.g. with `?role=contributor`, only those repositories that the
authenticated user has write access to are returned (this includes any
repo the user is an admin on, as that implies write access).

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `role` | query | string | No | 
Filters the result based on the authenticated use |
| `q` | query | string | No | 
Query string to narrow down the response as per [ |
| `sort` | query | string | No | 
Field by which the results should be sorted as pe |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}

**Delete a repository**

Deletes the repository. This is an irreversible operation.

This does not affect its forks.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `redirect_to` | query | string | No | If a repository has been moved to a new location,  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}"
```

---

## GET /repositories/{workspace}/{repo_slug}

**Get a repository**

Returns the object describing this repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}"
```

---

## POST /repositories/{workspace}/{repo_slug}

**Create a repository**

Creates a new repository.

Note: In order to set the project for the newly created repository,
pass in either the project key or the project UUID as part of the
request body as shown in the examples below:

```
$ curl -X POST -H "Content-Type: application/json" -d '{
    "scm": "git",
    "project": {
        "key": "MARS"
    }
}' https://api.bitbucket.org/2.0/repositories/teamsinspace/hablanding
```

or

```
$ curl -X POST -H "Content-Type: application/json" -d '{
    "scm": "git",
    "project": {
        "key": "{ba516952-992a-4c2d-acbd-17d502922f96}"
    }
}' https://api.bitbucket.org/2.0/repositories/teamsinspace/hablanding
```

The project must be assigned for all repositories. If the project is not provided,
the repository is automatically assigned to the oldest project in the workspace.

Note: In the examples above, the workspace ID `teamsinspace`,
and/or the repository name `hablanding` can be replaced by UUIDs.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The repository that is to be created. Note that mo |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}"
```

---

## PUT /repositories/{workspace}/{repo_slug}

**Update a repository**

Since this endpoint can be used to both update and to create a
repository, the request body depends on the intent.

#### Creation

See the POST documentation for the repository endpoint for an example
of the request body.

#### Update

Note: Changing the `name` of the repository will cause the location to
be changed. This is because the URL of the repo is derived from the
name (a process called slugification). In such a scenario, it is
possible for the request to fail if the newly created slug conflicts
with an existing repository's slug. But if there is no conflict,
the new location will be returned in the `Location` header of the
response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The repository that is to be updated.

Note that t |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}"
```

---

## GET /repositories/{workspace}/{repo_slug}/forks

**List repository forks**

Returns a paginated list of all the forks of the specified
repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `role` | query | string | No | Filters the result based on the authenticated user |
| `q` | query | string | No | Query string to narrow down the response as per [f |
| `sort` | query | string | No | Field by which the results should be sorted as per |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/forks"
```

---

## POST /repositories/{workspace}/{repo_slug}/forks

**Fork a repository**

Creates a new fork of the specified repository.

#### Forking a repository

To create a fork, specify the workspace explicitly as part of the
request body:

```
$ curl -X POST -u jdoe https://api.bitbucket.org/2.0/repositories/atlassian/bbql/forks \
  -H 'Content-Type: application/json' -d '{
    "name": "bbql_fork",
    "workspace": {
      "slug": "atlassian"
    }
}'
```

To fork a repository into the same workspace, also specify a new `name`.

When you specify a value for `name`, it will also affect the `slug`.
The `slug` is reflected in the repository URL of the new fork. It is
derived from `name` by substituting non-ASCII characters, removes
whitespace, and changes characters to lower case. For example,
`My repo` would turn into `my_repo`.

You need contributor access to create new forks within a workspace.


#### Change the properties of a new fork

By default the fork inherits most of its properties from the parent.
However, since the optional POST body document follows the normal
`repository` JSON schema and you can override the new fork's
properties.

Properties that can be overridden include:

* description
* fork_policy
* language
* mainbranch
* is_private (note that a private repo's fork_policy might prohibit
  the creation of public forks, in which `is_private=False` would fail)
* has_issues (to initialize or disable the new repo's issue tracker --
  note that the actual contents of the parent repository's issue
  tracker are not copied during forking)
* has_wiki (to initialize or disable the new repo's wiki --
  note that the actual contents of the parent repository's wiki are not
  copied during forking)
* project (when forking into a private project, the fork's `is_private`
  must be `true`)

Properties that cannot be modified include:

* scm
* parent
* full_name

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | A repository object. This can be left blank. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/forks"
```

---

## GET /repositories/{workspace}/{repo_slug}/hooks

**List webhooks for a repository**

Returns a paginated list of webhooks installed on this repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/hooks"
```

---

## POST /repositories/{workspace}/{repo_slug}/hooks

**Create a webhook for a repository**

Creates a new webhook on the specified repository.

Example:

```
$ curl -X POST -u credentials -H 'Content-Type: application/json'
  https://api.bitbucket.org/2.0/repositories/my-workspace/my-repo-slug/hooks
  -d '
    {
      "description": "Webhook Description",
      "url": "https://example.com/",
      "active": true,
      "secret": "this is a really bad secret",
      "events": [
        "repo:push",
        "issue:created",
        "issue:updated"
      ]
    }'
```

When the `secret` is provided it will be used as the key to generate a HMAC
digest value sent in the `X-Hub-Signature` header at delivery time. Passing
a `null` or empty `secret` or not passing a `secret` will leave the webhook's
secret unset. Bitbucket only generates the `X-Hub-Signature` when the webhook's
secret is set.

Note that this call requires the webhook scope, as well as any scope
that applies to the events that the webhook subscribes to. In the
example above that means: `webhook`, `repository` and `issue`.

Also note that the `url` must properly resolve and cannot be an
internal, non-routed address.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/hooks"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/hooks/{uid}

**Delete a webhook for a repository**

Deletes the specified webhook subscription from the given
repository.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/hooks/{uid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/hooks/{uid}

**Get a webhook for a repository**

Returns the webhook with the specified id installed on the specified
repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/hooks/{uid}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/hooks/{uid}

**Update a webhook for a repository**

Updates the specified webhook subscription.

The following properties can be mutated:

* `description`
* `url`
* `secret`
* `active`
* `events`

The hook's secret is used as a key to generate the HMAC hex digest sent in the
`X-Hub-Signature` header at delivery time. This signature is only generated
when the hook has a secret.

Set the hook's secret by passing the new value in the `secret` field. Passing a
`null` value in the `secret` field will remove the secret from the hook. The
hook's secret can be left unchanged by not passing the `secret` field in the
request.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/hooks/{uid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/override-settings

**Retrieve the inheritance state for repository settings**

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/override-settings"
```

---

## PUT /repositories/{workspace}/{repo_slug}/override-settings

**Set the inheritance state for repository settings
                **

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/override-settings"
```

---

## GET /repositories/{workspace}/{repo_slug}/permissions-config/groups

**List explicit group permissions for a repository**

Returns a paginated list of explicit group permissions for the given repository.
This endpoint does not support BBQL features.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/groups"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}

**Delete an explicit group permission for a repository**

Deletes the repository group permission between the requested repository and group, if one exists.

Only users with admin permission for the repository may access this resource.

The only authentication method supported for this endpoint is via app passwords.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}"
```

---

## GET /repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}

**Get an explicit group permission for a repository**

Returns the group permission for a given group slug and repository

Only users with admin permission for the repository may access this resource.

Permissions can be:

* `admin`
* `write`
* `read`
* `none`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}

**Update an explicit group permission for a repository**

Updates the group permission, or grants a new permission if one does not already exist.

Only users with admin permission for the repository may access this resource.

The only authentication method supported for this endpoint is via app passwords.

Permissions can be:

* `admin`
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
  "/repositories/{workspace}/{repo_slug}/permissions-config/groups/{group_slug}"
```

---

## GET /repositories/{workspace}/{repo_slug}/permissions-config/users

**List explicit user permissions for a repository**

Returns a paginated list of explicit user permissions for the given repository.
This endpoint does not support BBQL features.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/users"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}

**Delete an explicit user permission for a repository**

Deletes the repository user permission between the requested repository and user, if one exists.

Only users with admin permission for the repository may access this resource.

The only authentication method for this endpoint is via app passwords.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}

**Get an explicit user permission for a repository**

Returns the explicit user permission for a given user and repository.

Only users with admin permission for the repository may access this resource.

Permissions can be:

* `admin`
* `write`
* `read`
* `none`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}

**Update an explicit user permission for a repository**

Updates the explicit user permission for a given user and repository. The selected user must be a member of
the workspace, and cannot be the workspace owner.
Only users with admin permission for the repository may access this resource.

The only authentication method for this endpoint is via app passwords.

Permissions can be:

* `admin`
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
  "/repositories/{workspace}/{repo_slug}/permissions-config/users/{selected_user_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/watchers

**List repositories watchers**

Returns a paginated list of all the watchers on the specified
repository.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/watchers"
```

---

## GET /user/permissions/repositories

**List repository permissions for a user**

Returns an object for each repository the caller has explicit access
to and their effective permission — the highest level of permission the
caller has. This does not return public repositories that the user was
not granted any specific permission in, and does not distinguish between
explicit and implicit privileges.

Permissions can be:

* `admin`
* `write`
* `read`

Results may be further [filtered or sorted](/cloud/bitbucket/rest/intro/#filtering) by
repository or permission by adding the following query string
parameters:

* `q=repository.name="geordi"` or `q=permission>"read"`
* `sort=repository.name`

Note that the query parameter values need to be URL escaped so that `=`
would become `%3D`.

This endpoint is deprecated. We recommend you use the
[workspace scoped alternative](/cloud/bitbucket/rest/api-group-repositories/#api-repositories-workspace-get).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |
| `sort` | query | string | No | 
Name of a response property sort the result by as |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/user/permissions/repositories"
```

---
