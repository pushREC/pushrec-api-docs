---
created: 2026-01-09
tags: [type/api-reference, api/commit-statuses]
api_name: Bitbucket API
category: Commit statuses
endpoint_count: 4
---

# Bitbucket API - Commit Statuses

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/statuses

**List commit statuses for a commit**

Returns all statuses (e.g. build results) for a specific commit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `refname` | query | string | No | If specified, only return commit status objects th |
| `q` | query | string | No | Query string to narrow down the response as per
[f |
| `sort` | query | string | No | Field by which the results should be sorted as per |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/statuses"
```

---

## POST /repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build

**Create a build status for a commit**

Creates a new build status against the specified commit.

If the specified key already exists, the existing status object will
be overwritten.

Example:

```
curl https://api.bitbucket.org/2.0/repositories/my-workspace/my-repo/commit/e10dae226959c2194f2b07b077c07762d93821cf/statuses/build/           -X POST -u jdoe -H 'Content-Type: application/json'           -d '{
    "key": "MY-BUILD",
    "state": "SUCCESSFUL",
    "description": "42 tests passed",
    "url": "https://www.example.org/my-build-result"
  }'
```

When creating a new commit status, you can use a URI template for the URL.
Templates are URLs that contain variable names that Bitbucket will
evaluate at runtime whenever the URL is displayed anywhere similar to
parameter substitution in
[Bitbucket Connect](https://developer.atlassian.com/bitbucket/concepts/context-parameters.html).
For example, one could use `https://foo.com/builds/{repository.full_name}`
which Bitbucket will turn into `https://foo.com/builds/foo/bar` at render time.
The context variables available are `repository` and `commit`.

To associate a commit status to a pull request, the refname field must be set to the source branch
of the pull request.

Example:
```
curl https://api.bitbucket.org/2.0/repositories/my-workspace/my-repo/commit/e10dae226959c2194f2b07b077c07762d93821cf/statuses/build/           -X POST -u jdoe -H 'Content-Type: application/json'           -d '{
    "key": "MY-BUILD",
    "state": "SUCCESSFUL",
    "description": "42 tests passed",
    "url": "https://www.example.org/my-build-result",
    "refname": "my-pr-branch"
  }'
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The new commit status object. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build/{key}

**Get a build status for a commit**

Returns the specified build status for a commit.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build/{key}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build/{key}

**Update a build status for a commit**

Used to update the current status of a build status object on the
specific commit.

This operation can also be used to change other properties of the
build status:

* `state`
* `name`
* `description`
* `url`
* `refname`

The `key` cannot be changed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | No | The updated build status object |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/statuses/build/{key}"
```

---
