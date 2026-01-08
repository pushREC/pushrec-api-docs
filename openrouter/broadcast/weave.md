---
source: https://openrouter.ai/docs/guides/features/broadcast/weave
scraped: 2026-01-08
---

# W&B Weave Integration Guide

## Overview

W&B Weave is an observability platform for LLM applications. This integration connects it to OpenRouter for automatic request tracing.

## Setup Steps

### Step 1: Retrieve Credentials

Get your API credentials from W&B's User Settings page.

### Step 2: Enable Broadcast

Navigate to OpenRouter's Broadcast settings and activate the feature.

### Step 3: Configure Integration

Enter your configuration details:

| Field | Description |
|-------|-------------|
| API Credentials | Your W&B API key |
| Organization | Your username or team identifier |
| Project | Target project name for trace logs |
| Endpoint URL | Optional - defaults to `https://trace.wandb.ai` |

### Step 4: Validate Connection

Use the testing function to verify the connection before finalizing settings.

### Step 5: Confirm Traces

Execute an API call via OpenRouter and confirm the trace appears in your W&B dashboard.

## Summary

The setup process requires minimal configuration and includes a verification step to ensure proper connection between the two platforms before saving.
