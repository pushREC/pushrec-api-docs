---
source: https://openrouter.ai/docs/guides/features/broadcast/langfuse
scraped: 2026-01-08
---

# Langfuse Integration Guide

## Overview

Langfuse is an open-source LLM engineering platform for tracing, evaluating, and debugging LLM applications. The integration enables automatic trace collection from OpenRouter requests.

## Setup Instructions

### Step 1: Generate API Credentials

Navigate to Langfuse's project settings and access the API Keys section. You'll need to generate and copy both:
- Secret Key
- Public Key

### Step 2: Activate Broadcast Feature

In OpenRouter's settings, locate the Broadcast section and enable this feature to begin forwarding request data.

### Step 3: Input Langfuse Credentials

Use the edit function to add your authentication details:

| Field | Description |
|-------|-------------|
| Secret Key | Your Langfuse Secret Key |
| Public Key | Your Langfuse Public Key |
| Base URL | Optional - Default is `https://us.cloud.langfuse.com`. Adjust for regional or self-hosted deployments |

### Step 4: Verify Configuration

Execute a connection test to confirm proper setup. The system will only save your configuration upon successful verification.

### Step 5: Validate with Test Request

Send an API call through OpenRouter and confirm the trace appears in your Langfuse dashboard.

## Summary

This streamlined process connects your OpenRouter usage to comprehensive LLM observability tooling, enabling full tracing and debugging capabilities without code modifications.
