---
created: 2026-01-09
tags: [type/api-reference, api/service-registry]
api_name: The Jira Cloud platform REST API
category: Service Registry
endpoint_count: 1
---

# The Jira Cloud platform REST API - Service Registry

[[README|Back to Overview]]

---

## GET /rest/atlassian-connect/1/service-registry

**Retrieve the attributes of service registries**

Retrieve the attributes of given service registries.

**[Permissions](#permissions) required:** Only Connect apps can make this request and the servicesIds belong to the tenant you are requesting

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `serviceIds` | query | array | Yes | The ID of the services (the strings starting with  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/atlassian-connect/1/service-registry"
```

---
