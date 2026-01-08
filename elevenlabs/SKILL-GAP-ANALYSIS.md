# ElevenLabs Skill vs API Gap Analysis

> **Generated:** 2026-01-08
> **API Source:** `openapi.json` (Official ElevenLabs OpenAPI 3.0 spec)
> **Skill Path:** `~/.claude/skills/elevenlabs/`
> **Purpose:** Enable developer to achieve 100% API coverage for voice agent creation

---

## Executive Summary

| Metric | Count |
|--------|-------|
| **Total ConvAI API Endpoints** | 96 |
| **Currently Implemented in Skill** | 14 |
| **Missing Endpoints** | 82 |
| **Coverage** | 14.6% |

### Critical Gaps for Voice Agents

| Category | API Endpoints | Skill Coverage | Priority |
|----------|---------------|----------------|----------|
| MCP Servers | 13 | 0 | **P0 - BLOCKING** |
| Tools | 6 | 0 | **P0 - BLOCKING** |
| Agents | 20 | 5 | P1 |
| Knowledge Base | 17 | 4 | P1 |
| Conversations | 8 | 3 | P2 |
| Settings | 4 | 1 | P2 |
| Secrets | 4 | 0 | P2 |
| Testing | 3 | 0 | P3 |
| Telephony | 3 | 0 | P3 |
| Integrations | 6 | 0 | P3 |
| Phone Numbers | 5 | 0 | P3 |
| Batch Calling | 5 | 0 | P3 |

---

## P0: BLOCKING - MCP Servers (0/13 implemented)

**Why Critical:** Without MCP server creation, agents cannot have external tools like web search, scraping, or any custom capabilities.

### API Endpoints

| Method | Endpoint | Summary | Skill Status |
|--------|----------|---------|--------------|
| POST | `/v1/convai/mcp-servers` | Create MCP Server | ❌ MISSING |
| GET | `/v1/convai/mcp-servers` | List MCP Servers | ❌ MISSING |
| GET | `/v1/convai/mcp-servers/{mcp_server_id}` | Get MCP Server | ❌ MISSING |
| PATCH | `/v1/convai/mcp-servers/{mcp_server_id}` | Update MCP Server | ❌ MISSING |
| DELETE | `/v1/convai/mcp-servers/{mcp_server_id}` | Delete MCP Server | ❌ MISSING |
| GET | `/v1/convai/mcp-servers/{mcp_server_id}/tools` | List MCP Server Tools | ❌ MISSING |
| PATCH | `/v1/convai/mcp-servers/{mcp_server_id}/approval-policy` | Update Approval Policy | ❌ MISSING |
| POST | `/v1/convai/mcp-servers/{mcp_server_id}/tool-approvals` | Create Tool Approval | ❌ MISSING |
| DELETE | `/v1/convai/mcp-servers/{mcp_server_id}/tool-approvals/{tool_name}` | Delete Tool Approval | ❌ MISSING |
| POST | `/v1/convai/mcp-servers/{mcp_server_id}/tool-configs` | Create Tool Config Override | ❌ MISSING |
| GET | `/v1/convai/mcp-servers/{mcp_server_id}/tool-configs/{tool_name}` | Get Tool Config Override | ❌ MISSING |
| PATCH | `/v1/convai/mcp-servers/{mcp_server_id}/tool-configs/{tool_name}` | Update Tool Config Override | ❌ MISSING |
| DELETE | `/v1/convai/mcp-servers/{mcp_server_id}/tool-configs/{tool_name}` | Delete Tool Config Override | ❌ MISSING |

### Required Schema: `MCPServerConfig-Input`

```json
{
  "url": "string (required) - HTTPS endpoint",
  "name": "string (required) - Display name",
  "transport": "SSE | STREAMABLE_HTTP (default: SSE)",
  "approval_policy": "auto_approve_all | require_approval_all | require_approval_per_tool",
  "secret_token": "ConvAISecretLocator | null",
  "request_headers": "object | null",
  "description": "string",
  "force_pre_tool_speech": "boolean (default: false)",
  "disable_interruptions": "boolean (default: false)",
  "tool_call_sound": "ToolCallSoundType | null",
  "tool_call_sound_behavior": "auto | always (default: auto)",
  "execution_mode": "immediate | post_tool_speech | async (default: immediate)",
  "disable_compression": "boolean (default: false)"
}
```

