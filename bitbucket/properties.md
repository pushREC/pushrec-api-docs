---
created: 2026-01-09
tags: [type/api-reference, api/properties]
api_name: Bitbucket API
category: properties
endpoint_count: 12
---

# Bitbucket API - Properties

[[README|Back to Overview]]

---

## PUT /repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}

**Update a commit application property**

Update an [application property](/cloud/bitbucket/application-properties/) value stored against a commit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |
| `_body` | body | string | Yes | The application property to create or update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}

**Delete a commit application property**

Delete an [application property](/cloud/bitbucket/application-properties/) value stored against a commit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}

**Get a commit application property**

Retrieve an [application property](/cloud/bitbucket/application-properties/) value stored against a commit.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `commit` | path | string | Yes | The commit. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/commit/{commit}/properties/{app_key}/{property_name}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}

**Update a repository application property**

Update an [application property](/cloud/bitbucket/application-properties/) value stored against a repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |
| `_body` | body | string | Yes | The application property to create or update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}

**Delete a repository application property**

Delete an [application property](/cloud/bitbucket/application-properties/) value stored against a repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}

**Get a repository application property**

Retrieve an [application property](/cloud/bitbucket/application-properties/) value stored against a repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/properties/{app_key}/{property_name}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}

**Update a pull request application property**

Update an [application property](/cloud/bitbucket/application-properties/) value stored against a pull request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `pullrequest_id` | path | string | Yes | The pull request ID. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |
| `_body` | body | string | Yes | The application property to create or update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}

**Delete a pull request application property**

Delete an [application property](/cloud/bitbucket/application-properties/) value stored against a pull request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `pullrequest_id` | path | string | Yes | The pull request ID. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}

**Get a pull request application property**

Retrieve an [application property](/cloud/bitbucket/application-properties/) value stored against a pull request.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The repository container; either the workspace slu |
| `repo_slug` | path | string | Yes | The repository. |
| `pullrequest_id` | path | string | Yes | The pull request ID. |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pullrequests/{pullrequest_id}/properties/{app_key}/{property_name}"
```

---

## PUT /users/{selected_user}/properties/{app_key}/{property_name}

**Update a user application property**

Update an [application property](/cloud/bitbucket/application-properties/) value stored against a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |
| `_body` | body | string | Yes | The application property to create or update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/properties/{app_key}/{property_name}"
```

---

## DELETE /users/{selected_user}/properties/{app_key}/{property_name}

**Delete a user application property**

Delete an [application property](/cloud/bitbucket/application-properties/) value stored against a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/properties/{app_key}/{property_name}"
```

---

## GET /users/{selected_user}/properties/{app_key}/{property_name}

**Get a user application property**

Retrieve an [application property](/cloud/bitbucket/application-properties/) value stored against a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `app_key` | path | string | Yes | The key of the Connect app. |
| `property_name` | path | string | Yes | The name of the property. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/properties/{app_key}/{property_name}"
```

---
