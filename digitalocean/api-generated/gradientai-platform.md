---
created: 2026-01-08
tags: [type/api-reference, api/gradientai-platform]
api_name: DigitalOcean API
category: GradientAI Platform
endpoint_count: 84
---

# DigitalOcean API - Gradientai Platform

[[README|Back to Overview]]

---

## GET /v2/gen-ai/agents

**List Agents**

To list all agents, send a GET request to `/v2/gen-ai/agents`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `only_deployed` | query | boolean | No | Only list agents that are deployed. |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents"
```

---

## POST /v2/gen-ai/agents

**Create an Agent**

To create a new agent, send a POST request to `/v2/gen-ai/agents`. The response body contains a JSON object with the newly created agent object.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents"
```

---

## GET /v2/gen-ai/agents/{agent_uuid}/api_keys

**List Agent API Keys**

To list all agent API keys, send a GET request to `/v2/gen-ai/agents/{agent_uuid}/api_keys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/api_keys"
```

---

## POST /v2/gen-ai/agents/{agent_uuid}/api_keys

**Create an Agent API Key**

To create an agent API key, send a POST request to `/v2/gen-ai/agents/{agent_uuid}/api_keys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/api_keys"
```

---

## PUT /v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}

**Update API Key for an Agent**

To update an agent API key, send a PUT request to `/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}"
```

---

## DELETE /v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}

**Delete API Key for an Agent **

To delete an API key for an agent, send a DELETE request to `/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | A unique identifier for your agent. |
| `api_key_uuid` | path | string | Yes | API key for an agent. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}"
```

---

## PUT /v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}/regenerate

**Regenerate API Key for an Agent**

To regenerate an agent API key, send a PUT request to `/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}/regenerate`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/api_keys/{api_key_uuid}/regenerate"
```

---

## POST /v2/gen-ai/agents/{agent_uuid}/functions

**Add Function Route to an Agent**

To create a function route for an agent, send a POST request to `/v2/gen-ai/agents/{agent_uuid}/functions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/functions"
```

---

## PUT /v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}

**Update Function Route for an Agent**

To update the function route, send a PUT request to `/v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |
| `function_uuid` | path | string | Yes | Function id |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}"
```

---

## DELETE /v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}

**Delete Function Route for an Agent**

To delete a function route from an agent, send a DELETE request to `/v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | The id of the agent the function route belongs to. |
| `function_uuid` | path | string | Yes | The function route to be destroyed. This does not  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/functions/{function_uuid}"
```

---

## POST /v2/gen-ai/agents/{agent_uuid}/knowledge_bases

**Attach Knowledge Bases to an Agent**

To attach knowledge bases to an agent, send a POST request to `/v2/gen-ai/agents/{agent_uuid}/knowledge_bases`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | A unique identifier for an agent. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/knowledge_bases"
```

---

## POST /v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}

**Attach Knowledge Base to an Agent**

To attach a knowledge base to an agent, send a POST request to `/v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}`

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | A unique identifier for an agent. |
| `knowledge_base_uuid` | path | string | Yes | A unique identifier for a knowledge base. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}"
```

---

## DELETE /v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}

**Detach Knowledge Base from an Agent**

To detach a knowledge base from an agent, send a DELETE request to `/v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `agent_uuid` | path | string | Yes | Agent id |
| `knowledge_base_uuid` | path | string | Yes | Knowledge base id |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{agent_uuid}/knowledge_bases/{knowledge_base_uuid}"
```

---

## POST /v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}

**Add Agent Route to an Agent**

To add an agent route to an agent, send a POST request to `/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent_agent_uuid` | path | string | Yes | A unique identifier for the parent agent. |
| `child_agent_uuid` | path | string | Yes | Routed agent id |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}"
```

---

## PUT /v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}

**Update Agent Route for an Agent**

