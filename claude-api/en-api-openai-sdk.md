---
source: https://docs.anthropic.com/en/api/openai-sdk
scraped: 2026-01-07
method: bright_data
duration_ms: 2241
---

OpenAI SDK compatibility - Claude Docs

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fapi%2Fopenai-sdk)

Search...

⌘K

Using the API

[Features overview](/docs/en/api/overview)[Client SDKs](/docs/en/api/client-sdks)[Beta headers](/docs/en/api/beta-headers)[Errors](/docs/en/api/errors)

[

Messages

](/docs/en/api/messages)

[

Create a Message

](/docs/en/api/messages/create)[

Count tokens in a Message

](/docs/en/api/messages/count_tokens)

Batches

[

Models

](/docs/en/api/models)

[

List Models

](/docs/en/api/models/list)[

Get a Model

](/docs/en/api/models/retrieve)

[

Beta



](/docs/en/api/beta)

Models

Messages

Files

Skills

[

Admin

](/docs/en/api/admin)

Organizations

Invites

Users

Workspaces

API Keys

Usage Report

Cost Report

[

Completions

](/docs/en/api/completions)

[

Create a Text Completion

](/docs/en/api/completions/create)

Support & configuration

[Rate limits](/docs/en/api/rate-limits)[Service tiers](/docs/en/api/service-tiers)[Versions](/docs/en/api/versioning)[IP addresses](/docs/en/api/ip-addresses)[Supported regions](/docs/en/api/supported-regions)[OpenAI SDK compatibility](/docs/en/api/openai-sdk)

[

Console

](/)

[

Log in

](/login)

Support & configuration

OpenAI SDK compatibility

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

Support & configuration

# OpenAI SDK compatibility

Copy page

Anthropic provides a compatibility layer that enables you to use the OpenAI SDK to test the Claude API. With a few code changes, you can quickly evaluate Anthropic model capabilities.

Copy page

