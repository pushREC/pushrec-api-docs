---
source: https://docs.anthropic.com/en/build-with-claude/working-with-messages
scraped: 2026-01-07
method: bright_data
duration_ms: 2781
---

Using the Messages API - Claude Docs

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fbuild-with-claude%2Fworking-with-messages)

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

Build with Claude

Using the Messages API

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

Build with Claude

# Using the Messages API

Copy page

Practical patterns and examples for using the Messages API effectively

Copy page

This guide covers common patterns for working with the Messages API, including basic requests, multi-turn conversations, prefill techniques, and vision capabilities. For complete API specifications, see the [Messages API reference](/docs/en/api/messages).

## 

Basic request and response

Shell

    #!/bin/sh
    curl https://api.anthropic.com/v1/messages \
         --header "x-api-key: $ANTHROPIC_API_KEY" \
         --header "anthropic-version: 2023-06-01" \
         --header "content-type: application/json" \
         --data \
    '{
        "model": "claude-sonnet-4-5",
        "max_tokens": 1024,
        "messages": [
            {"role": "user", "content": "Hello, Claude"}
        ]
    }'

JSON

    {
      "id": "msg_01XFDUDYJgAACzvnptvVoYEL",
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "text",
          "text": "Hello!"
        }
      ],
      "model": "claude-sonnet-4-5",
      "stop_reason": "end_turn",
      "stop_sequence": null,
      "usage": {
        "input_tokens": 12,
        "output_tokens": 6
      }
    }

## 

Multiple conversational turns

The Messages API is stateless, which means that you always send the full conversational history to the API. You can use this pattern to build up a conversation over time. Earlier conversational turns don't necessarily need to actually originate from Claude — you can use synthetic `assistant` messages.

Shell

    #!/bin/sh
    curl https://api.anthropic.com/v1/messages \
         --header "x-api-key: $ANTHROPIC_API_KEY" \
         --header "anthropic-version: 2023-06-01" \
         --header "content-type: application/json" \
         --data \
    '{
        "model": "claude-sonnet-4-5",
        "max_tokens": 1024,
        "messages": [
            {"role": "user", "content": "Hello, Claude"},
            {"role": "assistant", "content": "Hello!"},
            {"role": "user", "content": "Can you describe LLMs to me?"}
    
        ]
    }'

JSON

    {
        "id": "msg_018gCsTGsXkYJVqYPxTgDHBU",
        "type": "message",
        "role": "assistant",
        "content": [
            {
                "type": "text",
                "text": "Sure, I'd be happy to provide..."
            }
        ],
        "stop_reason": "end_turn",
        "stop_sequence": null,
        "usage": {
          "input_tokens": 30,
          "output_tokens": 309
        }
    }

## 

Putting words in Claude's mouth

You can pre-fill part of Claude's response in the last position of the input messages list. This can be used to shape Claude's response. The example below uses `"max_tokens": 1` to get a single multiple choice answer from Claude.

Shell

    #!/bin/sh
    curl https://api.anthropic.com/v1/messages \
         --header "x-api-key: $ANTHROPIC_API_KEY" \
         --header "anthropic-version: 2023-06-01" \
         --header "content-type: application/json" \
         --data \
    '{
        "model": "claude-sonnet-4-5",
        "max_tokens": 1,
        "messages": [
            {"role": "user", "content": "What is latin for Ant? (A) Apoidea, (B) Rhopalocera, (C) Formicidae"},
            {"role": "assistant", "content": "The answer is ("}
        ]
    }'

JSON

    {
      "id": "msg_01Q8Faay6S7QPTvEUUQARt7h",
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "text",
          "text": "C"
        }
      ],
      "model": "claude-sonnet-4-5",
      "stop_reason": "max_tokens",
      "stop_sequence": null,
      "usage": {
        "input_tokens": 42,
        "output_tokens": 1
      }
    }

For more information on prefill techniques, see our [prefill guide](/docs/en/build-with-claude/prompt-engineering/prefill-claudes-response).

## 

Vision

Claude can read both text and images in requests. We support both `base64` and `url` source types for images, and the `image/jpeg`, `image/png`, `image/gif`, and `image/webp` media types. See our [vision guide](/docs/en/build-with-claude/vision) for more details.

Shell

    #!/bin/sh
    
    # Option 1: Base64-encoded image
    IMAGE_URL="https://upload.wikimedia.org/wikipedia/commons/a/a7/Camponotus_flavomarginatus_ant.jpg"
    IMAGE_MEDIA_TYPE="image/jpeg"
    IMAGE_BASE64=$(curl "$IMAGE_URL" | base64)
    
    curl https://api.anthropic.com/v1/messages \
         --header "x-api-key: $ANTHROPIC_API_KEY" \
         --header "anthropic-version: 2023-06-01" \
         --header "content-type: application/json" \
         --data \
    '{
        "model": "claude-sonnet-4-5",
        "max_tokens": 1024,
        "messages": [
            {"role": "user", "content": [
                {"type": "image", "source": {
                    "type": "base64",
                    "media_type": "'$IMAGE_MEDIA_TYPE'",
                    "data": "'$IMAGE_BASE64'"
                }},
                {"type": "text", "text": "What is in the above image?"}
            ]}
        ]
    }'
    
    # Option 2: URL-referenced image
    curl https://api.anthropic.com/v1/messages \
         --header "x-api-key: $ANTHROPIC_API_KEY" \
         --header "anthropic-version: 2023-06-01" \
         --header "content-type: application/json" \
         --data \
    '{
        "model": "claude-sonnet-4-5",
        "max_tokens": 1024,
        "messages": [
            {"role": "user", "content": [
                {"type": "image", "source": {
                    "type": "url",
                    "url": "https://upload.wikimedia.org/wikipedia/commons/a/a7/Camponotus_flavomarginatus_ant.jpg"
                }},
                {"type": "text", "text": "What is in the above image?"}
            ]}
        ]
    }'

JSON

    {
      "id": "msg_01EcyWo6m4hyW8KHs2y2pei5",
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "text",
          "text": "This image shows an ant, specifically a close-up view of an ant. The ant is shown in detail, with its distinct head, antennae, and legs clearly visible. The image is focused on capturing the intricate details and features of the ant, likely taken with a macro lens to get an extreme close-up perspective."
        }
      ],
      "model": "claude-sonnet-4-5",
      "stop_reason": "end_turn",
      "stop_sequence": null,
      "usage": {
        "input_tokens": 1551,
        "output_tokens": 71
      }
    }

## 

Tool use and computer use

See our [guide](/docs/en/agents-and-tools/tool-use/overview) for examples of how to use tools with the Messages API. See our [computer use guide](/docs/en/agents-and-tools/tool-use/computer-use-tool) for examples of how to control desktop computer environments with the Messages API. For guaranteed JSON output, see [Structured Outputs](/docs/en/build-with-claude/structured-outputs).

*   [Basic request and response](#basic-request-and-response)
*   [Multiple conversational turns](#multiple-conversational-turns)
*   [Putting words in Claude's mouth](#putting-words-in-claudes-mouth)
*   [Vision](#vision)
*   [Tool use and computer use](#tool-use-and-computer-