### Proposed CLI Commands

```bash
# Create MCP server
python mcp.py create \
  --name "Bright Data" \
  --url "https://mcp.example.com/sse" \
  --transport SSE \
  --approval-policy auto_approve_all

# List MCP servers
python mcp.py list

# Get MCP server details
python mcp.py get <mcp_server_id>

# Delete MCP server
python mcp.py delete <mcp_server_id>

# List tools from MCP server
python mcp.py tools <mcp_server_id>
```

---

## P0: BLOCKING - Tools (0/6 implemented)

**Why Critical:** Custom webhook tools enable agents to call external APIs during conversations.

### API Endpoints

| Method | Endpoint | Summary | Skill Status |
|--------|----------|---------|--------------|
| POST | `/v1/convai/tools` | Add Tool | ❌ MISSING |
| GET | `/v1/convai/tools` | Get Tools | ❌ MISSING |
| GET | `/v1/convai/tools/{tool_id}` | Get Tool | ❌ MISSING |
| PATCH | `/v1/convai/tools/{tool_id}` | Update Tool | ❌ MISSING |
| DELETE | `/v1/convai/tools/{tool_id}` | Delete Tool | ❌ MISSING |
| GET | `/v1/convai/tools/{tool_id}/dependent-agents` | Get Dependent Agents | ❌ MISSING |

### Tool Types

1. **Webhook Tool** - Calls external HTTP endpoint
2. **Client Tool** - Handled by client-side code
3. **System Tool** - Built-in ElevenLabs tools

### Required Schema: `WebhookToolConfig-Input`

```json
{
  "type": "webhook",
  "name": "string (required) - pattern: ^[a-zA-Z0-9_-]{1,64}$",
  "description": "string (required) - When to use the tool",
  "response_timeout_secs": "integer 5-120 (default: 20)",
  "disable_interruptions": "boolean (default: false)",
  "force_pre_tool_speech": "boolean (default: false)",
  "execution_mode": "immediate | post_tool_speech | async",
  "api_schema": {
    "url": "string - Webhook endpoint",
    "method": "GET | POST | PUT | DELETE",
    "headers": "object",
    "body_schema": "object - JSON Schema for request body",
    "query_params": "object"
  }
}
```

### Proposed CLI Commands

```bash
# Create webhook tool
python tools.py create \
  --type webhook \
  --name "web_search" \
  --description "Search the web for information" \
  --url "https://api.example.com/search" \
  --method POST

# List tools
python tools.py list

# Get tool details
python tools.py get <tool_id>

# Delete tool
python tools.py delete <tool_id>
```

---

## P1: Agents (5/20 implemented)

### Current Implementation

| Method | Endpoint | Skill Status |
|--------|----------|--------------|
| POST | `/v1/convai/agents/create` | ✅ `sdk.create_agent()` |
| GET | `/v1/convai/agents` | ✅ `sdk.list_agents()` |
| GET | `/v1/convai/agents/{agent_id}` | ✅ `sdk.get_agent()` |
| DELETE | `/v1/convai/agents/{agent_id}` | ✅ `sdk.delete_agent()` |
| GET | `/v1/convai/conversations` (per agent) | ✅ `sdk.list_conversations()` |

### Missing Endpoints

| Method | Endpoint | Summary | Priority |
|--------|----------|---------|----------|
| PATCH | `/v1/convai/agents/{agent_id}` | Update Agent Settings | P1 |
| GET | `/v1/convai/agents/{agent_id}/widget` | Get Widget Config | P2 |
| GET | `/v1/convai/agents/{agent_id}/link` | Get Shareable Link | P2 |
| POST | `/v1/convai/agents/{agent_id}/avatar` | Set Agent Avatar | P3 |
| POST | `/v1/convai/agents/{agent_id}/duplicate` | Duplicate Agent | P2 |
| POST | `/v1/convai/agents/{agent_id}/simulate-conversation` | Simulate Conversation | P2 |
| POST | `/v1/convai/agents/{agent_id}/simulate-conversation/stream` | Simulate (Stream) | P2 |
| GET | `/v1/convai/agent/{agent_id}/knowledge-base/size` | Get KB Size | P3 |
| POST | `/v1/convai/agent/{agent_id}/llm-usage/calculate` | Calculate LLM Usage | P3 |
| POST | `/v1/convai/agents/{agent_id}/run-tests` | Run Tests on Agent | P2 |

