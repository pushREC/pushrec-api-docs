---
created: 2026-01-09
tags: [type/api-reference, api/workflows]
api_name: Slack Web API
category: workflows
endpoint_count: 3
---

# Slack Web API - Workflows

[[README|Back to Overview]]

---

## GET /workflows.stepCompleted

Indicate that an app's step in a workflow completed execution.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `workflow.st |
| `workflow_step_execute_id` | query | string | Yes | Context identifier that maps to the correct workfl |
| `outputs` | query | string | No | Key-value object of outputs from your step. Keys o |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workflows.stepCompleted"
```

---

## GET /workflows.stepFailed

Indicate that an app's step in a workflow failed to execute.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `workflow.st |
| `workflow_step_execute_id` | query | string | Yes | Context identifier that maps to the correct workfl |
| `error` | query | string | Yes | A JSON-based object with a `message` property that |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workflows.stepFailed"
```

---

## GET /workflows.updateStep

Update the configuration for a workflow extension step.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `workflow.st |
| `workflow_step_edit_id` | query | string | Yes | A context identifier provided with `view_submissio |
| `inputs` | query | string | No | A JSON key-value map of inputs required from a use |
| `outputs` | query | string | No | An JSON array of output objects used during step e |
| `step_name` | query | string | No | An optional field that can be used to override the |
| `step_image_url` | query | string | No | An optional field that can be used to override app |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workflows.updateStep"
```

---
