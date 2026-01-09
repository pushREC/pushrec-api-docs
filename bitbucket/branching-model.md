---
created: 2026-01-09
tags: [type/api-reference, api/branching-model]
api_name: Bitbucket API
category: Branching model
endpoint_count: 7
---

# Bitbucket API - Branching Model

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/branching-model

**Get the branching model for a repository**

Return the branching model as applied to the repository. This view is
read-only. The branching model settings can be changed using the
[settings](#api-repositories-workspace-repo-slug-branching-model-settings-get) API.

The returned object:

1. Always has a `development` property. `development.branch` contains
   the actual repository branch object that is considered to be the
   `development` branch. `development.branch` will not be present
   if it does not exist.
2. Might have a `production` property. `production` will not
   be present when `production` is disabled.
   `production.branch` contains the actual branch object that is
   considered to be the `production` branch. `production.branch` will
   not be present if it does not exist.
3. Always has a `branch_types` array which contains all enabled branch
   types.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branching-model"
```

---

## GET /repositories/{workspace}/{repo_slug}/branching-model/settings

**Get the branching model config for a repository**

Return the branching model configuration for a repository. The returned
object:

1. Always has a `development` property for the development branch.
2. Always a `production` property for the production branch. The
   production branch can be disabled.
3. The `branch_types` contains all the branch types.
4. `default_branch_deletion` indicates whether branches will be
    deleted by default on merge.

This is the raw configuration for the branching model. A client
wishing to see the branching model with its actual current branches may
find the [active model API](/cloud/bitbucket/rest/api-group-branching-model/#api-repositories-workspace-repo-slug-branching-model-get) more useful.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branching-model/settings"
```

---

## PUT /repositories/{workspace}/{repo_slug}/branching-model/settings

**Update the branching model config for a repository**

Update the branching model configuration for a repository.

The `development` branch can be configured to a specific branch or to
track the main branch. When set to a specific branch it must
currently exist. Only the passed properties will be updated. The
properties not passed will be left unchanged. A request without a
`development` property will leave the development branch unchanged.

It is possible for the `development` branch to be invalid. This
happens when it points at a specific branch that has been
deleted. This is indicated in the `is_valid` field for the branch. It is
not possible to update the settings for `development` if that
would leave the branch in an invalid state. Such a request will be
rejected.

The `production` branch can be a specific branch, the main
branch or disabled. When set to a specific branch it must currently
exist. The `enabled` property can be used to enable (`true`) or
disable (`false`) it. Only the passed properties will be updated. The
properties not passed will be left unchanged. A request without a
`production` property will leave the production branch unchanged.

It is possible for the `production` branch to be invalid. This
happens when it points at a specific branch that has been
deleted. This is indicated in the `is_valid` field for the branch. A
request that would leave `production` enabled and invalid will be
rejected. It is possible to update `production` and make it invalid if
it would also be left disabled.

The `branch_types` property contains the branch types to be updated.
Only the branch types passed will be updated. All updates will be
rejected if it would leave the branching model in an invalid state.
For branch types this means that:

1. The prefixes for all enabled branch types are valid. For example,
   it is not possible to use '*' inside a Git prefix.
2. A prefix of an enabled branch type must not be a prefix of another
   enabled branch type. This is to ensure that a branch can be easily
   classified by its prefix unambiguously.

It is possible to store an invalid prefix if that branch type would be
left disabled. Only the passed properties will be updated. The
properties not passed will be left unchanged. Each branch type must
have a `kind` property to identify it.

The `default_branch_deletion` property is a string. The value of `true`
indicates to delete branches by default. The value of `false` indicates
that branches will not be deleted by default. A request without a
`default_branch_deletion` property will leave it unchanged. Other values
would be ignored.

There is currently a side effect when using this API endpoint. If the
repository is inheriting branching model settings from its project,
updating the branching model for this repository will disable the
project setting inheritance.


We have deprecated this side effect and will remove it on 1 August 2022.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/branching-model/settings"
```

---

## GET /repositories/{workspace}/{repo_slug}/effective-branching-model

**Get the effective, or currently applied, branching model for a repository**

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/effective-branching-model"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/branching-model

**Get the branching model for a project**

Return the branching model set at the project level. This view is
read-only. The branching model settings can be changed using the
[settings](#api-workspaces-workspace-projects-project-key-branching-model-settings-get)
API.

The returned object:

1. Always has a `development` property. `development.name` is
   the user-specified branch that can be inherited by an individual repository's
   branching model.
2. Might have a `production` property. `production` will not
   be present when `production` is disabled.
   `production.name` is the user-specified branch that can be
   inherited by an individual repository's branching model.
3. Always has a `branch_types` array which contains all enabled branch
   types.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/branching-model"
```

---

## GET /workspaces/{workspace}/projects/{project_key}/branching-model/settings

**Get the branching model config for a project**

Return the branching model configuration for a project. The returned
object:

1. Always has a `development` property for the development branch.
2. Always a `production` property for the production branch. The
   production branch can be disabled.
3. The `branch_types` contains all the branch types.
4. `default_branch_deletion` indicates whether branches will be
    deleted by default on merge.


This is the raw configuration for the branching model. A client
wishing to see the branching model with its actual current branches may find the
[active model API](#api-workspaces-workspace-projects-project-key-branching-model-get)
more useful.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/branching-model/settings"
```

---

## PUT /workspaces/{workspace}/projects/{project_key}/branching-model/settings

**Update the branching model config for a project**

Update the branching model configuration for a project.

The `development` branch can be configured to a specific branch or to
track the main branch. Any branch name can be supplied, but will only
successfully be applied to a repository via inheritance if that branch
exists for that repository. Only the passed properties will be updated. The
properties not passed will be left unchanged. A request without a
`development` property will leave the development branch unchanged.

The `production` branch can be a specific branch, the main
branch or disabled. Any branch name can be supplied, but will only
successfully be applied to a repository via inheritance if that branch
exists for that repository. The `enabled` property can be used to enable (`true`)
or disable (`false`) it. Only the passed properties will be updated. The
properties not passed will be left unchanged. A request without a
`production` property will leave the production branch unchanged.

The `branch_types` property contains the branch types to be updated.
Only the branch types passed will be updated. All updates will be
rejected if it would leave the branching model in an invalid state.
For branch types this means that:

1. The prefixes for all enabled branch types are valid. For example,
   it is not possible to use '*' inside a Git prefix.
2. A prefix of an enabled branch type must not be a prefix of another
   enabled branch type. This is to ensure that a branch can be easily
   classified by its prefix unambiguously.

It is possible to store an invalid prefix if that branch type would be
left disabled. Only the passed properties will be updated. The
properties not passed will be left unchanged. Each branch type must
have a `kind` property to identify it.

The `default_branch_deletion` property is a string. The value of `true`
indicates to delete branches by default. The value of `false` indicates
that branches will not be deleted by default. A request without a
`default_branch_deletion` property will leave it unchanged. Other values
would be ignored.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/projects/{project_key}/branching-model/settings"
```

---