*   [Getting started with the OpenAI SDK](#getting-started-with-the-open-ai-sdk)
*   [Quick start example](#quick-start-example)
*   [Important OpenAI compatibility limitations](#important-open-ai-compatibility-limitations)
*   [Rate limits](#rate-limits)
*   [Detailed OpenAI Compatible API Support](#detailed-open-ai-compatible-api-support)
*   [Request fields](#request-fields)
*   [Response fields](#response-fields)
*   [Error message compatibility](#error-message-compatibility)
*   [Header compatibility](#header-compatibility)

This compatibility layer is primarily intended to test and compare model capabilities, and is not considered a long-term or production-ready solution for most use cases. While we do intend to keep it fully functional and not make breaking changes, our priority is the reliability and effectiveness of the [Claude API](/docs/en/api/overview).

For more information on known compatibility limitations, see [Important OpenAI compatibility limitations](#important-openai-compatibility-limitations).

If you encounter any issues with the OpenAI SDK compatibility feature, please let us know [here](https://forms.gle/oQV4McQNiuuNbz9n8).

For the best experience and access to Claude API full feature set ([PDF processing](/docs/en/build-with-claude/pdf-support), [citations](/docs/en/build-with-claude/citations), [extended thinking](/docs/en/build-with-claude/extended-thinking), and [prompt caching](/docs/en/build-with-claude/prompt-caching)), we recommend using the native [Claude API](/docs/en/api/overview).

## 

Getting started with the OpenAI SDK

To use the OpenAI SDK compatibility feature, you'll need to:

1.  Use an official OpenAI SDK
2.  Change the following
    *   Update your base URL to point to the Claude API
    *   Replace your API key with an [Claude API key](/settings/keys)
    *   Update your model name to use a [Claude model](/docs/en/about-claude/models/overview)
3.  Review the documentation below for what features are supported

### 

Quick start example

## 

Important OpenAI compatibility limitations

#### 

API behavior

Here are the most substantial differences from using OpenAI:

*   The `strict` parameter for function calling is ignored, which means the tool use JSON is not guaranteed to follow the supplied schema. For guaranteed schema conformance, use the native [Claude API with Structured Outputs](/docs/en/build-with-claude/structured-outputs).
*   Audio input is not supported; it will simply be ignored and stripped from input
*   Prompt caching is not supported, but it is supported in [the Anthropic SDK](/docs/en/api/client-sdks)
*   System/developer messages are hoisted and concatenated to the beginning of the conversation, as Anthropic only supports a single initial system message.

Most unsupported fields are silently ignored rather than producing errors. These are all documented below.

#### 

Output quality considerations

If you’ve done lots of tweaking to your prompt, it’s likely to be well-tuned to OpenAI specifically. Consider using our [prompt improver in the Claude Console](/dashboard) as a good starting point.

#### 

System / Developer message hoisting

Most of the inputs to the OpenAI SDK clearly map directly to Anthropic’s API parameters, but one distinct difference is the handling of system / developer prompts. These two prompts can be put throughout a chat conversation via OpenAI. Since Anthropic only supports an initial system message, we take all system/developer messages and concatenate them together with a single newline (`\n`) in between them. This full string is then supplied as a single system message at the start of the messages.

#### 

Extended thinking support

You can enable [extended thinking](/docs/en/build-with-claude/extended-thinking) capabilities by adding the `thinking` parameter. While this will improve Claude's reasoning for complex tasks, the OpenAI SDK won't return Claude's detailed thought process. For full extended thinking features, including access to Claude's step-by-step reasoning output, use the native Claude API.

Python

    response = client.chat.completions.create(
        model="claude-sonnet-4-5",
        messages=...,
        extra_body={
            "thinking": { "type": "enabled", "budget_tokens": 2000 }
        }
    )

## 

Rate limits

Rate limits follow Anthropic's [standard limits](/docs/en/api/rate-limits) for the `/v1/messages` endpoint.

## 

Detailed OpenAI Compatible API Support

### 

Request fields

#### 

Simple fields

Field

Support status

`model`

Use Claude model names

`max_tokens`

Fully supported

`max_completion_tokens`

Fully supported

`stream`

Fully supported

`stream_options`

Fully supported

`top_p`

Fully supported

`parallel_tool_calls`

Fully supported

`stop`

All non-whitespace stop sequences work

#### 

`tools` / `functions` fields

### Show fields

#### 

`messages` array fields

### Show fields

### 

Response fields

Field

Support status

`id`

Fully supported

`choices[]`

Will always have a length of 1

`choices[].finish_reason`

Fully supported

`choices[].index`

Fully supported

`choices[].message.role`

Fully supported

`choices[].message.content`

Fully supported

`choices[].message.tool_calls`

Fully supported

`object`

Fully supported

### 

Error message compatibility

The compatibility layer maintains consistent error formats with the OpenAI API. However, the detailed error messages will not be equivalent. We recommend only using the error messages for logging and debugging.

### 

Header compatibility

While the OpenAI SDK automatically manages headers, here is the complete list of headers supported by the Claude API for developers who need to work with them directly.

Header

Support Status

`x-ratelimit-limit-requests`

Fully supported

`x-ratelimit-limit-tokens`

Fully supported

`x-ratelimit-remaining-requests`

Fully supported

`x-ratelimit-remaining-tokens`

Fully supported

`x-ratelimit-reset-requests`

Fully supported

`x-ratelimit-reset-tokens`

Fully supported

`retry-after`

Fully supported

`request-id`

Python

    from openai import OpenAI
    
    client = OpenAI(
        api_key="ANTHROPIC_API_KEY",  # Your Claude API key
        base_url="https://api.anthropic.com/v1/"  # the Claude API endpoint
    )
    
    response = client.chat.completions.create(
        model="claude-sonnet-4-5", # Anthropic model name
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Who are you?"}
        ],
    )
    
    print(response.choices[0].message.content)

`temperature`

Between 0 and 1 (inclusive). Values greater than 1 are capped at 1.

`n`

Must be exactly 1

`logprobs`

Ignored

`metadata`

Ignored

`response_format`

Ignored. For JSON output, use [Structured Outputs](/docs/en/build-with-claude/structured-outputs) with the native Claude API

`prediction`

Ignored

`presence_penalty`

Ignored

`frequency_penalty`

Ignored

`seed`

Ignored

`service_tier`

Ignored

`audio`

Ignored

`logit_bias`

Ignored

`store`

Ignored

`user`

Ignored

`modalities`

Ignored

`top_logprobs`

Ignored

`reasoning_effort`

Ignored

`created`

Fully supported

`model`

Fully supported

`finish_reason`

Fully supported

`content`

Fully supported

`usage.completion_tokens`

Fully supported

`usage.prompt_tokens`

Fully supported

`usage.total_tokens`

Fully supported

`usage.completion_tokens_details`

Always empty

`usage.prompt_tokens_details`

Always empty

`choices[].message.refusal`

Always empty

`choices[].message.audio`

Always empty

`logprobs`

Always empty

`service_tier`

Always empty

`system_fingerprint`

Always empty

Fully supported

`openai-version`

Always `2020-10-01`

`authorization`

Fully supported

`openai-processing-ms`

Alwa
