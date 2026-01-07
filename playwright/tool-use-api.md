---
created: 2026-01-06
tags:
  - type/research
  - topic/claude-api
  - topic/tool-use
  - project/native-playwright-skill
status: complete
research-wave: 1
agent-id: 04
---

# Claude Tool Use API Deep Dive

> Comprehensive documentation on Claude's tool_use API patterns for implementing custom tools, with focus on designing a native Playwright skill for Claude Code.

## Table of Contents

1. [Tool Definition Schema](#1-tool-definition-schema)
2. [Tool Invocation Flow](#2-tool-invocation-flow)
3. [Response Handling](#3-response-handling)
4. [Best Practices](#4-best-practices)
5. [Advanced Patterns](#5-advanced-patterns)
6. [Anthropic SDK Patterns](#6-anthropic-sdk-patterns)
7. [Design Recommendations for Playwright Skill](#7-design-recommendations-for-playwright-skill)

---

## 1. Tool Definition Schema

### Core Structure

Every tool definition in Claude's API requires three key components:

```json
{
  "name": "tool_name",
  "description": "Detailed description of what the tool does",
  "input_schema": {
    "type": "object",
    "properties": { ... },
    "required": [ ... ]
  }
}
```

### Parameter Definitions

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Must match regex `^[a-zA-Z0-9_-]{1,64}$` |
| `description` | string | Recommended | Detailed plaintext description of tool purpose, usage, and behavior |
| `input_schema` | object | Yes | JSON Schema object defining expected parameters |
| `input_examples` | array | Optional (beta) | Array of example input objects for complex tools |

### JSON Schema Support

Claude supports full JSON Schema for `input_schema`, including:

#### Basic Types

```json
{
  "input_schema": {
    "type": "object",
    "properties": {
      "string_param": {
        "type": "string",
        "description": "A text parameter"
      },
      "number_param": {
        "type": "number",
        "description": "A numeric value"
      },
      "integer_param": {
        "type": "integer",
        "description": "An integer value"
      },
      "boolean_param": {
        "type": "boolean",
        "description": "A true/false value"
      }
    }
  }
}
```

#### Enums and Constraints

```json
{
  "input_schema": {
    "type": "object",
    "properties": {
      "unit": {
        "type": "string",
        "enum": ["celsius", "fahrenheit"],
        "description": "Temperature unit"
      },
      "count": {
        "type": "integer",
        "minimum": 1,
        "maximum": 100
      }
    }
  }
}
```

#### Nested Objects

```json
{
  "input_schema": {
    "type": "object",
    "properties": {
      "location": {
        "type": "object",
        "properties": {
          "city": {"type": "string"},
          "country": {"type": "string"}
        },
        "required": ["city"]
      }
    }
  }
}
```

#### Array Parameters

```json
{
  "input_schema": {
    "type": "object",
    "properties": {
      "tags": {
        "type": "array",
        "items": {"type": "string"},
        "description": "List of tags to apply"
      },
      "coordinates": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "x": {"type": "number"},
            "y": {"type": "number"}
          }
        }
      }
    }
  }
}
```

#### Required vs Optional Parameters

```json
{
  "input_schema": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "Required: The city and state"
      },
      "unit": {
        "type": "string",
        "enum": ["celsius", "fahrenheit"],
        "description": "Optional: defaults to fahrenheit"
      }
    },
    "required": ["location"]
  }
}
```

### Complete Example: Weather Tool

```python
{
    "name": "get_weather",
    "description": "Retrieves the current weather for a given location. The location must be a valid city name with optional state/country. Returns temperature, conditions, humidity, and wind speed. Use this when the user asks about current weather conditions. Does not provide forecasts or historical data.",
    "input_schema": {
        "type": "object",
        "properties": {
            "location": {
                "type": "string",
                "description": "The city and state/country, e.g. 'San Francisco, CA' or 'London, UK'"
            },
            "unit": {
                "type": "string",
                "enum": ["celsius", "fahrenheit"],
                "description": "Temperature unit. Defaults to fahrenheit if not specified."
            }
        },
        "required": ["location"]
    }
}
```

### Strict Mode for Schema Validation (Beta)

For production agents, use `strict: true` to guarantee Claude's tool calls always match your schema:

```python
{
    "name": "create_record",
    "description": "Creates a new database record",
    "strict": true,  # Guarantees schema conformance
    "input_schema": {
        "type": "object",
        "properties": {
            "name": {"type": "string"},
            "age": {"type": "integer"}
        },
        "required": ["name", "age"]
    }
}
```

**Beta Header Required:** `structured-outputs-2025-11-13`

---

## 2. Tool Invocation Flow

### How Claude Decides to Use Tools

1. **Context Analysis**: Claude analyzes the user's query and available tools
2. **Relevance Assessment**: Determines if any tool can help answer the query
3. **Parameter Extraction**: Identifies required parameters from the conversation
4. **Tool Selection**: Chooses the most appropriate tool(s)
5. **Input Generation**: Constructs properly formatted tool input

### Tool Types

Claude supports two categories of tools:

#### Client Tools
- Execute on **your systems**
- Includes user-defined custom tools
- Includes Anthropic-defined tools like computer use, text editor, bash
- Requires you to implement tool execution and return results

#### Server Tools
- Execute on **Anthropic's servers**
- Includes web search (`web_search_20250305`) and web fetch (`web_fetch_20250305`)
- Results automatically incorporated into response
- No additional user interaction needed

### Tool Choice Modes

Control how Claude interacts with tools using the `tool_choice` parameter:

| Mode | Behavior | Use Case |
|------|----------|----------|
| `auto` | Claude decides whether to use tools (default) | General usage, natural conversations |
| `any` | Claude must use one of the provided tools | When tool use is required |
| `tool` | Force a specific tool by name | Deterministic workflows |
| `none` | Prevent any tool use | When you want text-only response |

```python
# Force a specific tool
response = client.messages.create(
    model="claude-sonnet-4-5",
    tools=tools,
    tool_choice={"type": "tool", "name": "get_weather"},
    messages=[...]
)

# Require any tool
response = client.messages.create(
    model="claude-sonnet-4-5",
    tools=tools,
    tool_choice={"type": "any"},
    messages=[...]
)
```

**Important Behaviors:**

- When `tool_choice` is `any` or `tool`, Claude will NOT emit natural language before `tool_use` blocks
- Extended thinking only supports `auto` and `none` modes
- Combine `any` with `strict: true` for guaranteed tool use with schema validation

### Parallel Tool Use

Claude can call multiple tools in a single response for independent operations:

```json
{
  "role": "assistant",
  "content": [
    {"type": "text", "text": "I'll check both locations..."},
    {"type": "tool_use", "id": "toolu_01", "name": "get_weather", "input": {"location": "San Francisco"}},
    {"type": "tool_use", "id": "toolu_02", "name": "get_weather", "input": {"location": "New York"}},
    {"type": "tool_use", "id": "toolu_03", "name": "get_time", "input": {"timezone": "America/Los_Angeles"}},
    {"type": "tool_use", "id": "toolu_04", "name": "get_time", "input": {"timezone": "America/New_York"}}
  ]
}
```

**Disabling Parallel Tool Use:**

```python
response = client.messages.create(
    model="claude-sonnet-4-5",
    tools=tools,
    tool_choice={"type": "auto", "disable_parallel_tool_use": True},
    messages=[...]
)
```

### Sequential Tool Use (Chaining)

For dependent operations, Claude calls tools one at a time:

| Step | Role | Content |
|------|------|---------|
| 1 | User | "What's the weather where I am?" |
| 2 | Assistant | [Tool use for `get_location`] |
| 3 | User | [Tool result: "San Francisco, CA"] |
| 4 | Assistant | [Tool use for `get_weather` with location] |
| 5 | User | [Tool result: "68°F, sunny"] |
| 6 | Assistant | Final natural language response |

---

## 3. Response Handling

### Tool Use Response Structure

When Claude uses a tool, the response includes:

```json
{
  "id": "msg_01Aq9w938a90dw8q",
  "model": "claude-sonnet-4-5",
  "stop_reason": "tool_use",
  "role": "assistant",
  "content": [
    {
      "type": "text",
      "text": "I'll check the weather for you."
    },
    {
      "type": "tool_use",
      "id": "toolu_01A09q90qw90lq917835lq9",
      "name": "get_weather",
      "input": {"location": "San Francisco, CA", "unit": "celsius"}
    }
  ]
}
```

**Key Fields:**

| Field | Description |
|-------|-------------|
| `stop_reason` | `"tool_use"` indicates Claude wants to use a tool |
| `id` | Unique identifier for the tool use block |
| `name` | Tool being invoked |
| `input` | Parameters conforming to `input_schema` |

### Returning Tool Results

After executing the tool, return results in a `tool_result` block:

```python
messages = [
    {"role": "user", "content": "What's the weather in SF?"},
    {
        "role": "assistant",
        "content": [
            {"type": "text", "text": "I'll check..."},
            {"type": "tool_use", "id": "toolu_01", "name": "get_weather", "input": {"location": "SF"}}
        ]
    },
    {
        "role": "user",
        "content": [
            {
                "type": "tool_result",
                "tool_use_id": "toolu_01",  # Must match the tool_use id
                "content": "68°F, partly cloudy"
            }
        ]
    }
]
```

### Tool Result Content Types

#### String Content
```json
{
  "type": "tool_result",
  "tool_use_id": "toolu_01",
  "content": "Simple string result"
}
```

#### Nested Content Blocks
```json
{
  "type": "tool_result",
  "tool_use_id": "toolu_01",
  "content": [
    {"type": "text", "text": "Here's the image:"},
    {
      "type": "image",
      "source": {
        "type": "base64",
        "media_type": "image/png",
        "data": "/9j/4AAQSkZJRg..."
      }
    }
  ]
}
```

#### Document Blocks
```json
{
  "type": "tool_result",
  "tool_use_id": "toolu_01",
  "content": [
    {
      "type": "document",
      "source": {
        "type": "text",
        "media_type": "application/json",
        "data": "{\"temperature\": 68, \"condition\": \"sunny\"}"
      }
    }
  ]
}
```

#### Empty Result
```json
{
  "type": "tool_result",
  "tool_use_id": "toolu_01"
}
```

### Error Reporting

Report tool execution errors with `is_error: true`:

```json
{
  "type": "tool_result",
  "tool_use_id": "toolu_01",
  "content": "ConnectionError: Weather API unavailable (HTTP 500)",
  "is_error": true
}
```

Claude will incorporate the error gracefully: "I'm sorry, I was unable to retrieve the weather because the service is unavailable."

### Parallel Tool Results Formatting

**Critical:** All tool results for parallel calls must be in a SINGLE user message:

```python
# CORRECT: Single message with all results
{
    "role": "user",
    "content": [
        {"type": "tool_result", "tool_use_id": "toolu_01", "content": "Result 1"},
        {"type": "tool_result", "tool_use_id": "toolu_02", "content": "Result 2"},
        {"type": "tool_result", "tool_use_id": "toolu_03", "content": "Result 3"}
    ]
}

# WRONG: Separate messages (will break parallel tool use)
{"role": "user", "content": [{"type": "tool_result", "tool_use_id": "toolu_01", "content": "Result 1"}]},
{"role": "user", "content": [{"type": "tool_result", "tool_use_id": "toolu_02", "content": "Result 2"}]}
```

### Stop Reasons

| Stop Reason | Meaning | Action |
|-------------|---------|--------|
| `tool_use` | Claude wants to use a tool | Execute tool and return result |
| `end_turn` | Claude finished responding | Process final response |
| `max_tokens` | Token limit reached | Retry with higher `max_tokens` |
| `pause_turn` | Long-running server tool paused | Continue conversation |
| `stop_sequence` | Stop sequence encountered | Handle as appropriate |

---

## 4. Best Practices

### Tool Description Excellence

The description is the **most critical factor** in tool performance. Follow these guidelines:

#### What to Include

1. **What the tool does** - Clear explanation of functionality
2. **When to use it** - Conditions that should trigger tool use
3. **When NOT to use it** - Negative examples prevent misuse
4. **Parameter meanings** - What each input represents
5. **Return format** - What data comes back
6. **Caveats and limitations** - Edge cases and restrictions

#### Good Example

```json
{
  "name": "get_stock_price",
  "description": "Retrieves the current stock price for a given ticker symbol. The ticker symbol must be a valid symbol for a publicly traded company on a major US stock exchange like NYSE or NASDAQ. The tool will return the latest trade price in USD. It should be used when the user asks about the current or most recent price of a specific stock. It will not provide any other information about the stock or company. Do not use for cryptocurrencies, futures, or options.",
  "input_schema": {
    "type": "object",
    "properties": {
      "ticker": {
        "type": "string",
        "description": "The stock ticker symbol, e.g. AAPL for Apple Inc., MSFT for Microsoft"
      }
    },
    "required": ["ticker"]
  }
}
```

#### Poor Example

```json
{
  "name": "get_stock_price",
  "description": "Gets the stock price for a ticker.",
  "input_schema": {
    "type": "object",
    "properties": {
      "ticker": {"type": "string"}
    },
    "required": ["ticker"]
  }
}
```

### Naming Conventions

- Use `snake_case` for tool names
- Be descriptive: `search_documents` not `search`
- Include action verbs: `get_`, `create_`, `update_`, `delete_`
- Avoid generic names that could conflict

### Parameter Design Principles

1. **Descriptive property names**: `location` not `loc`
2. **Clear descriptions**: Each property should explain its purpose
3. **Appropriate types**: Use `integer` for counts, `string` for text
4. **Sensible defaults**: Document default values in descriptions
5. **Minimal required fields**: Only require what's truly necessary

### Token Efficiency

Tool definitions consume tokens. Optimize by:

- Keeping descriptions concise but complete
- Using `defer_loading: true` for rarely-used tools (advanced)
- Limiting the number of tools per request when possible

### Tool Use Examples (Beta)

For complex tools, provide input examples:

```python
{
    "name": "search_database",
    "description": "Searches the product database with filters",
    "input_schema": {
        "type": "object",
        "properties": {
            "query": {"type": "string"},
            "filters": {
                "type": "object",
                "properties": {
                    "category": {"type": "string"},
                    "price_min": {"type": "number"},
                    "price_max": {"type": "number"}
                }
            },
            "sort_by": {"type": "string", "enum": ["price", "relevance", "date"]}
        },
        "required": ["query"]
    },
    "input_examples": [
        {"query": "laptop", "sort_by": "price"},
        {"query": "headphones", "filters": {"category": "electronics", "price_max": 200}},
        {"query": "office chair", "filters": {"price_min": 100, "price_max": 500}, "sort_by": "relevance"}
    ]
}
```

**Beta Header Required:** `advanced-tool-use-2025-11-20`

---

## 5. Advanced Patterns

### Multi-Step Tool Orchestration

For complex workflows requiring multiple tools:

```python
async def orchestrated_workflow(client, query):
    messages = [{"role": "user", "content": query}]

    while True:
        response = client.messages.create(
            model="claude-sonnet-4-5",
            max_tokens=4096,
            tools=tools,
            messages=messages
        )

        # Check if Claude wants to use tools
        if response.stop_reason == "tool_use":
            # Execute all tool calls
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    result = execute_tool(block.name, block.input)
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": result
                    })

            # Add assistant response and tool results to messages
            messages.append({"role": "assistant", "content": response.content})
            messages.append({"role": "user", "content": tool_results})
        else:
            # Final response
            return response.content[0].text
```

### Tool Search (Dynamic Discovery)

For agents with many tools, use Tool Search to avoid context bloat:

```python
tools = [
    # Always-loaded critical tools
    {"name": "read_file", "description": "...", "input_schema": {...}},

    # Defer loading for other tools
    {"name": "format_code", "description": "...", "input_schema": {...}, "defer_loading": True},
    {"name": "run_tests", "description": "...", "input_schema": {...}, "defer_loading": True},
    # ... many more tools
]

response = client.beta.messages.create(
    betas=["advanced-tool-use-2025-11-20"],
    model="claude-sonnet-4-5",
    tools=tools,
    messages=[...]
)
```

**Key Benefits:**
- 85% reduction in context consumption
- Only loads 3-5 relevant tools per task
- Improved accuracy on complex tool selection

### Programmatic Tool Calling (Code Execution)

For data-heavy workflows, let Claude orchestrate tools through code:

```python
tools = [
    {
        "name": "query_database",
        "description": "Query the analytics database",
        "input_schema": {...},
        "allowed_callers": ["code_execution_20250825"]  # Enable code calling
    }
]

response = client.beta.messages.create(
    betas=["advanced-tool-use-2025-11-20"],
    model="claude-sonnet-4-5",
    tools=tools,
    messages=[{"role": "user", "content": "Analyze sales by region and summarize"}]
)
```

**Benefits:**
- 37% token reduction on complex tasks
- Eliminates 19+ inference passes
- Only final results enter Claude's context

### State Management Between Calls

Maintain state across tool calls using conversation context:

```python
class ToolStateMachine:
    def __init__(self):
        self.state = {}
        self.messages = []

    def process(self, user_input):
        self.messages.append({"role": "user", "content": user_input})

        response = client.messages.create(
            model="claude-sonnet-4-5",
            tools=self.tools,
            messages=self.messages
        )

        while response.stop_reason == "tool_use":
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    # Execute tool and update state
                    result, new_state = self.execute_with_state(block)
                    self.state.update(new_state)
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": result
                    })

            self.messages.append({"role": "assistant", "content": response.content})
            self.messages.append({"role": "user", "content": tool_results})

            response = client.messages.create(
                model="claude-sonnet-4-5",
                tools=self.tools,
                messages=self.messages
            )

        self.messages.append({"role": "assistant", "content": response.content})
        return response.content[0].text
```

### Fine-Grained Tool Streaming

For low-latency applications, stream tool parameters as they're generated:

```python
# Enable fine-grained streaming
response = client.messages.create(
    model="claude-sonnet-4-5",
    max_tokens=4096,
    tools=tools,
    messages=messages,
    stream=True,
    extra_headers={"anthropic-beta": "fine-grained-tool-streaming-2025-05-14"}
)

for event in response:
    if event.type == "content_block_delta":
        if hasattr(event.delta, "partial_json"):
            # Process streamed tool parameters immediately
            print(event.delta.partial_json, end="", flush=True)
```

**Benefits:**
- Start receiving parameters in ~3s vs ~15s
- Multi-line chunks arrive faster
- Great for long tool inputs

**Caveat:** May receive incomplete JSON if `max_tokens` is reached.

### Interleaved Thinking

Enable Claude to reason between tool calls:

```python
response = client.beta.messages.create(
    betas=["interleaved-thinking-2025-05-14"],
    model="claude-sonnet-4-5",
    tools=tools,
    messages=[...]
)
```

---

## 6. Anthropic SDK Patterns

### Python SDK

#### Basic Tool Use

```python
import anthropic

client = anthropic.Anthropic()

response = client.messages.create(
    model="claude-sonnet-4-5",
    max_tokens=1024,
    tools=[
        {
            "name": "get_weather",
            "description": "Get the current weather in a given location",
            "input_schema": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city and state, e.g. San Francisco, CA"
                    }
                },
                "required": ["location"]
            }
        }
    ],
    messages=[{"role": "user", "content": "What's the weather in SF?"}]
)
```

#### Tool Runner (Beta)

The Tool Runner automates the tool loop:

```python
from anthropic import beta_tool

@beta_tool
def get_weather(location: str, unit: str = "fahrenheit") -> str:
    """Get the current weather in a given location.

    Args:
        location: The city and state, e.g. San Francisco, CA
        unit: Temperature unit, either 'celsius' or 'fahrenheit'
    """
    return json.dumps({"temperature": "68°F", "condition": "Sunny"})

runner = client.beta.messages.tool_runner(
    model="claude-sonnet-4-5",
    max_tokens=1024,
    tools=[get_weather],
    messages=[{"role": "user", "content": "What's the weather in Paris?"}]
)

for message in runner:
    print(message.content[0].text)

# Or get final result directly
final_message = runner.until_done()
```

### TypeScript SDK

#### Basic Tool Use

```typescript
import Anthropic from "@anthropic-ai/sdk";

const anthropic = new Anthropic();

const response = await anthropic.messages.create({
  model: "claude-sonnet-4-5",
  max_tokens: 1024,
  tools: [{
    name: "get_weather",
    description: "Get the current weather in a given location",
    input_schema: {
      type: "object",
      properties: {
        location: {
          type: "string",
          description: "The city and state, e.g. San Francisco, CA"
        }
      },
      required: ["location"]
    }
  }],
  messages: [{ role: "user", content: "What's the weather in SF?" }]
});
```

#### Tool Runner with Zod (Beta)

```typescript
import { betaZodTool } from "@anthropic-ai/sdk/helpers/beta/zod";
import { z } from "zod";

const getWeatherTool = betaZodTool({
  name: "get_weather",
  description: "Get current weather",
  inputSchema: z.object({
    location: z.string().describe("City and state"),
    unit: z.enum(["celsius", "fahrenheit"]).default("fahrenheit")
  }),
  run: async (input) => {
    return JSON.stringify({ temperature: "68°F", condition: "Sunny" });
  }
});

const runner = anthropic.beta.messages.toolRunner({
  model: "claude-sonnet-4-5",
  max_tokens: 1024,
  tools: [getWeatherTool],
  messages: [{ role: "user", content: "What's the weather in Paris?" }]
});

for await (const message of runner) {
  console.log(message.content[0].text);
}
```

### Claude Agent SDK

The Agent SDK provides a higher-level abstraction with built-in tools:

#### Python

```python
import asyncio
from claude_agent_sdk import query, ClaudeAgentOptions

async def main():
    async for message in query(
        prompt="Find and fix the bug in auth.py",
        options=ClaudeAgentOptions(
            allowed_tools=["Read", "Edit", "Bash"]
        )
    ):
        if hasattr(message, "result"):
            print(message.result)

asyncio.run(main())
```

#### TypeScript

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";

for await (const message of query({
  prompt: "Find and fix the bug in auth.py",
  options: { allowedTools: ["Read", "Edit", "Bash"] }
})) {
  if ("result" in message) console.log(message.result);
}
```

#### Built-in Tools

| Tool | Description |
|------|-------------|
| `Read` | Read any file in the working directory |
| `Write` | Create new files |
| `Edit` | Make precise edits to existing files |
| `Bash` | Run terminal commands |
| `Glob` | Find files by pattern |
| `Grep` | Search file contents with regex |
| `WebSearch` | Search the web |
| `WebFetch` | Fetch web page content |

#### Custom Tools with Hooks

```python
from claude_agent_sdk import query, ClaudeAgentOptions, HookMatcher

async def log_tool_use(input_data, tool_use_id, context):
    print(f"Tool called: {input_data}")
    return {}

async def main():
    async for message in query(
        prompt="Analyze this codebase",
        options=ClaudeAgentOptions(
            hooks={
                "PostToolUse": [
                    HookMatcher(matcher=".*", hooks=[log_tool_use])
                ]
            }
        )
    ):
        pass
```

#### MCP Integration

```python
async def main():
    async for message in query(
        prompt="Open example.com and describe what you see",
        options=ClaudeAgentOptions(
            mcp_servers={
                "playwright": {
                    "command": "npx",
                    "args": ["@playwright/mcp@latest"]
                }
            }
        )
    ):
        if hasattr(message, "result"):
            print(message.result)
```

---

## 7. Design Recommendations for Playwright Skill

Based on this research, here are specific recommendations for implementing a native Playwright skill for Claude Code:

### Tool Architecture

#### Core Navigation Tools

```python
# navigate_to - Primary navigation tool
{
    "name": "navigate_to",
    "description": "Navigates the browser to a specified URL. Waits for the page to load before returning. Use this to open websites, web applications, or navigate between pages. Returns page title and current URL after navigation. Handles redirects automatically.",
    "input_schema": {
        "type": "object",
        "properties": {
            "url": {
                "type": "string",
                "description": "The URL to navigate to. Must be a valid HTTP or HTTPS URL."
            },
            "wait_until": {
                "type": "string",
                "enum": ["load", "domcontentloaded", "networkidle"],
                "description": "When to consider navigation complete. 'load' waits for load event, 'domcontentloaded' for DOMContentLoaded, 'networkidle' for no network activity. Defaults to 'load'."
            }
        },
        "required": ["url"]
    }
}
```

#### Element Interaction Tools

```python
# click_element - Click interactions
{
    "name": "click_element",
    "description": "Clicks an element on the page identified by a CSS selector or text content. Waits for the element to be visible and clickable. Use for buttons, links, checkboxes, or any clickable elements. Returns success status and any resulting navigation.",
    "input_schema": {
        "type": "object",
        "properties": {
            "selector": {
                "type": "string",
                "description": "CSS selector to identify the element. Examples: '#submit-btn', '.nav-link', '[data-testid=\"login\"]'"
            },
            "text": {
                "type": "string",
                "description": "Alternative: find element by visible text content. Used when selector is not provided."
            },
            "wait_for_navigation": {
                "type": "boolean",
                "description": "Whether to wait for page navigation after click. Defaults to false."
            }
        }
    }
}

# fill_input - Form filling
{
    "name": "fill_input",
    "description": "Fills a text input, textarea, or contenteditable element with the specified value. Clears existing content first. Use for forms, search boxes, text areas.",
    "input_schema": {
        "type": "object",
        "properties": {
            "selector": {
                "type": "string",
                "description": "CSS selector for the input element"
            },
            "value": {
                "type": "string",
                "description": "Text to enter into the field"
            },
            "clear_first": {
                "type": "boolean",
                "description": "Whether to clear existing content before typing. Defaults to true."
            }
        },
        "required": ["selector", "value"]
    }
}
```

#### Page Inspection Tools

```python
# get_page_content - Content extraction
{
    "name": "get_page_content",
    "description": "Extracts content from the current page. Can return full HTML, text content, or specific elements. Use to understand page structure, find elements, or extract data.",
    "input_schema": {
        "type": "object",
        "properties": {
            "selector": {
                "type": "string",
                "description": "Optional CSS selector to extract specific element(s). If not provided, returns full page."
            },
            "format": {
                "type": "string",
                "enum": ["html", "text", "markdown"],
                "description": "Output format. 'html' returns raw HTML, 'text' returns visible text, 'markdown' converts to readable markdown."
            },
            "include_attributes": {
                "type": "boolean",
                "description": "Whether to include element attributes in output. Useful for finding selectors."
            }
        }
    }
}

# take_screenshot - Visual capture
{
    "name": "take_screenshot",
    "description": "Captures a screenshot of the current page or specific element. Returns base64-encoded image. Use to verify visual state, debug layouts, or document progress.",
    "input_schema": {
        "type": "object",
        "properties": {
            "selector": {
                "type": "string",
                "description": "Optional CSS selector to screenshot specific element"
            },
            "full_page": {
                "type": "boolean",
                "description": "Whether to capture full scrollable page. Defaults to false (viewport only)."
            }
        }
    }
}
```

### Anti-Patterns to Avoid

1. **Generic selectors**: Never use selectors like `div`, `span` without specificity
2. **Hardcoded waits**: Use explicit wait conditions, not `time.sleep()`
3. **Missing error context**: Always return meaningful error messages with page state
4. **Oversized responses**: Limit HTML/content responses to prevent context bloat
5. **No retry logic**: Implement exponential backoff for transient failures

### State Management Pattern

```python
class PlaywrightSession:
    """Maintains browser state across tool calls."""

    def __init__(self):
        self.browser = None
        self.page = None
        self.context = None
        self.navigation_history = []

    async def ensure_browser(self):
        """Lazy initialization of browser."""
        if not self.browser:
            self.browser = await playwright.chromium.launch()
            self.context = await self.browser.new_context()
            self.page = await self.context.new_page()

    async def execute_tool(self, tool_name: str, input_data: dict) -> dict:
        """Execute tool with session state."""
        await self.ensure_browser()

        try:
            result = await self._dispatch_tool(tool_name, input_data)
            return {"success": True, "result": result}
        except Exception as e:
            return {
                "success": False,
                "error": str(e),
                "page_url": self.page.url,
                "screenshot": await self._capture_error_screenshot()
            }
```

### Error Handling Recommendations

1. **Return page context with errors**: URL, visible elements, screenshot
2. **Classify errors**: Network vs. Element not found vs. Timeout
3. **Suggest fixes**: "Element not found. Similar elements: [list]"
4. **Implement retries**: With exponential backoff for network issues

### Performance Considerations

1. **Lazy browser initialization**: Don't start browser until needed
2. **Connection reuse**: Keep browser session across related tool calls
3. **Streaming for large content**: Use fine-grained streaming for page content
4. **Selective extraction**: Only return relevant page sections, not full HTML

---

## Sources

- [Tool use with Claude - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)
- [How to implement tool use - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/tool-use/implement-tool-use)
- [Introducing advanced tool use - Anthropic Engineering](https://www.anthropic.com/engineering/advanced-tool-use)
- [Agent SDK overview - Claude Docs](https://platform.claude.com/docs/en/agent-sdk/overview)
- [Fine-grained tool streaming - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/tool-use/fine-grained-tool-streaming)
- [Structured outputs - Claude Docs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
- [Claude Agent SDK Python - GitHub](https://github.com/anthropics/claude-agent-sdk-python)
- [Claude Agent SDK TypeScript - GitHub](https://github.com/anthropics/claude-agent-sdk-typescript)
- [Prompt Engineering with Claude - AWS Samples](https://github.com/aws-samples/prompt-engineering-with-anthropic-claude-v-3)

---

*Research completed: 2026-01-06*
*Agent: 04 - Claude API Specialist*
*Wave: 1 - Foundation Research*