### Critical Missing: Agent Update (PATCH)

Currently cannot update an agent after creation. Required for:
- Adding/removing tools
- Changing prompts
- Updating voice settings
- Modifying webhook configuration

---

## P1: Knowledge Base (4/17 implemented)

### Current Implementation

| Method | Endpoint | Skill Status |
|--------|----------|--------------|
| POST | `/v1/convai/knowledge-base/file` | ✅ `kb.upload_file()` |
| POST | `/v1/convai/knowledge-base/url` | ✅ `kb.upload_url()` |
| POST | `/v1/convai/knowledge-base/text` | ✅ `kb.upload_text()` |
| GET | `/v1/convai/knowledge-base` | ✅ `kb.list_agent_knowledge_base()` |

### Missing Endpoints

| Method | Endpoint | Summary | Priority |
|--------|----------|---------|----------|
| POST | `/v1/convai/knowledge-base` | Generic Add to KB | P2 |
| PATCH | `/v1/convai/knowledge-base/{documentation_id}` | Update Document | P1 |
| GET | `/v1/convai/knowledge-base/{documentation_id}` | Get Document | P2 |
| DELETE | `/v1/convai/knowledge-base/{documentation_id}` | Delete Document | P1 |
| GET | `/v1/convai/knowledge-base/{documentation_id}/content` | Get Content | P2 |
| GET | `/v1/convai/knowledge-base/{documentation_id}/chunk/{chunk_id}` | Get Chunk | P3 |
| GET | `/v1/convai/knowledge-base/{documentation_id}/dependent-agents` | Get Dependent Agents | P3 |
| POST | `/v1/convai/knowledge-base/rag-index` | Compute RAG Indexes | P2 |
| GET | `/v1/convai/knowledge-base/rag-index` | Get RAG Overview | P2 |
| POST | `/v1/convai/knowledge-base/{documentation_id}/rag-index` | Compute Doc RAG Index | P2 |
| GET | `/v1/convai/knowledge-base/{documentation_id}/rag-index` | Get Doc RAG Indexes | P2 |
| DELETE | `/v1/convai/knowledge-base/{documentation_id}/rag-index/{rag_index_id}` | Delete RAG Index | P3 |
| GET | `/v1/convai/knowledge-base/summaries` | Get KB Summaries | P3 |

---

## P2: Conversations (3/8 implemented)

### Current Implementation

| Method | Endpoint | Skill Status |
|--------|----------|--------------|
| GET | `/v1/convai/conversations` | ✅ `sdk.list_conversations()` |
| GET | `/v1/convai/conversations/{conversation_id}` | ✅ `sdk.get_conversation()` |
| GET | `/v1/convai/conversation/token` | ✅ (via widget) |

### Missing Endpoints

| Method | Endpoint | Summary |
|--------|----------|---------|
| DELETE | `/v1/convai/conversations/{conversation_id}` | Delete Conversation |
| GET | `/v1/convai/conversations/{conversation_id}/audio` | Get Audio Recording |
| POST | `/v1/convai/conversations/{conversation_id}/feedback` | Send Feedback |
| GET | `/v1/convai/conversation/get-signed-url` | Get Signed URL |

---

## P2: Settings (1/4 implemented)

### Current Implementation

| Method | Endpoint | Skill Status |
|--------|----------|--------------|
| GET | `/v1/convai/settings` | ✅ Partial (MCP enable) |

### Missing Endpoints

| Method | Endpoint | Summary |
|--------|----------|---------|
| PATCH | `/v1/convai/settings` | Update Settings (full) |
| GET | `/v1/convai/settings/dashboard` | Get Dashboard Settings |
| PATCH | `/v1/convai/settings/dashboard` | Update Dashboard Settings |

---

## P2: Secrets (0/4 implemented)

