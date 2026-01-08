---
created: 2026-01-08
tags: [type/api-reference, api/beta-features]
api_name: Clerk Backend API
category: Beta Features
endpoint_count: 3
---

# Clerk Backend API - Beta Features

[[README|Back to Overview]]

---

## PATCH /beta_features/instance_settings

**Update instance settings**

Updates the settings of an instance

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/beta_features/instance_settings"
```

---

## PUT /beta_features/domain

**Update production instance domain**

Change the domain of a production instance.

Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.

WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/beta_features/domain"
```

---

## POST /instance/change_domain

**Update production instance domain**

Change the domain of a production instance.

Changing the domain requires updating the [DNS records](https://clerk.com/docs/deployments/overview#dns-records) accordingly, deploying new [SSL certificates](https://clerk.com/docs/deployments/overview#deploy), updating your Social Connection's redirect URLs and setting the new keys in your code.

WARNING: Changing your domain will invalidate all current user sessions (i.e. users will be logged out). Also, while your application is being deployed, a small downtime is expected to occur.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.clerk.com/v1/instance/change_domain"
```

---
