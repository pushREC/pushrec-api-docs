---
created: 2026-01-09
tags: [type/api-reference, api/webhooks]
api_name: Bitbucket API
category: Webhooks
endpoint_count: 2
---

# Bitbucket API - Webhooks

[[README|Back to Overview]]

---

## GET /hook_events

**Get a webhook resource**

Returns the webhook resource or subject types on which webhooks can
be registered.

Each resource/subject type contains an `events` link that returns the
paginated list of specific events each individual subject type can
emit.

This endpoint is publicly accessible and does not require
authentication or scopes.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/hook_events"
```

---

## GET /hook_events/{subject_type}

**List subscribable webhook types**

Returns a paginated list of all valid webhook events for the
specified entity.
**The team and user webhooks are deprecated, and you should use workspace instead.
For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).**

This is public data that does not require any scopes or authentication.

NOTE: The example response is a truncated response object for the `workspace` `subject_type`.
We return the same structure for the other `subject_type` objects.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/hook_events/{subject_type}"
```

---
