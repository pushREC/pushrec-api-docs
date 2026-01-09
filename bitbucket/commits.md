---
created: 2026-01-09
tags: [type/api-reference, api/commits]
api_name: Bitbucket API
category: Commits
endpoint_count: 16
---

# Bitbucket API - Commits

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}

**Get a commit**

Returns the specified commit.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/commit/{commit}/approve

**Unapprove a commit**

Redact the authenticated user's approval of the specified commit.

This operation is only available to users that have explicit access to
the repository. In contrast, just the fact that a repository is
publicly accessible to users does not give them the ability to approve
commits.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/approve"
```

---

## POST /repositories/{workspace}/{repo_slug}/commit/{commit}/approve

**Approve a commit**

Approve the specified commit as the authenticated user.

This operation is only available to users that have explicit access to
the repository. In contrast, just the fact that a repository is
publicly accessible to users does not give them the ability to approve
commits.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/approve"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/comments

**List a commit's comments**

Returns the commit's comments.

This includes both global and inline comments.

The default sorting is oldest to newest and can be overridden with
the `sort` query parameter.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `q` | query | string | No | Query string to narrow down the response as per
[f |
| `sort` | query | string | No | Field by which the results should be sorted as per |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/comments"
```

---

## POST /repositories/{workspace}/{repo_slug}/commit/{commit}/comments

**Create comment for a commit**

Creates new comment on the specified commit.

To post a reply to an existing comment, include the `parent.id` field:

