---
created: 2026-01-09
tags: [type/api-reference, api/workspaces]
api_name: Bitbucket API
category: Workspaces
endpoint_count: 15
---

# Bitbucket API - Workspaces

[[README|Back to Overview]]

---

## GET /user/permissions/workspaces

**List workspaces for the current user**

Returns an object for each workspace the caller is a member of, and
their effective role - the highest level of privilege the caller has.
If a user is a member of multiple groups with distinct roles, only the
highest level is returned.

Permissions can be:

* `owner`
* `collaborator`
* `member`

**The `collaborator` role is being removed from the Bitbucket Cloud API. For more information,
see the [deprecation announcement](/cloud/bitbucket/deprecation-notice-collaborator-role/).**

**When you move your administration from Bitbucket Cloud to admin.atlassian.com, the following fields on
`workspace_membership` will no longer be present: `last_accessed` and `added_on`. See the
[deprecation announcement](/cloud/bitbucket/announcement-breaking-change-workspace-membership/).**

Results may be further [filtered or sorted](/cloud/bitbucket/rest/intro/#filtering) by
workspace or permission by adding the following query string parameters:

* `q=workspace.slug="bbworkspace1"` or `q=permission="owner"`
* `sort=workspace.slug`

Note that the query parameter values need to be URL escaped so that `=`
would become `%3D`.

This endpoint is deprecated and will be replaced with a new endpoint by end of calendar year 2025.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response. See
[fi |
| `sort` | query | string | No | 
Name of a response property to sort results. See
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/user/permissions/workspaces"
```

---

## GET /workspaces

**List workspaces for user**

Returns a list of workspaces accessible by the authenticated user.

Results may be further [filtered or sorted](/cloud/bitbucket/rest/intro/#filtering) by
workspace or permission by adding the following query string parameters:

* `q=slug="bbworkspace1"` or `q=is_private=true`
* `sort=created_on`

Note that the query parameter values need to be URL escaped so that `=`
would become `%3D`.

**The `collaborator` role is being removed from the Bitbucket Cloud API. For more information,
see the [deprecation announcement](/cloud/bitbucket/deprecation-notice-collaborator-role/).**

This endpoint is deprecated and will be replaced with a new endpoint by end of calendar year 2025.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `role` | query | string | No | 
            Filters the workspaces based on the a |
| `q` | query | string | No | 
Query string to narrow down the response. See
[fi |
| `sort` | query | string | No | 
Name of a response property to sort results. See
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces"
```

---

## GET /workspaces/{workspace}

**Get a workspace**

Returns the requested workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}"
```

---

## GET /workspaces/{workspace}/hooks

**List webhooks for a workspace**

Returns a paginated list of webhooks installed on this workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/hooks"
```

---

## POST /workspaces/{workspace}/hooks

**Create a webhook for a workspace**

Creates a new webhook on the specified workspace.

Workspace webhooks are fired for events from all repositories contained
by that workspace.

Example:

```
$ curl -X POST -u credentials -H 'Content-Type: application/json'
  https://api.bitbucket.org/2.0/workspaces/my-workspace/hooks
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

This call requires the webhook scope, as well as any scope
that applies to the events that the webhook subscribes to. In the
example above that means: `webhook`, `repository` and `issue`.

The `url` must properly resolve and cannot be an internal, non-routed address.

Only workspace owners can install webhooks on workspaces.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/hooks"
```

---

## DELETE /workspaces/{workspace}/hooks/{uid}

**Delete a webhook for a workspace**

Deletes the specified webhook subscription from the given workspace.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/hooks/{uid}"
```

---

## GET /workspaces/{workspace}/hooks/{uid}

**Get a webhook for a workspace**

Returns the webhook with the specified id installed on the given
workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/hooks/{uid}"
```

---

## PUT /workspaces/{workspace}/hooks/{uid}

**Update a webhook for a workspace**

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
  "/workspaces/{workspace}/hooks/{uid}"
```

---

## GET /workspaces/{workspace}/members

**List users in a workspace**

Returns all members of the requested workspace.

This endpoint additionally supports [filtering](/cloud/bitbucket/rest/intro/#filtering) by
email address, if called by a workspace administrator, integration or workspace access
token. This is done by adding the following query string parameter:

* `q=user.email IN ("user1@org.com","user2@org.com")`

When filtering by email, you can query up to 90 addresses at a time.
Note that the query parameter values need to be URL escaped, so the final query string
should be:

* `q=user.email%20IN%20(%22user1@org.com%22,%22user2@org.com%22)`

Email addresses that you filter by (and only these email addresses) can be included in the
response using the `fields` query parameter:

* `&fields=+values.user.email` - add the `email` field to the default `user` response object
* `&fields=values.user.email,values.user.account_id` - only return user email addresses and
account IDs

Once again, all query parameter values must be URL escaped.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/members"
```

---

## GET /workspaces/{workspace}/members/{member}

**Get user membership for a workspace**

Returns the workspace membership, which includes
a `User` object for the member and a `Workspace` object
for the requested workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/members/{member}"
```

---

## GET /workspaces/{workspace}/permissions

**List user permissions in a workspace**

Returns the list of members in a workspace
and their permission levels.
Permission can be:
* `owner`
* `collaborator`
* `member`

**The `collaborator` role is being removed from the Bitbucket Cloud API. For more information,
see the [deprecation announcement](/cloud/bitbucket/deprecation-notice-collaborator-role/).**

**When you move your administration from Bitbucket Cloud to admin.atlassian.com, the following fields on
`workspace_membership` will no longer be present: `last_accessed` and `added_on`. See the
[deprecation announcement](/cloud/bitbucket/announcement-breaking-change-workspace-membership/).**

Results may be further [filtered](/cloud/bitbucket/rest/intro/#filtering) by
permission by adding the following query string parameters:

* `q=permission="owner"`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | 
Query string to narrow down the response as per
[ |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/permissions"
```

---

## GET /workspaces/{workspace}/permissions/repositories

**List all repository permissions for a workspace**

Returns an object for each repository permission for all of a
workspace's repositories.

Permissions returned are effective permissions: the highest level of
permission the user has. This does not distinguish between direct and
indirect (group) privileges.

Only users with admin permission for the team may access this resource.

Permissions can be:

* `admin`
* `write`
* `read`

Results may be further [filtered or sorted](/cloud/bitbucket/rest/intro/#filtering)
by repository, user, or permission by adding the following query string
parameters:

* `q=repository.name="geordi"` or `q=permission>"read"`
* `sort=user.display_name`

Note that the query parameter values need to be URL escaped so that `=`
would become `%3D`.

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
  "/workspaces/{workspace}/permissions/repositories"
```

---

## GET /workspaces/{workspace}/permissions/repositories/{repo_slug}

**List a repository permissions for a workspace**

Returns an object for the repository permission of each user in the
requested repository.

Permissions returned are effective permissions: the highest level of
permission the user has. This does not distinguish between direct and
indirect (group) privileges.

Only users with admin permission for the repository may access this resource.

Permissions can be:

* `admin`
* `write`
* `read`

Results may be further [filtered or sorted](/cloud/bitbucket/rest/intro/#filtering)
by user, or permission by adding the following query string parameters:

* `q=permission>"read"`
* `sort=user.display_name`

Note that the query parameter values need to be URL escaped so that `=`
would become `%3D`.

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
  "/workspaces/{workspace}/permissions/repositories/{repo_slug}"
```

---

## GET /workspaces/{workspace}/projects

**List projects in a workspace**

Returns the list of projects in this workspace.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects"
```

---

## GET /workspaces/{workspace}/pullrequests/{selected_user}

**List workspace pull requests for a user**

Returns all workspace pull requests authored by the specified user.

By default only open pull requests are returned. This can be controlled
using the `state` query parameter. To retrieve pull requests that are
in one of multiple states, repeat the `state` parameter for each
individual state.

This endpoint also supports filtering and sorting of the results. See
[filtering and sorting](/cloud/bitbucket/rest/intro/#filtering) for more details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `state` | query | string | No | Only return pull requests that are in this state.  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pullrequests/{selected_user}"
```

---
