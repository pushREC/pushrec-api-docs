---
source: https://openrouter.ai/docs/guides/routing/routers/auto-router
scraped: 2026-01-08
---

# Auto Router

## Overview

OpenRouter's Auto Router (`openrouter/auto`) leverages NotDiamond technology to intelligently select the optimal AI model for your requests. As stated in the documentation, it "automatically selects the best model for your prompt" by analyzing factors like complexity and task type.

## Key Features

### Model Selection Process

The router analyzes prompts and chooses from curated high-quality models including Claude Sonnet 4.5, Claude Opus 4.5, GPT-5.1, Gemini 3 Pro, and DeepSeek 3.2, among others.

### Response Transparency

Responses include a `model` field indicating which specific model was selected, allowing you to track routing decisions.

## Implementation

To use the Auto Router, set the model parameter to `openrouter/auto` in your API request. The documentation provides code examples in TypeScript (both SDK and fetch), and Python, demonstrating how to make requests and access the selected model information.

## Configuration Options

You can restrict which models the router selects from using the `plugins` parameter with wildcard patterns. For example, `anthropic/*` matches all Anthropic models. Default settings can be configured through the Plugin Settings dashboard.

## Cost & Limitations

"You pay the standard rate for whichever model is selected. There is no additional fee for using the Auto Router." The feature requires the `messages` format, supports streaming, and works with standard OpenRouter features like tool calling.
