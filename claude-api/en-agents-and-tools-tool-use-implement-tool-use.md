---
source: https://docs.anthropic.com/en/agents-and-tools/tool-use/implement-tool-use
scraped: 2026-01-07
api_provider: Anthropic
discovery_tier: 3
verified: false
method: bright_data
duration_ms: 5943
---
ow to implement tool use - Claude Docs

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fagents-and-tools%2Ftool-use%2Fimplement-tool-use)

Search...

⌘K

First steps

[Intro to Claude](/docs/en/intro)[Quickstart](/docs/en/get-started)

Models & pricing

[Models overview](/docs/en/about-claude/models/overview)[Choosing a model](/docs/en/about-claude/models/choosing-a-model)[What's new in Claude 4.5](/docs/en/about-claude/models/whats-new-claude-4-5)[Migrating to Claude 4.5](/docs/en/about-claude/models/migrating-to-claude-4)[Model deprecations](/docs/en/about-claude/model-deprecations)[Pricing](/docs/en/about-claude/pricing)

Build with Claude

[Features overview](/docs/en/build-with-claude/overview)[Using the Messages API](/docs/en/build-with-claude/working-with-messages)[Context windows](/docs/en/build-with-claude/context-windows)[Prompting best practices](/docs/en/build-with-claude/prompt-engineering/claude-4-best-practices)

Capabilities

[Prompt caching](/docs/en/build-with-claude/prompt-caching)[Context editing](/docs/en/build-with-claude/context-editing)[Extended thinking](/docs/en/build-with-claude/extended-thinking)[Effort](/docs/en/build-with-claude/effort)[Streaming Messages](/docs/en/build-with-claude/streaming)[Batch processing](/docs/en/build-with-claude/batch-processing)[Citations](/docs/en/build-with-claude/citations)[Multilingual support](/docs/en/build-with-claude/multilingual-support)[Token counting](/docs/en/build-with-claude/token-counting)[Embeddings](/docs/en/build-with-claude/embeddings)[Vision](/docs/en/build-with-claude/vision)[PDF support](/docs/en/build-with-claude/pdf-support)[Files API](/docs/en/build-with-claude/files)[Search results](/docs/en/build-with-claude/search-results)[Structured outputs](/docs/en/build-with-claude/structured-outputs)

Tools

[Overview](/docs/en/agents-and-tools/tool-use/overview)[How to implement tool use](/docs/en/agents-and-tools/tool-use/implement-tool-use)[Fine-grained tool streaming](/docs/en/agents-and-tools/tool-use/fine-grained-tool-streaming)[Bash tool](/docs/en/agents-and-tools/tool-use/bash-tool)[Code execution tool](/docs/en/agents-and-tools/tool-use/code-execution-tool)[Programmatic tool calling](/docs/en/agents-and-tools/tool-use/programmatic-tool-calling)[Computer use tool](/docs/en/agents-and-tools/tool-use/computer-use-tool)[Text editor tool](/docs/en/agents-and-tools/tool-use/text-editor-tool)[Web fetch tool](/docs/en/agents-and-tools/tool-use/web-fetch-tool)[Web search tool](/docs/en/agents-and-tools/tool-use/web-search-tool)[Memory tool](/docs/en/agents-and-tools/tool-use/memory-tool)[Tool search tool](/docs/en/agents-and-tools/tool-use/tool-search-tool)

Agent Skills

[Overview](/docs/en/agents-and-tools/agent-skills/overview)[Quickstart](/docs/en/agents-and-tools/agent-skills/quickstart)[Best practices](/docs/en/agents-and-tools/agent-skills/best-practices)[Using Skills with the API](/docs/en/build-with-claude/skills-guide)

Agent SDK

[Overview](/docs/en/agent-sdk/overview)[Quickstart](/docs/en/agent-sdk/quickstart)[TypeScript SDK](/docs/en/agent-sdk/typescript)[TypeScript V2 (preview)](/docs/en/agent-sdk/typescript-v2-preview)[Python SDK](/docs/en/agent-sdk/python)[Migration Guide](/docs/en/agent-sdk/migration-guide)

Guides

MCP in the API

[MCP connector](/docs/en/agents-and-tools/mcp-connector)[Remote MCP servers](/docs/en/agents-and-tools/remote-mcp-servers)

Claude on 3rd-party platforms

[Amazon Bedrock](/docs/en/build-with-claude/claude-on-amazon-bedrock)[Microsoft Foundry](/docs/en/build-with-claude/claude-in-microsoft-foundry)[Vertex AI](/docs/en/build-with-claude/claude-on-vertex-ai)

Prompt engineering

[Overview](/docs/en/build-with-claude/prompt-engineering/overview)[Prompt generator](/docs/en/build-with-claude/prompt-engineering/prompt-generator)[Use prompt templates](/docs/en/build-with-claude/prompt-engineering/prompt-templates-and-variables)[Prompt improver](/docs/en/build-with-claude/prompt-engineering/prompt-improver)[Be clear and direct](/docs/en/build-with-claude/prompt-engineering/be-clear-and-direct)[Use examples (multishot prompting)](/docs/en/build-with-claude/prompt-engineering/multishot-prompting)[Let Claude think (CoT)](/docs/en/build-with-claude/prompt-engineering/chain-of-thought)[Use XML tags](/docs/en/build-with-claude/prompt-engineering/use-xml-tags)[Give Claude a role (system prompts)](/docs/en/build-with-claude/prompt-engineering/system-prompts)[Prefill Claude's response](/docs/en/build-with-claude/prompt-engineering/prefill-claudes-response)[Chain complex prompts](/docs/en/build-with-claude/prompt-engineering/chain-prompts)[Long context tips](/docs/en/build-with-claude/prompt-engineering/long-context-tips)[Extended thinking tips](/docs/en/build-with-claude/prompt-engineering/extended-thinking-tips)

Test & evaluate

[Define success criteria](/docs/en/test-and-evaluate/define-success)[Develop test cases](/docs/en/test-and-evaluate/develop-tests)[Using the Evaluation Tool](/docs/en/test-and-evaluate/eval-tool)[Reducing latency](/docs/en/test-and-evaluate/strengthen-guardrails/reduce-latency)

Strengthen guardrails

[Reduce hallucinations](/docs/en/test-and-evaluate/strengthen-guardrails/reduce-hallucinations)[Increase output consistency](/docs/en/test-and-evaluate/strengthen-guardrails/increase-consistency)[Mitigate jailbreaks](/docs/en/test-and-evaluate/strengthen-guardrails/mitigate-jailbreaks)[Streaming refusals](/docs/en/test-and-evaluate/strengthen-guardrails/handle-streaming-refusals)[Reduce prompt leak](/docs/en/test-and-evaluate/strengthen-guardrails/reduce-prompt-leak)[Keep Claude in character](/docs/en/test-and-evaluate/strengthen-guardrails/keep-claude-in-character)

Administration and monitoring

[Admin API overview](/docs/en/build-with-claude/administration-api)[Workspaces](/docs/en/build-with-claude/workspaces)[Usage and Cost API](/docs/en/build-with-claude/usage-cost-api)[Claude Code Analytics API](/docs/en/build-with-claude/claude-code-analytics-api)

[

Console

](/)

[

Log in

](/login)

Tools

How to implement tool use

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

Loading...

[](/docs)

[](https://x.com/claudeai)[](https://www.linkedin.com/showcase/claude)[](https://instagram.com/claudeai)

### Solutions

*   [AI agents](https://claude.com/solutions/agents)
*   [Code modernization](https://claude.com/solutions/code-modernization)
*   [Coding](https://claude.com/solutions/coding)
*   [Customer support](https://claude.com/solutions/customer-support)
*   [Education](https://claude.com/solutions/education)
*   [Financial services](https://claude.com/solutions/financial-services)
*   [Government](https://claude.com/solutions/government)
*   [Life sciences](https://claude.com/solutions/life-sciences)

### Partners

*   [Amazon Bedrock](https://claude.com/partners/amazon-bedrock)
*   [Google Cloud's Vertex AI](https://claude.com/partners/google-cloud-vertex-ai)

### Learn

*   [Blog](https://claude.com/blog)
*   [Catalog](https://claude.ai/catalog/artifacts)
*   [Courses](https://www.anthropic.com/learn)
*   [Use cases](https://claude.com/resources/use-cases)
*   [Connectors](https://claude.com/partners/mcp)
*   [Customer stories](https://claude.com/customers)
*   [Engineering at Anthropic](https://www.anthropic.com/engineering)
*   [Events](https://www.anthropic.com/events)
*   [Powered by Claude](https://claude.com/partners/powered-by-claude)
*   [Service partners](https://claude.com/partners/services)
*   [Startups program](https://claude.com/programs/startups)

### Company

*   [Anthropic](https://www.anthropic.com/company)
*   [Careers](https://www.anthropic.com/careers)
*   [Economic Futures](https://www.anthropic.com/economic-futures)
*   [Research](https://www.anthropic.com/research)
*   [News](https://www.anthropic.com/news)
*   [Responsible Scaling Policy](https://www.anthropic.com/news/announcing-our-updated-responsible-scaling-policy)
*   [Security and compliance](https://trust.anthropic.com)
*   [Transparency](https://www.anthropic.com/transparency)

### Learn

*   [Blog](https://claude.com/blog)
*   [Catalog](https://claude.ai/catalog/artifacts)
*   [Courses](https://www.anthropic.com/learn)
*   [Use cases](https://claude.com/resources/use-cases)
*   [Connectors](https://claude.com/partners/mcp)
*   [Customer stories](https://claude.com/customers)
*   [Engineering at Anthropic](https://www.anthropic.com/engineering)
*   [Events](https://www.anthropic.com/events)
*   [Powered by Claude](https://claude.com/partners/powered-by-claude)
*   [Service partners](https://claude.com/partners/services)
*   [Startups program](https://claude.com/programs/startups)

### Help and security

*   [Availability](https://www.anthropic.com/supported-countries)
*   [Status](https://status.anthropic.com/)
*   [Support](https://support.claude.com/)
*   [Discord](https://www.anthropic.com/discord)

### Terms and policies

*   [Privacy policy](https://www.anthropic.com/legal/privacy)
*   [Responsible disclosure policy](https://www.anthropic.com/responsible-disclosure-policy)
*   [Terms of service: Commercial](https://www.anthropic.com/legal/commercial-terms)
*   [Terms of service: Consumer](https://www.anthropic.com/legal/consumer-terms)
*   [Usage policy](https://www.anthropic.com/legal/aup)

Tools

# How to implement tool use

Copy page

Copy page

## 

Choosing a model

We recommend using the latest Claude Sonnet (4.5) or Claude Opus (4.5) model for complex tools and ambiguous queries; they handle multiple tools better and seek clarification when needed.

Use Claude Haiku models for straightforward tools, but note they may infer missing parameters.

If using Claude with tool use and extended thinking, refer to our guide [here](/docs/en/build-with-claude/extended-thinking) for more information.

## 

Specifying client tools

Client tools (both Anthropic-defined and user-defined) are specified in the `tools` top-level parameter of the API request. Each tool definition includes:

Parameter

Description

`name`

The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.

`description`

A detailed plaintext description of what the tool does, when it should be used, and how it behaves.

`input_schema`

A [JSON Schema](https://json-schema.org/) object defining the expected parameters for the tool.

`input_examples`

*   [Choosing a model](#choosing-a-model)
*   [Specifying client tools](#specifying-client-tools)
*   [Tool use system prompt](#tool-use-system-prompt)
*   [Best practices for tool definitions](#best-practices-for-tool-definitions)
*   [Providing tool use examples](#providing-tool-use-examples)
*   [Basic usage](#basic-usage)
*   [Requirements and limitations](#requirements-and-limitations)
*   [Tool runner (beta)](#tool-runner-beta)
*   [Basic usage](#basic-usage-2)
*   [Iterating over the tool runner](#iterating-over-the-tool-runner)
*   [Advanced usage](#advanced-usage)
*   [Streaming](#streaming)
*   [Basic usage](#basic-usage-3)
*   [Iterating over the tool runner](#iterating-over-the-tool-runner-2)
*   [Advanced usage](#advanced-usage-2)
*   [Streaming](#streaming-2)
*   [Basic usage](#basic-usage-4)
*   [Iterating over the tool runner](#iterating-over-the-tool-runner-3)
*   [Advanced usage](#advanced-usage-3)
*   [Streaming](#streaming-3)
*   [Basic usage](#basic-usage-5)
*   [Iterating over the tool runner](#iterating-over-the-tool-runner-4)
*   [Advanced usage](#advanced-usage-4)
*   [Streaming](#streaming-4)
*   [Controlling Claude's output](#controlling-claudes-output)
*   [Forcing tool use](#forcing-tool-use)
*   [JSON output](#json-output)
*   [Model responses with tools](#model-responses-with-tools)
*   [Parallel tool use](#parallel-tool-use)
*   [Handling tool use and tool result content blocks](#handling-tool-use-and-tool-result-content-blocks)
*   [Handling results from client tools](#handling-results-from-client-tools)
*   [Handling results from server tools](#handling-results-from-server-tools)
*   [Handling the max\_tokens stop reason](#handling-the-max-tokens-stop-reason)
*   [Troubleshooting errors](#troubleshooting-errors)

(Optional, beta) An array of example input objects to help Claude understand how to use the tool. See [Providing tool use examples](#providing-tool-use-examples).

### Example simple tool definition

### 

Tool use system prompt

When you call the Claude API with the `tools` parameter, we construct a special system prompt from the tool definitions, tool configuration, and any user-specified system prompt. The constructed prompt is designed to instruct the model to use the specified tool(s) and provide the necessary context for the tool to operate properly:

    In this environment you have access to a set of tools you can use to answer the user's question.
    {{ FORMATTING INSTRUCTIONS }}
    String and scalar parameters should be specified as is, while lists and objects should use JSON format. Note that spaces for string values are not stripped. The output is not expected to be valid XML and is parsed with regular expressions.
    Here are the functions available in JSONSchema format:
    {{ TOOL DEFINITIONS IN JSON SCHEMA }}
    {{ USER SYSTEM PROMPT }}
    {{ TOOL CONFIGURATION }}

### 

Best practices for tool definitions

To get the best performance out of Claude when using tools, follow these guidelines:

*   **Provide extremely detailed descriptions.** This is by far the most important factor in tool performance. Your descriptions should explain every detail about the tool, including:
    *   What the tool does
    *   When it should be used (and when it shouldn't)
    *   What each parameter means and how it affects the tool's behavior
    *   Any important caveats or limitations, such as what information the tool does not return if the tool name is unclear. The more context you can give Claude about your tools, the better it will be at deciding when and how to use them. Aim for at least 3-4 sentences per tool description, more if the tool is complex.
*   **Prioritize descriptions, but consider using `input_examples` for complex tools.** Clear descriptions are most important, but for tools with complex inputs, nested objects, or format-sensitive parameters, you can use the `input_examples` field (beta) to provide schema-validated examples. See [Providing tool use examples](#providing-tool-use-examples) for details.

### Example of a good tool description

### Example poor tool description

The good description clearly explains what the tool does, when to use it, what data it returns, and what the `ticker` parameter means. The poor description is too brief and leaves Claude with many open questions about the tool's behavior and usage.

## 

Providing tool use examples

You can provide concrete examples of valid tool inputs to help Claude understand how to use your tools more effectively. This is particularly useful for complex tools with nested objects, optional parameters, or format-sensitive inputs.

Tool use examples is a beta feature. Include the appropriate [beta header](/docs/en/api/beta-headers) for your provider:

Provider

Beta header

Supported models

Claude API,  
Microsoft Foundry

`advanced-tool-use-2025-11-20`

All models

Vertex AI,  
Amazon Bedrock

`tool-examples-2025-10-29`

Claude Opus 4.5 only

### 

Basic usage

Add an optional `input_examples` field to your tool definition with an array of example input objects. Each example must be valid according to the tool's `input_schema`:

Python

    import anthropic
    
    client = anthropic.Anthropic()
    
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=1024,
        betas=["advanced-tool-use-2025-11-20"],
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
                        },
                        "unit": {
                            "type": "string",
                            "enum": ["celsius", "fahrenheit"],
                            "description": "The unit of temperature"
                        }
                    },
                    "required": ["location"]
                },
                "input_examples": [
                    {
                        "location": "San Francisco, CA",
                        "unit": "fahrenheit"
                    },
                    {
                        "location": "Tokyo, Japan",
                        "unit": "celsius"
                    },
                    {
                        "location": "New York, NY"  # 'unit' is optional
                    }
                ]
            }
        ],
        messages=[
            {"role": "user", "content": "What's the weather like in San Francisco?"}
        ]
    )

Examples are included in the prompt alongside your tool schema, showing Claude concrete patterns for well-formed tool calls. This helps Claude understand when to include optional parameters, what formats to use, and how to structure complex inputs.

### 

Requirements and limitations

*   **Schema validation** - Each example must be valid according to the tool's `input_schema`. Invalid examples return a 400 error
*   **Not supported for server-side tools** - Only user-defined tools can have input examples
*   **Token cost** - Examples add to prompt tokens: ~20-50 tokens for simple examples, ~100-200 tokens for complex nested objects

## 

Tool runner (beta)

The tool runner provides an out-of-the-box solution for executing tools with Claude. Instead of manually handling tool calls, tool results, and conversation management, the tool runner automatically:

*   Executes tools when Claude calls them
*   Handles the request/response cycle
*   Manages conversation state
*   Provides type safety and validation

We recommend that you use the tool runner for most tool use implementations.

The tool runner is currently in beta and available in the [Python](https://github.com/anthropics/anthropic-sdk-python/blob/main/tools.md), [TypeScript](https://github.com/anthropics/anthropic-sdk-typescript/blob/main/helpers.md#tool-helpers), and [Ruby](https://github.com/anthropics/anthropic-sdk-ruby/blob/main/helpers.md#3-auto-looping-tool-runner-beta) SDKs.

**Automatic context management with compaction**

The tool runner supports automatic [compaction](/docs/en/build-with-claude/context-editing#client-side-compaction-sdk), which generates summaries when token usage exceeds a threshold. This allows long-running agentic tasks to continue beyond context window limits.

Python

Python

TypeScript (Zod)

TypeScript (Zod)

TypeScript (JSON Schema)

TypeScript (JSON Schema)

Ruby

Ruby

The SDK tool runner is in beta. The rest of this document covers manual tool implementation.

## 

Controlling Claude's output

### 

Forcing tool use

In some cases, you may want Claude to use a specific tool to answer the user's question, even if Claude thinks it can provide an answer without using a tool. You can do this by specifying the tool in the `tool_choice` field like so:

    tool_choice = {"type": "tool", "name": "get_weather"}

When working with the tool\_choice parameter, we have four possible options:

*   `auto` allows Claude to decide whether to call any provided tools or not. This is the default value when `tools` are provided.
*   `any` tells Claude that it must use one of the provided tools, but doesn't force a particular tool.
*   `tool` allows us to force Claude to always use a particular tool.
*   `none` prevents Claude from using any tools. This is the default value when no `tools` are provided.

When using [prompt caching](/docs/en/build-with-claude/prompt-caching#what-invalidates-the-cache), changes to the `tool_choice` parameter will invalidate cached message blocks. Tool definitions and system prompts remain cached, but message content must be reprocessed.

This diagram illustrates how each option works:

![](/docs/images/tool_choice.png)

Note that when you have `tool_choice` as `any` or `tool`, we will prefill the assistant message to force a tool to be used. This means that the models will not emit a natural language response or explanation before `tool_use` content blocks, even if explicitly asked to do so.

When using [extended thinking](/docs/en/build-with-claude/extended-thinking) with tool use, `tool_choice: {"type": "any"}` and `tool_choice: {"type": "tool", "name": "..."}` are not supported and will result in an error. Only `tool_choice: {"type": "auto"}` (the default) and `tool_choice: {"type": "none"}` are compatible with extended thinking.

Our testing has shown that this should not reduce performance. If you would like the model to provide natural language context or explanations while still requesting that the model use a specific tool, you can use `{"type": "auto"}` for `tool_choice` (the default) and add explicit instructions in a `user` message. For example: `What's the weather like in London? Use the get_weather tool in your response.`

**Guaranteed tool calls with strict tools**

Combine `tool_choice: {"type": "any"}` with [strict tool use](/docs/en/build-with-claude/structured-outputs) to guarantee both that one of your tools will be called AND that the tool inputs strictly follow your schema. Set `strict: true` on your tool definitions to enable schema validation.

### 

JSON output

Tools do not necessarily need to be client functions — you can use tools anytime you want the model to return JSON output that follows a provided schema. For example, you might use a `record_summary` tool with a particular schema. See [Tool use with Claude](/docs/en/agents-and-tools/tool-use/overview) for a full working example.

### 

Model responses with tools

When using tools, Claude will often comment on what it's doing or respond naturally to the user before invoking tools.

For example, given the prompt "What's the weather like in San Francisco right now, and what time is it there?", Claude might respond with:

JSON

    {
      "role": "assistant",
      "content": [
        {
          "type": "text",
          "text": "I'll help you check the current weather and time in San Francisco."
        },
        {
          "type": "tool_use",
          "id": "toolu_01A09q90qw90lq917835lq9",
          "name": "get_weather",
          "input": {"location": "San Francisco, CA"}
        }
      ]
    }

This natural response style helps users understand what Claude is doing and creates a more conversational interaction. You can guide the style and content of these responses through your system prompts and by providing `<examples>` in your prompts.

It's important to note that Claude may use various phrasings and approaches when explaining its actions. Your code should treat these responses like any other assistant-generated text, and not rely on specific formatting conventions.

### 

Parallel tool use

By default, Claude may use multiple tools to answer a user query. You can disable this behavior by:

*   Setting `disable_parallel_tool_use=true` when tool\_choice type is `auto`, which ensures that Claude uses **at most one** tool
*   Setting `disable_parallel_tool_use=true` when tool\_choice type is `any` or `tool`, which ensures that Claude uses **exactly one** tool

### Complete parallel tool use example

### Complete test script for parallel tools

#### 

Maximizing parallel tool use

While Claude 4 models have excellent parallel tool use capabilities by default, you can increase the likelihood of parallel tool execution across all models with targeted prompting:

### System prompts for parallel tool use

### User message prompting

**Parallel tool use with Claude Sonnet 3.7**

Claude Sonnet 3.7 may be less likely to make make parallel tool calls in a response, even when you have not set `disable_parallel_tool_use`. We recommend [upgrading to Claude 4 models](/docs/en/about-claude/models/migrating-to-claude-4), which have built-in token-efficient tool use and improved parallel tool calling.

If you're still using Claude Sonnet 3.7, you can enable the `token-efficient-tools-2025-02-19` [beta header](/docs/en/api/beta-headers), which helps encourage Claude to use parallel tools. You can also introduce a "batch tool" that can act as a meta-tool to wrap invocations to other tools simultaneously.

See [this example](https://platform.claude.com/cookbook/tool-use-parallel-tools) in our cookbook for how to use this workaround.

## 

Handling tool use and tool result content blocks

**Simpler with Tool runner**: The manual tool handling described in this section is automatically managed by [tool runner](#tool-runner-beta). Use this section when you need custom control over tool execution.

Claude's response differs based on whether it uses a client or server tool.

### 

Handling results from client tools

The response will have a `stop_reason` of `tool_use` and one or more `tool_use` content blocks that include:

*   `id`: A unique identifier for this particular tool use block. This will be used to match up the tool results later.
*   `name`: The name of the tool being used.
*   `input`: An object containing the input being passed to the tool, conforming to the tool's `input_schema`.

### Example API response with a \`tool\_use\` content block

When you receive a tool use response for a client tool, you should:

1.  Extract the `name`, `id`, and `input` from the `tool_use` block.
2.  Run the actual tool in your codebase corresponding to that tool name, passing in the tool `input`.
3.  Continue the conversation by sending a new message with the `role` of `user`, and a `content` block containing the `tool_result` type and the following information:
    *   `tool_use_id`: The `id` of the tool use request this is a result for.
    *   `content`: The result of the tool, as a string (e.g. `"content": "15 degrees"`), a list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`), or a list of document blocks (e.g. `"content": ["type": "document", "source": {"type": "text", "media_type": "text/plain", "data": "15 degrees"}]`). These content blocks can use the `text`, `image`, or `document` types.
    *   `is_error` (optional): Set to `true` if the tool execution resulted in an error.

**Important formatting requirements**:

*   Tool result blocks must immediately follow their corresponding tool use blocks in the message history. You cannot include any messages between the assistant's tool use message and the user's tool result message.
*   In the user message containing tool results, the tool\_result blocks must come FIRST in the content array. Any text must come AFTER all tool results.

For example, this will cause a 400 error:

    {"role": "user", "content": [
      {"type": "text", "text": "Here are the results:"},  // ❌ Text before tool_result
      {"type": "tool_result", "tool_use_id": "toolu_01", ...}
    ]}

This is correct:

    {"role": "user", "content": [
      {"type": "tool_result", "tool_use_id": "toolu_01", ...},
      {"type": "text", "text": "What should I do next?"}  // ✅ Text after tool_result
    ]}

If you receive an error like "tool\_use ids were found without tool\_result blocks immediately after", check that your tool results are formatted correctly.

### Example of successful tool result

### Example of tool result with images

### Example of empty tool result

### Example of tool result with documents

After receiving the tool result, Claude will use that information to continue generating a response to the original user prompt.

### 

Handling results from server tools

Claude executes the tool internally and incorporates the results directly into its response without requiring additional user interaction.

**Differences from other APIs**

Unlike APIs that separate tool use or use special roles like `tool` or `function`, the Claude API integrates tools directly into the `user` and `assistant` message structure.

Messages contain arrays of `text`, `image`, `tool_use`, and `tool_result` blocks. `user` messages include client content and `tool_result`, while `assistant` messages contain AI-generated content and `tool_use`.

### 

Handling the `max_tokens` stop reason

If Claude's [response is cut off due to hitting the `max_tokens` limit](/docs/en/build-with-claude/handling-stop-reasons#max-tokens), and the truncated response contains an incomplete tool use block, you'll need to retry the request with a higher `max_tokens` value to get the full tool use.

Python

    # Check if response was truncated during tool use
    if response.stop_reason == "max_tokens":
        # Check if the last content block is an incomplete tool_use
        last_block = response.content[-1]
        if last_block.type == "tool_use":
            # Send the request with higher max_tokens
            response = client.messages.create(
                model="claude-sonnet-4-5",
                max_tokens=4096,  # Increased limit
                messages=messages,
                tools=tools
            )

#### 

Handling the `pause_turn` stop reason

When using server tools like web search, the API may return a `pause_turn` stop reason, indicating that the API has paused a long-running turn.

Here's how to handle the `pause_turn` stop reason:

Python

    import anthropic
    
    client = anthropic.Anthropic()
    
    # Initial request with web search
    response = client.messages.create(
        model="claude-3-7-sonnet-latest",
        max_tokens=1024,
        messages=[
            {
                "role": "user",
                "content": "Search for comprehensive information about quantum computing breakthroughs in 2025"
            }
        ],
        tools=[{
            "type": "web_search_20250305",
            "name": "web_search",
            "max_uses": 10
        }]
    )
    
    # Check if the response has pause_turn stop reason
    if response.stop_reason == "pause_turn":
        # Continue the conversation with the paused content
        messages = [
            {"role": "user", "content": "Search for comprehensive information about quantum computing breakthroughs in 2025"},
            {"role": "assistant", "content": response.content}
        ]
    
        # Send the continuation request
        continuation = client.messages.create(
            model="claude-3-7-sonnet-latest",
            max_tokens=1024,
            messages=messages,
            tools=[{
                "type": "web_search_20250305",
                "name": "web_search",
                "max_uses": 10
            }]
        )
    
        print(continuation)
    else:
        print(response)

When handling `pause_turn`:

*   **Continue the conversation**: Pass the paused response back as-is in a subsequent request to let Claude continue its turn
*   **Modify if needed**: You can optionally modify the content before continuing if you want to interrupt or redirect the conversation
*   **Preserve tool state**: Include the same tools in the continuation request to maintain functionality

## 

Troubleshooting errors

**Built-in Error Handling**: [Tool runner](#tool-runner-beta) provide automatic error handling for most common scenarios. This section covers manual error handling for advanced use cases.

There are a few different types of errors that can occur when using tools with Claude:

### Tool execution error

### Invalid tool name

### <search\_quality\_reflection> tags

### Server tool errors

### Parallel tool calls not