To update an agent route for an agent, send a PUT request to `/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent_agent_uuid` | path | string | Yes | A unique identifier for the parent agent. |
| `child_agent_uuid` | path | string | Yes | Routed agent id |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}"
```

---

## DELETE /v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}

**Delete Agent Route for an Agent**

To delete an agent route from a parent agent, send a DELETE request to `/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `parent_agent_uuid` | path | string | Yes | Pagent agent id |
| `child_agent_uuid` | path | string | Yes | Routed agent id |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{parent_agent_uuid}/child_agents/{child_agent_uuid}"
```

---

## GET /v2/gen-ai/agents/{uuid}

**Retrieve an Existing Agent**

To retrieve details of an agent, GET request to `/v2/gen-ai/agents/{uuid}`. The response body is a JSON object containing the agent.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique agent id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}"
```

---

## PUT /v2/gen-ai/agents/{uuid}

**Update an Agent**

To update an agent, send a PUT request to `/v2/gen-ai/agents/{uuid}`. The response body is a JSON object containing the agent.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique agent id |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}"
```

---

## DELETE /v2/gen-ai/agents/{uuid}

**Delete an Agent**

To delete an agent, send a DELETE request to `/v2/gen-ai/agents/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique agent id |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}"
```

---

## GET /v2/gen-ai/agents/{uuid}/child_agents

**View Agent Routes**

To view agent routes for an agent, send a GET requtest to `/v2/gen-ai/agents/{uuid}/child_agents`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Agent id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}/child_agents"
```

---

## PUT /v2/gen-ai/agents/{uuid}/deployment_visibility

**Update Agent Status**

Check whether an agent is public or private. To update the agent status, send a PUT request to `/v2/gen-ai/agents/{uuid}/deployment_visibility`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique id |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}/deployment_visibility"
```

---

## GET /v2/gen-ai/agents/{uuid}/usage

**Get Agent Usage**

To get agent usage, send a GET request to `/v2/gen-ai/agents/{uuid}/usage`. Returns usage metrics for the specified agent within the provided time range.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Agent id |
| `start` | query | string | No | Return all usage data from this date. |
| `stop` | query | string | No | Return all usage data up to this date, if omitted, |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}/usage"
```

---

## GET /v2/gen-ai/agents/{uuid}/versions

**List Agent Versions**

To list all agent versions, send a GET request to `/v2/gen-ai/agents/{uuid}/versions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Agent uuid |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}/versions"
```

---

## PUT /v2/gen-ai/agents/{uuid}/versions

**Rollback to Agent Version**

To update to a specific agent version, send a PUT request to `/v2/gen-ai/agents/{uuid}/versions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Agent unique identifier |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/agents/{uuid}/versions"
```

---

## GET /v2/gen-ai/anthropic/keys

**List Anthropic API Keys**

To list all Anthropic API keys, send a GET request to `/v2/gen-ai/anthropic/keys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys"
```

---

## POST /v2/gen-ai/anthropic/keys

**Create Anthropic API Key**

To create an Anthropic API key, send a POST request to `/v2/gen-ai/anthropic/keys`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys"
```

---

## GET /v2/gen-ai/anthropic/keys/{api_key_uuid}

**Get Anthropic API Key**

To retrieve details of an Anthropic API key, send a GET request to `/v2/gen-ai/anthropic/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys/{api_key_uuid}"
```

---

## PUT /v2/gen-ai/anthropic/keys/{api_key_uuid}

**Update Anthropic API Key**

To update an Anthropic API key, send a PUT request to `/v2/gen-ai/anthropic/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys/{api_key_uuid}"
```

---

## DELETE /v2/gen-ai/anthropic/keys/{api_key_uuid}

**Delete Anthropic API Key**

To delete an Anthropic API key, send a DELETE request to `/v2/gen-ai/anthropic/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys/{api_key_uuid}"
```

---

## GET /v2/gen-ai/anthropic/keys/{uuid}/agents

**List agents by Anthropic key**

List Agents by Anthropic Key.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique ID of Anthropic key |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/anthropic/keys/{uuid}/agents"
```

---

## POST /v2/gen-ai/evaluation_datasets

