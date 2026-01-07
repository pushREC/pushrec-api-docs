---
source: https://docs.anthropic.com/en/build-with-claude/prompt-engineering/chain-prompts
scraped: 2026-01-07
method: bright_data
duration_ms: 2494
---

Chain complex prompts for stronger performance - Claude Docs

Loading...

[](/docs/en/home)

*   [Developer Guide](/docs/en/intro)
*   [API Reference](/docs/en/api/overview)
*   [MCP
    
    ](https://modelcontextprotocol.io)
*   [Resources](/docs/en/resources/overview)
*   [Release Notes](/docs/en/release-notes/overview)

English

[Log in](/login?returnTo=%2Fdocs%2Fen%2Fbuild-with-claude%2Fprompt-engineering%2Fchain-prompts)

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

Prompt engineering

Chain complex prompts

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

Prompt engineering

# Chain complex prompts for stronger performance

Copy page

Copy page

While these tips apply broadly to all Claude models, you can find prompting tips specific to extended thinking models [here](/docs/en/build-with-claude/prompt-engineering/extended-thinking-tips).

When working with complex tasks, Claude can sometimes drop the ball if you try to handle everything in a single prompt. Chain of thought (CoT) prompting is great, but what if your task has multiple distinct steps that each require in-depth thought?

Enter prompt chaining: breaking down complex tasks into smaller, manageable subtasks.

## 

Why chain prompts?

1.  **Accuracy**: Each subtask gets Claude's full attention, reducing errors.
2.  **Clarity**: Simpler subtasks mean clearer instructions and outputs.
3.  **Traceability**: Easily pinpoint and fix issues in your prompt chain.

* * *

## 

When to chain prompts

Use prompt chaining for multi-step tasks like research synthesis, document analysis, or iterative content creation. When a task involves multiple transformations, citations, or instructions, chaining prevents Claude from dropping or mishandling steps.

**Remember:** Each link in the chain gets Claude's full attention!

**Debugging tip**: If Claude misses a step or performs poorly, isolate that step in its own prompt. This lets you fine-tune problematic steps without redoing the entire task.

* * *

## 

How to chain prompts

1.  **Identify subtasks**: Break your task into distinct, sequential steps.
2.  **Structure with XML for clear handoffs**: Use XML tags to pass outputs between prompts.
3.  **Have a single-task goal**: Each subtask should have a single, clear objective.
4.  **Iterate**: Refine subtasks based on Claude's performance.

### 

Example chained workflows:

*   **Multi-step analysis**: See the legal and business examples below.
*   **Content creation pipelines**: Research → Outline → Draft → Edit → Format.
*   **Data processing**: Extract → Transform → Analyze → Visualize.
*   **Decision-making**: Gather info → List options → Analyze each → Recommend.
*   **Verification loops**: Generate content → Review → Refine → Re-review.

**Optimization tip**: For tasks with independent subtasks (like analyzing multiple docs), create separate prompts and run them in parallel for speed.

### 

Advanced: Self-correction chains

You can chain prompts to have Claude review its own work! This catches errors and refines outputs, especially for high-stakes tasks.

### Example: Self-correcting research summary

* * *

## 

Examples

### Example: Analyzing a legal contract (without chaining)

### Example: Analyzing a legal contract (with chaining)

* * *

[

Prompt library

Get inspired by a curated selection of prompts for various tasks and use cases.







](/docs/en/resources/prompt-library/library)[

](https://github.com/anthropics/prompt-eng-interactive-tutorial)

*   [Why chain prompts?](#why-chain-prompts)
*   [When to chain prompts](#when-to-chain-prompts)
*   [How to chain prompts](#how-to-chain-prompts)
*   [Example chained workflows:](#example-chained-workflows)
*   [Advanced: Self-correction chains](#advanced-self-correction-chains)
*   [Examples](#examples)

### Example: Multitenancy strategy review

GitHub prompting tutorial

An example-filled tutorial that covers the prompt engineering concepts found in our docs.

[

Google Sheets prompting tutorial

A lighter weight version of our prompt engineering tutorial via an interactive spreadsheet.







](https://docs.google.com/spreadsheets/d/19jzLgRruG9kjUQNK
