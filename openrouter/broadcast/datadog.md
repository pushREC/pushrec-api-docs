---
source: https://openrouter.ai/docs/guides/features/broadcast/datadog
scraped: 2026-01-08
---

# Datadog Integration Guide

## Overview

The Datadog LLM Observability integration enables automatic trace collection from OpenRouter API requests, facilitating:
- Root cause analysis
- Performance monitoring
- Quality assessment of LLM applications

## Setup Process

### Step 1: API Key Creation

Navigate to Datadog's Organization Settings and generate a new API key from the API Keys section.

### Step 2: Activate Broadcast Feature

Access OpenRouter's Settings > Broadcast page and enable the broadcast functionality.

### Step 3: Datadog Configuration

Configure the integration by entering:

| Field | Description |
|-------|-------------|
| API Key | Your Datadog API key |
| ML App | Application identifier for your LLM app |
| URL Endpoint | Defaults to US5 region; customizable for other regions |

### Step 4: Connection Verification

Test the configuration using the connection test feature, which must succeed before saving settings.

### Step 5: Trace Validation

Execute an API request through OpenRouter and verify trace visibility in the Datadog dashboard.

## Key Features

The integration supports:
- Investigation of application issues
- Operational performance tracking
- Evaluation of quality, privacy, and safety metrics across LLM implementations
