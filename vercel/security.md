---
created: 2026-01-08
tags: [type/api-reference, api/security]
api_name: Vercel API
category: security
endpoint_count: 9
---

# Vercel API - Security

[[README|Back to Overview]]

---

## POST /v1/security/attack-mode

**Update Attack Challenge mode**

Update the setting for determining if the project has Attack Challenge mode enabled.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/attack-mode"
```

---

## PUT /v1/security/firewall/config

**Put Firewall Configuration**

Set the firewall configuration to provided rules and settings. Creates or overwrite the existing firewall configuration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/config"
```

---

## PATCH /v1/security/firewall/config

**Update Firewall Configuration**

Process updates to modify the existing firewall config for a project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/config"
```

---

## GET /v1/security/firewall/config/{configVersion}

**Read Firewall Configuration**

Retrieve the specified firewall configuration for a project. The deployed configVersion will be `active`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/config/{configVersion}"
```

---

## GET /v1/security/firewall/attack-status

**Read active attack data**

Retrieve active attack data within the last N days (default: 1 day)

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `since` | query | number | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/attack-status"
```

---

## GET /v1/security/firewall/bypass

**Read System Bypass**

Retrieve the system bypass rules configured for the specified project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `limit` | query | number | No |  |
| `sourceIp` | query | string | No | Filter by source IP |
| `domain` | query | string | No | Filter by domain |
| `projectScope` | query | boolean | No | Filter by project scoped rules |
| `offset` | query | string | No | Used for pagination. Retrieves results after the p |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/bypass"
```

---

## POST /v1/security/firewall/bypass

**Create System Bypass Rule**

Create new system bypass rules

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/bypass"
```

---

## DELETE /v1/security/firewall/bypass

**Remove System Bypass Rule**

Remove system bypass rules

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/bypass"
```

---

## GET /v1/security/firewall/events

**Read Firewall Actions by Project**

Retrieve firewall actions for a project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `startTimestamp` | query | number | No |  |
| `endTimestamp` | query | number | No |  |
| `hosts` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/security/firewall/events"
```

---