```
$ curl https://api.bitbucket.org/2.0/repositories/atlassian/prlinks/commit/db9ba1e031d07a02603eae0e559a7adc010257fc/comments/ \
  -X POST -u evzijst \
  -H 'Content-Type: application/json' \
  -d '{"content": {"raw": "One more thing!"},
       "parent": {"id": 5728901}}'
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The specified comment. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/comments"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}

**Delete a commit comment**

Deletes the specified commit comment.

Note that deleting comments that have visible replies that point to
them will not really delete the resource. This is to retain the integrity
of the original comment tree. Instead, the `deleted` element is set to
`true` and the content is blanked out. The comment will continue to be
returned by the collections and self endpoints.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}

**Get a commit comment**

Returns the specified commit comment.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}

**Update a commit comment**

Used to update the contents of a comment. Only the content of the comment can be updated.

```
$ curl https://api.bitbucket.org/2.0/repositories/atlassian/prlinks/commit/7f71b5/comments/5728901 \
  -X PUT -u evzijst \
  -H 'Content-Type: application/json' \
  -d '{"content": {"raw": "One more thing!"}'
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The updated comment. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/comments/{comment_id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/commits

**List commits**

These are the repository's commits. They are paginated and returned
in reverse chronological order, similar to the output of `git log`.
Like these tools, the DAG can be filtered.

#### GET /repositories/{workspace}/{repo_slug}/commits/

Returns all commits in the repo in topological order (newest commit
first). All branches and tags are included (similar to
`git log --all`).

#### GET /repositories/{workspace}/{repo_slug}/commits/?exclude=master

Returns all commits in the repo that are not on master
(similar to `git log --all ^master`).

#### GET /repositories/{workspace}/{repo_slug}/commits/?include=foo&include=bar&exclude=fu&exclude=fubar

Returns all commits that are on refs `foo` or `bar`, but not on `fu` or
`fubar` (similar to `git log foo bar ^fu ^fubar`).

An optional `path` parameter can be specified that will limit the
results to commits that affect that path. `path` can either be a file
or a directory. If a directory is specified, commits are returned that
have modified any file in the directory tree rooted by `path`. It is
important to note that if the `path` parameter is specified, the commits
returned by this endpoint may no longer be a DAG, parent commits that
do not modify the path will be omitted from the response.

#### GET /repositories/{workspace}/{repo_slug}/commits/?path=README.md&include=foo&include=bar&exclude=master

Returns all commits that are on refs `foo` or `bar`, but not on `master`
that changed the file README.md.

#### GET /repositories/{workspace}/{repo_slug}/commits/?path=src/&include=foo&include=bar&exclude=master

Returns all commits that are on refs `foo` or `bar`, but not on `master`
that changed to a file in any file in the directory src or its children.

Because the response could include a very large number of commits, it
is paginated. Follow the 'next' link in the response to navigate to the
next page of commits. As with other paginated resources, do not
construct your own links.

When the include and exclude parameters are more than can fit in a
query string, clients can use a `x-www-form-urlencoded` POST instead.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commits"
```

---

## POST /repositories/{workspace}/{repo_slug}/commits

**List commits with include/exclude**

Identical to `GET /repositories/{workspace}/{repo_slug}/commits`,
except that POST allows clients to place the include and exclude
parameters in the request body to avoid URL length issues.

**Note that this resource does NOT support new commit creation.**

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commits"
```

---

## GET /repositories/{workspace}/{repo_slug}/commits/{revision}

**List commits for revision**

These are the repository's commits. They are paginated and returned
in reverse chronological order, similar to the output of `git log`.
Like these tools, the DAG can be filtered.

#### GET /repositories/{workspace}/{repo_slug}/commits/master

Returns all commits on ref `master` (similar to `git log master`).

#### GET /repositories/{workspace}/{repo_slug}/commits/dev?include=foo&exclude=master

Returns all commits on ref `dev` or `foo`, except those that are reachable on
`master` (similar to `git log dev foo ^master`).

An optional `path` parameter can be specified that will limit the
results to commits that affect that path. `path` can either be a file
or a directory. If a directory is specified, commits are returned that
have modified any file in the directory tree rooted by `path`. It is
important to note that if the `path` parameter is specified, the commits
returned by this endpoint may no longer be a DAG, parent commits that
do not modify the path will be omitted from the response.

#### GET /repositories/{workspace}/{repo_slug}/commits/dev?path=README.md&include=foo&include=bar&exclude=master

Returns all commits that are on refs `dev` or `foo` or `bar`, but not on `master`
that changed the file README.md.

#### GET /repositories/{workspace}/{repo_slug}/commits/dev?path=src/&include=foo&exclude=master

Returns all commits that are on refs `dev` or `foo`, but not on `master`
that changed to a file in any file in the directory src or its children.

Because the response could include a very large number of commits, it
is paginated. Follow the 'next' link in the response to navigate to the
next page of commits. As with other paginated resources, do not
construct your own links.

When the include and exclude parameters are more than can fit in a
query string, clients can use a `x-www-form-urlencoded` POST instead.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commits/{revision}"
```

---

## POST /repositories/{workspace}/{repo_slug}/commits/{revision}

**List commits for revision using include/exclude**

Identical to `GET /repositories/{workspace}/{repo_slug}/commits/{revision}`,
except that POST allows clients to place the include and exclude
parameters in the request body to avoid URL length issues.

**Note that this resource does NOT support new commit creation.**

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commits/{revision}"
```

---

## GET /repositories/{workspace}/{repo_slug}/diff/{spec}

**Compare two commits**

Produces a raw git-style diff.

#### Single commit spec

If the `spec` argument to this API is a single commit, the diff is
produced against the first parent of the specified commit.

#### Two commit spec

Two commits separated by `..` may be provided as the `spec`, e.g.,
`3a8b42..9ff173`. When two commits are provided and the `topic` query
parameter is true, this API produces a 2-way three dot diff.
This is the diff between source commit and the merge base of the source
commit and the destination commit. When the `topic` query param is false,
a simple git-style diff is produced.

The two commits are interpreted as follows:

* First commit: the commit containing the changes we wish to preview
* Second commit: the commit representing the state to which we want to
  compare the first commit
* **Note**: This is the opposite of the order used in `git diff`.

#### Comparison to patches

While similar to patches, diffs:

* Don't have a commit header (username, commit message, etc)
* Support the optional `path=foo/bar.py` query param to filter
  the diff to just that one file diff

#### Response

The raw diff is returned as-is, in whatever encoding the files in the
repository use. It is not decoded into unicode. As such, the
content-type is `text/plain`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `context` | query | string | No | Generate diffs with <n> lines of context instead o |
| `path` | query | string | No | Limit the diff to a particular file (this paramete |
| `ignore_whitespace` | query | string | No | Generate diffs that ignore whitespace. |
| `binary` | query | string | No | Generate diffs that include binary files, true if  |
| `renames` | query | string | No | Whether to perform rename detection, true if omitt |
| `merge` | query | string | No | This parameter is deprecated. The 'topic' paramete |
| `topic` | query | string | No | If true, returns 2-way 'three-dot' diff.
This is a |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/diff/{spec}"
```

---

## GET /repositories/{workspace}/{repo_slug}/diffstat/{spec}

**Compare two commit diff stats**

Produces a response in JSON format with a record for every path
modified, including information on the type of the change and the
number of lines added and removed.

#### Single commit spec

If the `spec` argument to this API is a single commit, the diff is
produced against the first parent of the specified commit.

#### Two commit spec

Two commits separated by `..` may be provided as the `spec`, e.g.,
`3a8b42..9ff173`. When two commits are provided and the `topic` query
parameter is true, this API produces a 2-way three dot diff.
This is the diff between source commit and the merge base of the source
commit and the destination commit. When the `topic` query param is false,
a simple git-style diff is produced.

The two commits are interpreted as follows:

* First commit: the commit containing the changes we wish to preview
* Second commit: the commit representing the state to which we want to
  compare the first commit
* **Note**: This is the opposite of the order used in `git diff`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/diffstat/{spec}"
```

---

## GET /repositories/{workspace}/{repo_slug}/merge-base/{revspec}

**Get the common ancestor between two commits**

Returns the best common ancestor between two commits, specified in a revspec
of 2 commits (e.g. 3a8b42..9ff173).

If more than one best common ancestor exists, only one will be returned. It is
unspecified which will be returned.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/merge-base/{revspec}"
```

---

## GET /repositories/{workspace}/{repo_slug}/patch/{spec}

**Get a patch for two commits**

Produces a raw patch for a single commit (diffed against its first
parent), or a patch-series for a revspec of 2 commits (e.g.
`3a8b42..9ff173` where the first commit represents the source and the
second commit the destination).

In case of the latter (diffing a revspec), a patch series is returned
for the commits on the source branch (`3a8b42` and its ancestors in
our example).

While similar to diffs, patches:

* Have a commit header (username, commit message, etc)
* Do not support the `path=foo/bar.py` query parameter

The raw patch is returned as-is, in whatever encoding the files in the
repository use. It is not decoded into unicode. As such, the
content-type is `text/plain`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/patch/{spec}"
```

---
