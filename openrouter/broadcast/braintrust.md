---
source: https://openrouter.ai/docs/guides/features/broadcast/braintrust
scraped: 2026-01-08
---

# Braintrust Integration Guide

## Overview

Braintrust is an end-to-end platform for evaluating, monitoring, and improving LLM applications. This integration enables automatic trace collection from OpenRouter requests.

## Setup Process

### Step 1: Obtain Credentials

Retrieve your API key and Project ID from Braintrust's Account Settings.

### Step 2: Activate Broadcast Feature

Navigate to OpenRouter's Settings > Broadcast section and enable the broadcast functionality.

### Step 3: Input Braintrust Details

Enter your configuration:

| Field | Description |
|-------|-------------|
| Api Key | Authentication credential from Braintrust |
| Project Id | Identifier for your Braintrust project |
| Base Url | Optional - defaults to `https://api.braintrust.dev` |

### Step 4: Verify Configuration

Run a connection test to confirm settings are correct. The system only preserves changes after successful verification.

### Step 5: Generate Sample Data

Execute an API call through OpenRouter and observe the resulting trace within Braintrust's interface.

## Summary

This integration streamlines the process of capturing and analyzing LLM application behavior across platforms.
