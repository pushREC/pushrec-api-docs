---
source: https://openrouter.ai/docs/guides/features/broadcast/langsmith
scraped: 2026-01-08
---

# LangSmith Integration Guide

## Overview

LangSmith is LangChain's platform for debugging, testing, evaluating, and monitoring LLM applications. The integration allows OpenRouter users to automatically receive request traces.

## Setup Process

### Step 1: Obtain Credentials

Retrieve your API key from LangSmith's Settings > API Keys section and identify your project name.

### Step 2: Enable Broadcasting

Activate the Broadcast feature within OpenRouter's settings dashboard.

### Step 3: Connect LangSmith

Input your configuration details:

| Field | Description |
|-------|-------------|
| API Key | Your LangSmith API key (formatted as `lsv2_pt_...`) |
| Project | Your project identifier |
| Endpoint URL | Optional - for self-hosted deployments |

### Step 4: Verify Connection

Execute a test to confirm proper setup before saving.

### Step 5: Monitor Traces

Send requests and observe detailed trace data appearing in your LangSmith project.

## Data Transmitted

OpenRouter transmits telemetry information via OpenTelemetry protocol, encompassing:

- Model name
- Token counts
- Costs
- Request parameters
- LangSmith-specific identifiers
- User information
- Performance metrics
- Input/output content
- Token usage breakdown
- Pricing details
- Timing information

Error events are logged when requests fail.
