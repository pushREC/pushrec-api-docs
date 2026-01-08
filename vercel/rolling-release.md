---
created: 2026-01-08
tags: [type/api-reference, api/rolling-release]
api_name: Vercel API
category: rolling-release
endpoint_count: 7
---

# Vercel API - Rolling-Release

[[README|Back to Overview]]

---

## GET /v1/projects/{idOrName}/rolling-release/billing

**Get rolling release billing status**

Get the Rolling Releases billing status for a project. The team level billing status is used to determine if the project can be configured for rolling releases.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/billing"
```

---

## GET /v1/projects/{idOrName}/rolling-release/config

**Get rolling release configuration**

Get the Rolling Releases configuration for a project. The project-level config is simply a template that will be used for any future rolling release, and not the configuration for any active rolling release.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/config"
```

---

## DELETE /v1/projects/{idOrName}/rolling-release/config

**Delete rolling release configuration**

Disable Rolling Releases for a project means that future deployments will not undergo a rolling release. Changing the config never alters a rollout that's already in-flight—it only affects the next production deployment. If you want to also stop the current rollout, call this endpoint to disable the feature, and then call either the /complete or /abort endpoint.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/config"
```

---

## PATCH /v1/projects/{idOrName}/rolling-release/config

**Update the rolling release settings for the project**

Update (or disable) Rolling Releases for a project. Changing the config never alters a rollout that's already in-flight. It only affects the next production deployment. This also applies to disabling Rolling Releases. If you want to also stop the current rollout, call this endpoint to disable the feature, and then call either the /complete or /abort endpoint. Note: Enabling Rolling Releases automatically enables skew protection on the project with the default value if it wasn't configured already.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/config"
```

---

## GET /v1/projects/{idOrName}/rolling-release

**Get the active rolling release information for a project**

Return the Rolling Release for a project, regardless of whether the rollout is active, aborted, or completed. If the feature is enabled but no deployment has occurred yet, null will be returned.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `state` | query | string | No | Filter by rolling release state |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release"
```

---

## POST /v1/projects/{idOrName}/rolling-release/approve-stage

**Update the active rolling release to the next stage for a project**

Advance a rollout to the next stage. This is only needed when rolling releases is configured to require manual approval.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/approve-stage"
```

---

## POST /v1/projects/{idOrName}/rolling-release/complete

**Complete the rolling release for the project**

Force-complete a Rolling Release. The canary deployment will begin serving 100% of the traffic.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | Project ID or project name (URL-encoded) |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/projects/{idOrName}/rolling-release/complete"
```

---