**Why Important:** Secrets are needed for secure API keys in MCP servers and webhook tools.

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/secrets` | Create Workspace Secret |
| GET | `/v1/convai/secrets` | Get Workspace Secrets |
| PATCH | `/v1/convai/secrets/{secret_id}` | Update Secret |
| DELETE | `/v1/convai/secrets/{secret_id}` | Delete Secret |

---

## P3: Testing (0/3 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/agent-testing/create` | Create Response Test |
| GET | `/v1/convai/agent-testing/{test_id}` | Get Test |
| PUT | `/v1/convai/agent-testing/{test_id}` | Update Test |
| DELETE | `/v1/convai/agent-testing/{test_id}` | Delete Test |
| GET | `/v1/convai/agent-testing` | List Tests |
| POST | `/v1/convai/agent-testing/summaries` | Get Test Summaries |
| GET | `/v1/convai/test-invocations` | List Test Invocations |
| GET | `/v1/convai/test-invocations/{test_invocation_id}` | Get Test Invocation |
| POST | `/v1/convai/test-invocations/{test_invocation_id}/resubmit` | Resubmit Tests |

---

## P3: Telephony (0/3 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/twilio/outbound-call` | Twilio Outbound Call |
| POST | `/v1/convai/twilio/register-call` | Register Twilio Call |
| POST | `/v1/convai/sip-trunk/outbound-call` | SIP Trunk Outbound Call |

---

## P3: Integrations (0/6 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/whatsapp/outbound-call` | WhatsApp Outbound Call |
| POST | `/v1/convai/whatsapp-accounts` | Import WhatsApp Account |
| GET | `/v1/convai/whatsapp-accounts` | List WhatsApp Accounts |
| GET | `/v1/convai/whatsapp-accounts/{phone_number_id}` | Get WhatsApp Account |
| PATCH | `/v1/convai/whatsapp-accounts/{phone_number_id}` | Update WhatsApp Account |
| DELETE | `/v1/convai/whatsapp-accounts/{phone_number_id}` | Delete WhatsApp Account |

---

## P3: Phone Numbers (0/5 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/phone-numbers` | Import Phone Number |
| GET | `/v1/convai/phone-numbers` | List Phone Numbers |
| GET | `/v1/convai/phone-numbers/{phone_number_id}` | Get Phone Number |
| PATCH | `/v1/convai/phone-numbers/{phone_number_id}` | Update Phone Number |
| DELETE | `/v1/convai/phone-numbers/{phone_number_id}` | Delete Phone Number |

---

## P3: Batch Calling (0/5 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| POST | `/v1/convai/batch-calling/submit` | Submit Batch Call |
| GET | `/v1/convai/batch-calling/workspace` | Get All Batch Calls |
| GET | `/v1/convai/batch-calling/{batch_id}` | Get Batch Call |
| POST | `/v1/convai/batch-calling/{batch_id}/cancel` | Cancel Batch Call |
| POST | `/v1/convai/batch-calling/{batch_id}/retry` | Retry Batch Call |

---

## P3: Analytics (0/1 implemented)

| Method | Endpoint | Summary |
|--------|----------|---------|
| GET | `/v1/convai/analytics/live-count` | Get Live Count |

---

## Implementation Roadmap

### Phase 1: P0 - Unblock Tool Usage (Est: 2-3 days)

1. **Create `scripts/commands/mcp.py`**
   - `mcp.py create` - Create MCP server
   - `mcp.py list` - List MCP servers
   - `mcp.py get` - Get MCP server details
   - `mcp.py delete` - Delete MCP server
   - `mcp.py tools` - List tools from server

2. **Create `scripts/commands/tools.py`**
   - `tools.py create` - Create webhook/client tool
   - `tools.py list` - List tools
   - `tools.py get` - Get tool details
   - `tools.py delete` - Delete tool

3. **Update `sdk.py`**
   - Add `create_mcp_server()`
   - Add `list_mcp_servers()`
   - Add `get_mcp_server()`
   - Add `delete_mcp_server()`
   - Add `create_tool()`
   - Add `list_tools()`
   - Add `get_tool()`
   - Add `delete_tool()`

### Phase 2: P1 - Complete Agent Lifecycle (Est: 1-2 days)

1. **Add to `sdk.py`**
   - `update_agent()` - PATCH agent settings

2. **Update `agents.py`**
   - `agents.py update` command

3. **Add KB operations**
   - `kb.py delete` - Delete document
   - `kb.py update` - Update document

### Phase 3: P2 - Settings & Secrets (Est: 1 day)

