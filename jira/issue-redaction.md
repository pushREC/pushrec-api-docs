---
created: 2026-01-09
tags: [type/api-reference, api/issue-redaction]
api_name: The Jira Cloud platform REST API
category: Issue redaction
endpoint_count: 2
---

# The Jira Cloud platform REST API - Issue Redaction

[[README|Back to Overview]]

---

## POST /rest/api/3/redact

**Redact**

Submit a job to redact issue field data. This will trigger the redaction of the data in the specified fields asynchronously.

The redaction status can be polled using the job id.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/redact"
```

---

## GET /rest/api/3/redact/status/{jobId}

**Get redaction status**

Retrieves the current status of a redaction job ID.

The jobStatus will be one of the following:

 *  IN\_PROGRESS - The redaction job is currently in progress
 *  COMPLETED - The redaction job has completed successfully.
 *  PENDING - The redaction job has not started yet

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `jobId` | path | string | Yes | Redaction job id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://your-domain.atlassian.net/rest/api/3/redact/status/{jobId}"
```

---
