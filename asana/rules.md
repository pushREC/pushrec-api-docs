---
created: 2026-01-09
tags: [type/api-reference, api/rules]
api_name: Asana
category: Rules
endpoint_count: 1
---

# Asana - Rules

[[README|Back to Overview]]

---

## POST /rule_triggers/{rule_trigger_gid}/run

**Trigger a rule**

Trigger a rule which uses an ["incoming web request"](/docs/incoming-web-requests) trigger.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/rule_triggers/{rule_trigger_gid}/run"
```

---