**Create Evaluation Dataset**

To create an evaluation dataset, send a POST request to `/v2/gen-ai/evaluation_datasets`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_datasets"
```

---

## POST /v2/gen-ai/evaluation_datasets/file_upload_presigned_urls

**Create Presigned URLs for Evaluation Dataset File Upload**

To create presigned URLs for evaluation dataset file upload, send a POST request to `/v2/gen-ai/evaluation_datasets/file_upload_presigned_urls`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_datasets/file_upload_presigned_urls"
```

---

## GET /v2/gen-ai/evaluation_metrics

**List Evaluation Metrics**

To list all evaluation metrics, send a GET request to `/v2/gen-ai/evaluation_metrics`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_metrics"
```

---

## POST /v2/gen-ai/evaluation_runs

**Run an Evaluation Test Case**

To run an evaluation test case, send a POST request to `/v2/gen-ai/evaluation_runs`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_runs"
```

---

## GET /v2/gen-ai/evaluation_runs/{evaluation_run_uuid}

**Retrieve Information About an Existing Evaluation Run**

To retrive information about an existing evaluation run, send a GET request to `/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `evaluation_run_uuid` | path | string | Yes | Evaluation run UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}"
```

---

## GET /v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results

**Retrieve Results of an Evaluation Run**

To retrieve results of an evaluation run, send a GET request to `/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `evaluation_run_uuid` | path | string | Yes | Evaluation run UUID. |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results"
```

---

## GET /v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results/{prompt_id}

**Retrieve Results of an Evaluation Run Prompt**

To retrieve results of an evaluation run, send a GET request to `/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results/{prompt_id}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `evaluation_run_uuid` | path | string | Yes | Evaluation run UUID. |
| `prompt_id` | path | integer | Yes | Prompt ID to get results for. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_runs/{evaluation_run_uuid}/results/{prompt_id}"
```

---

## GET /v2/gen-ai/evaluation_test_cases

**List Evaluation Test Cases**

To list all evaluation test cases, send a GET request to `/v2/gen-ai/evaluation_test_cases`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_test_cases"
```

---

## POST /v2/gen-ai/evaluation_test_cases

**Create Evaluation Test Case.**

To create an evaluation test-case send a POST request to `/v2/gen-ai/evaluation_test_cases`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_test_cases"
```

---

## GET /v2/gen-ai/evaluation_test_cases/{evaluation_test_case_uuid}/evaluation_runs

**List Evaluation Runs by Test Case**

