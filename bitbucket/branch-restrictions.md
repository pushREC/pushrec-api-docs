---
created: 2026-01-09
tags: [type/api-reference, api/branch-restrictions]
api_name: Bitbucket API
category: Branch restrictions
endpoint_count: 5
---

# Bitbucket API - Branch Restrictions

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/branch-restrictions

**List branch restrictions**

Returns a paginated list of all branch restrictions on the
repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `kind` | query | string | No | Branch restrictions of this type |
| `pattern` | query | string | No | Branch restrictions applied to branches of this pa |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branch-restrictions"
```

---

## POST /repositories/{workspace}/{repo_slug}/branch-restrictions

**Create a branch restriction rule**

Creates a new branch restriction rule for a repository.

`kind` describes what will be restricted. Allowed values include:
`push`, `force`, `delete`, `restrict_merges`, `require_tasks_to_be_completed`,
`require_approvals_to_merge`, `require_default_reviewer_approvals_to_merge`,
`require_no_changes_requested`, `require_passing_builds_to_merge`, `require_commits_behind`,
`reset_pullrequest_approvals_on_change`, `smart_reset_pullrequest_approvals`,
`reset_pullrequest_changes_requested_on_change`, `require_all_dependencies_merged`,
`enforce_merge_checks`, and `allow_auto_merge_when_builds_pass`.

Different kinds of branch restrictions have different requirements:

* `push` and `restrict_merges` require `users` and `groups` to be
  specified. Empty lists are allowed, in which case permission is
  denied for everybody.

The restriction applies to all branches that match. There are
two ways to match a branch. It is configured in `branch_match_kind`:

1. `glob`: Matches a branch against the `pattern`. A `'*'` in
   `pattern` will expand to match zero or more characters, and every
   other character matches itself. For example, `'foo*'` will match
   `'foo'` and `'foobar'`, but not `'barfoo'`. `'*'` will match all
   branches.
2. `branching_model`: Matches a branch against the repository's
   branching model. The `branch_type` controls the type of branch
   to match. Allowed values include: `production`, `development`,
   `bugfix`, `release`, `feature` and `hotfix`.

The combination of `kind` and match must be unique. This means that
two `glob` restrictions in a repository cannot have the same `kind` and
`pattern`. Additionally, two `branching_model` restrictions in a
repository cannot have the same `kind` and `branch_type`.

`users` and `groups` are lists of users and groups that are except from
the restriction. They can only be configured in `push` and
`restrict_merges` restrictions. The `push` restriction stops a user
pushing to matching branches unless that user is in `users` or is a
member of a group in `groups`. The `restrict_merges` stops a user
merging pull requests to matching branches unless that user is in
`users` or is a member of a group in `groups`. Adding new users or
groups to an existing restriction should be done via `PUT`.

Note that branch restrictions with overlapping matchers is allowed,
but the resulting behavior may be surprising.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The new rule |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branch-restrictions"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/branch-restrictions/{id}

**Delete a branch restriction rule**

Deletes an existing branch restriction rule.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branch-restrictions/{id}"
```

---

## GET /repositories/{workspace}/{repo_slug}/branch-restrictions/{id}

**Get a branch restriction rule**

Returns a specific branch restriction rule.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branch-restrictions/{id}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/branch-restrictions/{id}

**Update a branch restriction rule**

Updates an existing branch restriction rule.

Fields not present in the request body are ignored.

See [`POST`](/cloud/bitbucket/rest/api-group-branch-restrictions/#api-repositories-workspace-repo-slug-branch-restrictions-post) for details.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `_body` | body | string | Yes | The new version of the existing rule |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branch-restrictions/{id}"
```

---
