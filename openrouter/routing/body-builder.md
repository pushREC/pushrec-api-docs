---
source: https://openrouter.ai/docs/guides/routing/routers/body-builder
scraped: 2026-01-08
---

# Body Builder

## Core Function

Body Builder transforms natural language descriptions into structured OpenRouter API requests for running tasks across multiple AI models simultaneously. It's a free service that generates JSON-ready request bodies.

## Key Features

### Functionality

The tool understands user intent and produces valid OpenRouter API requests without charging for generation itself—only standard model pricing applies when executing the requests.

### Model Coverage

Body Builder recognizes common model names and aliases (e.g., "Claude Sonnet" maps to `anthropic/claude-sonnet-4.5`, "GPT-5" to `openai/gpt-5.1`).

## Primary Use Cases

- **Comparative Analysis**: Running identical prompts across different models to evaluate performance differences
- **Redundancy**: Querying multiple providers for mission-critical answers requiring verification
- **Testing**: A/B testing prompts to identify optimal model-prompt combinations
- **Discovery**: Identifying which models perform best for specialized domains

## Technical Implementation

The service accepts a simple chat message describing your task and desired models, then returns a JSON structure containing an array of executable API request bodies. Users can subsequently execute these generated requests in parallel using standard async patterns.

## Important Constraints

The system works exclusively with message-format inputs and generates requests using only essential fields by default. Additionally, system messages included in user input get preserved in the output requests.