To list all evaluation runs by test case, send a GET request to `/v2/gen-ai/evaluation_test_cases/{evaluation_test_case_uuid}/evaluation_runs`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `evaluation_test_case_uuid` | path | string | Yes | Evaluation run UUID. |
| `evaluation_test_case_version` | query | integer | No | Version of the test case. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_test_cases/{evaluation_test_case_uuid}/evaluation_runs"
```

---

## GET /v2/gen-ai/evaluation_test_cases/{test_case_uuid}

**Retrieve Information About an Existing Evaluation Test Case**

To retrive information about an existing evaluation test case, send a GET request to `/v2/gen-ai/evaluation_test_case/{test_case_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `test_case_uuid` | path | string | Yes | The test case uuid to retrieve. |
| `evaluation_test_case_version` | query | integer | No | Version of the test case. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_test_cases/{test_case_uuid}"
```

---

## PUT /v2/gen-ai/evaluation_test_cases/{test_case_uuid}

**Update an Evaluation Test Case.**

To update an evaluation test-case send a PUT request to `/v2/gen-ai/evaluation_test_cases/{test_case_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `test_case_uuid` | path | string | Yes | Test-case UUID to update |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/evaluation_test_cases/{test_case_uuid}"
```

---

## GET /v2/gen-ai/indexing_jobs

**List Indexing Jobs for a Knowledge Base**

To list all indexing jobs for a knowledge base, send a GET request to `/v2/gen-ai/indexing_jobs`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs"
```

---

## POST /v2/gen-ai/indexing_jobs

**Start Indexing Job for a Knowledge Base**

To start an indexing job for a knowledge base, send a POST request to `/v2/gen-ai/indexing_jobs`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs"
```

---

## GET /v2/gen-ai/indexing_jobs/{indexing_job_uuid}/data_sources

**List Data Sources for Indexing Job for a Knowledge Base**

To list all datasources for an indexing job, send a GET request to `/v2/gen-ai/indexing_jobs/{indexing_job_uuid}/data_sources`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `indexing_job_uuid` | path | string | Yes | Uuid of the indexing job |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs/{indexing_job_uuid}/data_sources"
```

---

## GET /v2/gen-ai/indexing_jobs/{indexing_job_uuid}/details_signed_url

**Get Signed URL for Indexing Job Details**

To get a signed URL for indexing job details, send a GET request to `/v2/gen-ai/indexing_jobs/{uuid}/details_signed_url`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `indexing_job_uuid` | path | string | Yes | The uuid of the indexing job |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs/{indexing_job_uuid}/details_signed_url"
```

---

## GET /v2/gen-ai/indexing_jobs/{uuid}

**Retrieve Status of Indexing Job for a Knowledge Base**

To get status of an indexing Job for a knowledge base, send a GET request to `/v2/gen-ai/indexing_jobs/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Indexing job id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs/{uuid}"
```

---

## PUT /v2/gen-ai/indexing_jobs/{uuid}/cancel

**Cancel Indexing Job for a Knowledge Base**

To cancel an indexing job for a knowledge base, send a PUT request to `/v2/gen-ai/indexing_jobs/{uuid}/cancel`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | A unique identifier for an indexing job. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/indexing_jobs/{uuid}/cancel"
```

---

## GET /v2/gen-ai/knowledge_bases

**List Knowledge Bases**

To list all knowledge bases, send a GET request to `/v2/gen-ai/knowledge_bases`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases"
```

---

## POST /v2/gen-ai/knowledge_bases

**Create a Knowledge Base**

To create a knowledge base, send a POST request to `/v2/gen-ai/knowledge_bases`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases"
```

---

## POST /v2/gen-ai/knowledge_bases/data_sources/file_upload_presigned_urls

**Create Presigned URLs for Data Source File Upload**

To create presigned URLs for knowledge base data source file upload, send a POST request to `/v2/gen-ai/knowledge_bases/data_sources/file_upload_presigned_urls`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/data_sources/file_upload_presigned_urls"
```

---

## GET /v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources

**List Data Sources for a Knowledge Base**

To list all data sources for a knowledge base, send a GET request to `/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `knowledge_base_uuid` | path | string | Yes | Knowledge base id |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources"
```

---

## POST /v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources

**Add Data Source to a Knowledge Base**

To add a data source to a knowledge base, send a POST request to `/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `knowledge_base_uuid` | path | string | Yes | Knowledge base id |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources"
```

---

## DELETE /v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources/{data_source_uuid}

**Delete a Data Source from a Knowledge Base**

To delete a data source from a knowledge base, send a DELETE request to `/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources/{data_source_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `knowledge_base_uuid` | path | string | Yes | Knowledge base id |
| `data_source_uuid` | path | string | Yes | Data source id |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/data_sources/{data_source_uuid}"
```

---

## GET /v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/indexing_jobs

**List Indexing Jobs for a Knowledge Base**

To list latest 15 indexing jobs for a knowledge base, send a GET request to `/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/indexing_jobs`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `knowledge_base_uuid` | path | string | Yes | Knowledge base uuid in string |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{knowledge_base_uuid}/indexing_jobs"
```

---

## GET /v2/gen-ai/knowledge_bases/{uuid}

**Retrieve Information About an Existing Knowledge Base**

To retrive information about an existing knowledge base, send a GET request to `/v2/gen-ai/knowledge_bases/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Knowledge base id |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{uuid}"
```

---

## PUT /v2/gen-ai/knowledge_bases/{uuid}

**Update a Knowledge Base**

To update a knowledge base, send a PUT request to `/v2/gen-ai/knowledge_bases/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Knowledge base id |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{uuid}"
```

---

## DELETE /v2/gen-ai/knowledge_bases/{uuid}

**Delete a Knowledge Base**

To delete a knowledge base, send a DELETE request to `/v2/gen-ai/knowledge_bases/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Knowledge base id |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/knowledge_bases/{uuid}"
```

---

## GET /v2/gen-ai/models

**List Available Models**

To list all models, send a GET request to `/v2/gen-ai/models`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `usecases` | query | array | No | Include only models defined for the listed usecase |
| `public_only` | query | boolean | No | Only include models that are publicly available. |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models"
```

---

## GET /v2/gen-ai/models/api_keys

**List Model API Keys**

To list all model API keys, send a GET request to `/v2/gen-ai/models/api_keys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models/api_keys"
```

---

## POST /v2/gen-ai/models/api_keys

**Create a Model API Key**

To create a model API key, send a POST request to `/v2/gen-ai/models/api_keys`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models/api_keys"
```

---

## PUT /v2/gen-ai/models/api_keys/{api_key_uuid}

**Update API Key for a Model**

To update a model API key, send a PUT request to `/v2/gen-ai/models/api_keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models/api_keys/{api_key_uuid}"
```

---

## DELETE /v2/gen-ai/models/api_keys/{api_key_uuid}

**Delete API Key for a Model**

To delete an API key for a model, send a DELETE request to `/v2/gen-ai/models/api_keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key for an agent. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models/api_keys/{api_key_uuid}"
```

---

## PUT /v2/gen-ai/models/api_keys/{api_key_uuid}/regenerate

**Regenerate API Key for a Model**

To regenerate a model API key, send a PUT request to `/v2/gen-ai/models/api_keys/{api_key_uuid}/regenerate`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/models/api_keys/{api_key_uuid}/regenerate"
```

---

## POST /v2/gen-ai/oauth2/dropbox/tokens

**Get Oauth2 Dropbox Tokens**

To obtain the refresh token, needed for creation of data sources, send a GET request to `/v2/gen-ai/oauth2/dropbox/tokens`. Pass the code you obtrained from the oauth flow in the field 'code'

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/oauth2/dropbox/tokens"
```

---

## GET /v2/gen-ai/oauth2/url

**Get Oauth2 URL**

To generate an Oauth2-URL for use with your localhost, send a GET request to `/v2/gen-ai/oauth2/url`. Pass 'http://localhost:3000 as redirect_url

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `type` | query | string | No | Type "google" / "dropbox". |
| `redirect_url` | query | string | No | The redirect url. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/oauth2/url"
```

---

## GET /v2/gen-ai/openai/keys

**List OpenAI API Keys**

To list all OpenAI API keys, send a GET request to `/v2/gen-ai/openai/keys`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys"
```

---

## POST /v2/gen-ai/openai/keys

**Create OpenAI API Key**

To create an OpenAI API key, send a POST request to `/v2/gen-ai/openai/keys`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys"
```

---

## GET /v2/gen-ai/openai/keys/{api_key_uuid}

**Get OpenAI API Key**

To retrieve details of an OpenAI API key, send a GET request to `/v2/gen-ai/openai/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys/{api_key_uuid}"
```

---

## PUT /v2/gen-ai/openai/keys/{api_key_uuid}

**Update OpenAI API Key**

To update an OpenAI API key, send a PUT request to `/v2/gen-ai/openai/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys/{api_key_uuid}"
```

---

## DELETE /v2/gen-ai/openai/keys/{api_key_uuid}

**Delete OpenAI API Key**

To delete an OpenAI API key, send a DELETE request to `/v2/gen-ai/openai/keys/{api_key_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `api_key_uuid` | path | string | Yes | API key ID |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys/{api_key_uuid}"
```

---

## GET /v2/gen-ai/openai/keys/{uuid}/agents

**List agents by OpenAI key**

List Agents by OpenAI Key.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | Unique ID of OpenAI key |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/openai/keys/{uuid}/agents"
```

---

## GET /v2/gen-ai/regions

**List Datacenter Regions**

To list all datacenter regions, send a GET request to `/v2/gen-ai/regions`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `serves_inference` | query | boolean | No | Include datacenters that serve inference. |
| `serves_batch` | query | boolean | No | Include datacenters that are capable of running ba |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/regions"
```

---

## POST /v2/gen-ai/scheduled-indexing

**Create scheduled indexing for knowledge base**

To create scheduled indexing for a knowledge base, send a POST request to `/v2/gen-ai/scheduled-indexing`.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/scheduled-indexing"
```

---

## GET /v2/gen-ai/scheduled-indexing/knowledge-base/{knowledge_base_uuid}

**Get Scheduled Indexing for Knowledge Base**

Get Scheduled Indexing for knowledge base using knoweldge base uuid, send a GET request to `/v2/gen-ai/scheduled-indexing/knowledge-base/{knowledge_base_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `knowledge_base_uuid` | path | string | Yes | UUID of the scheduled indexing entry |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/scheduled-indexing/knowledge-base/{knowledge_base_uuid}"
```

---

## DELETE /v2/gen-ai/scheduled-indexing/{uuid}

**Delete Scheduled Indexing**

Delete Scheduled Indexing for knowledge base, send a DELETE request to `/v2/gen-ai/scheduled-indexing/{uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `uuid` | path | string | Yes | UUID of the scheduled indexing |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/scheduled-indexing/{uuid}"
```

---

## GET /v2/gen-ai/workspaces

**List Workspaces**

To list all workspaces, send a GET request to `/v2/gen-ai/workspaces`.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces"
```

---

## POST /v2/gen-ai/workspaces

**Create a Workspace**

To create a new workspace, send a POST request to `/v2/gen-ai/workspaces`. The response body contains a JSON object with the newly created workspace object.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces"
```

---

## GET /v2/gen-ai/workspaces/{workspace_uuid}

**Retrieve an Existing Workspace**

To retrieve details of a workspace, GET request to `/v2/gen-ai/workspaces/{workspace_uuid}`. The response body is a JSON object containing the workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}"
```

---

## PUT /v2/gen-ai/workspaces/{workspace_uuid}

**Update a Workspace**

To update a workspace, send a PUT request to `/v2/gen-ai/workspaces/{workspace_uuid}`. The response body is a JSON object containing the workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace UUID. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}"
```

---

## DELETE /v2/gen-ai/workspaces/{workspace_uuid}

**Delete a Workspace**

To delete a workspace, send a DELETE request to `/v2/gen-ai/workspace/{workspace_uuid}`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace UUID. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}"
```

---

## GET /v2/gen-ai/workspaces/{workspace_uuid}/agents

**List agents by Workspace**

To list all agents by a Workspace, send a GET request to `/v2/gen-ai/workspaces/{workspace_uuid}/agents`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace UUID. |
| `only_deployed` | query | boolean | No | Only list agents that are deployed. |
| `page` | query | integer | No | Page number. |
| `per_page` | query | integer | No | Items per page. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}/agents"
```

---

## PUT /v2/gen-ai/workspaces/{workspace_uuid}/agents

**Move Agents to a Workspace**

To move all listed agents a given workspace, send a PUT request to `/v2/gen-ai/workspaces/{workspace_uuid}/agents`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace uuid to move agents to |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}/agents"
```

---

## GET /v2/gen-ai/workspaces/{workspace_uuid}/evaluation_test_cases

**List Evaluation Test Cases by Workspace**

To list all evaluation test cases by a workspace, send a GET request to `/v2/gen-ai/workspaces/{workspace_uuid}/evaluation_test_cases`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace_uuid` | path | string | Yes | Workspace UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/gen-ai/workspaces/{workspace_uuid}/evaluation_test_cases"
```

---