1. **Create `scripts/commands/secrets.py`**
   - CRUD for workspace secrets

2. **Update settings**
   - Full settings update support

### Phase 4: P3 - Advanced Features (Est: 2-3 days)

1. Testing framework
2. Telephony integration
3. WhatsApp integration
4. Batch calling
5. Phone number management

---

## SDK Method Mapping

### Current `sdk.py` Methods

| Method | API Endpoint | Status |
|--------|--------------|--------|
| `create_agent()` | POST /v1/convai/agents/create | ✅ |
| `get_agent()` | GET /v1/convai/agents/{id} | ✅ |
| `list_agents()` | GET /v1/convai/agents | ✅ |
| `delete_agent()` | DELETE /v1/convai/agents/{id} | ✅ |
| `list_conversations()` | GET /v1/convai/conversations | ✅ |
| `get_conversation()` | GET /v1/convai/conversations/{id} | ✅ |
| `search_voices()` | GET /v1/voices | ✅ |
| `get_voice()` | GET /v1/voices/{id} | ✅ |
| `search_voice_library()` | GET /v1/voices/shared | ✅ |
| `check_connection()` | GET /v1/voices | ✅ |
| `get_subscription_info()` | GET /v1/user/subscription | ✅ |

### Required New Methods

| Method | API Endpoint | Priority |
|--------|--------------|----------|
| `create_mcp_server()` | POST /v1/convai/mcp-servers | P0 |
| `list_mcp_servers()` | GET /v1/convai/mcp-servers | P0 |
| `get_mcp_server()` | GET /v1/convai/mcp-servers/{id} | P0 |
| `delete_mcp_server()` | DELETE /v1/convai/mcp-servers/{id} | P0 |
| `list_mcp_server_tools()` | GET /v1/convai/mcp-servers/{id}/tools | P0 |
| `create_tool()` | POST /v1/convai/tools | P0 |
| `list_tools()` | GET /v1/convai/tools | P0 |
| `get_tool()` | GET /v1/convai/tools/{id} | P0 |
| `delete_tool()` | DELETE /v1/convai/tools/{id} | P0 |
| `update_agent()` | PATCH /v1/convai/agents/{id} | P1 |
| `delete_kb_document()` | DELETE /v1/convai/knowledge-base/{id} | P1 |
| `create_secret()` | POST /v1/convai/secrets | P2 |
| `list_secrets()` | GET /v1/convai/secrets | P2 |
| `delete_secret()` | DELETE /v1/convai/secrets/{id} | P2 |
| `delete_conversation()` | DELETE /v1/convai/conversations/{id} | P2 |
| `get_conversation_audio()` | GET /v1/convai/conversations/{id}/audio | P2 |

---

## File Structure Recommendation

```
~/.claude/skills/elevenlabs/
├── SKILL.md
├── scripts/
│   ├── core/
│   │   ├── sdk.py              # Add MCP/Tool methods
│   │   ├── mcp_manager.py      # NEW: MCP server management
│   │   ├── tool_manager.py     # NEW: Tool management
│   │   ├── secrets_manager.py  # NEW: Secrets management
│   │   └── ...
│   └── commands/
│       ├── agents.py           # Add update command
│       ├── mcp.py              # NEW: MCP server CLI
│       ├── tools.py            # NEW: Tools CLI
│       ├── secrets.py          # NEW: Secrets CLI
│       └── ...
└── templates/
    └── ...
```

---

## Verification Checklist

After implementation, verify each endpoint works:

- [ ] MCP: Create server with URL
- [ ] MCP: List servers shows created server
- [ ] MCP: Get server returns full config
- [ ] MCP: List tools shows available tools
- [ ] MCP: Delete server removes it
- [ ] Tools: Create webhook tool
- [ ] Tools: List tools shows created tool
- [ ] Tools: Delete tool removes it
- [ ] Agent: Create with MCP server ID
- [ ] Agent: Create with tool ID
- [ ] Agent: Verify agent can use tools in conversation
- [ ] Agent: Update agent settings
- [ ] KB: Delete document
- [ ] Secrets: Create secret
- [ ] Secrets: Use secret in MCP server config

---

*Report generated: 2026-01-08*
*API Source: Official ElevenLabs OpenAPI 3.0 specification*
*Coverage: 14.6% (14/96 endpoints)*
