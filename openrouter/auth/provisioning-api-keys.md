---
source: https://openrouter.ai/docs/guides/overview/auth/provisioning-api-keys
scraped: 2026-01-08
---

# Provisioning API Keys

## Overview

OpenRouter enables programmatic API key management through dedicated endpoints for creation, retrieval, updating, and deletion operations.

## Key Setup

Users must first generate a Provisioning API key via the [settings page](https://openrouter.ai/settings/provisioning-keys). As noted in the documentation, "Provisioning keys cannot be used to make API calls to OpenRouter's completion endpoints - they are exclusively for key management operations."

## Primary Use Cases

The system supports several scenarios:

- **SaaS platforms** distributing unique credentials to customers
- **Security practices** involving regular key rotation
- **Monitoring** with automatic disabling based on usage thresholds

## API Endpoints

All operations target `/api/v1/keys` and require Bearer token authentication using the Provisioning key.

### Operations Available

- **List**: Retrieve up to 100 keys with offset-based pagination
- **Create**: Generate new keys with optional credit limits
- **Retrieve**: Fetch specific key details using key hash
- **Update**: Modify name, status, limits, and reset schedules
- **Delete**: Remove keys permanently

## Implementation Examples

The documentation provides working code samples in TypeScript (SDK and fetch), and Python using the requests library, demonstrating each operation with proper authentication headers and request formatting.

## Response Structure

Keys return comprehensive metadata including creation/update timestamps, usage metrics (overall and categorized by period), limit information, and BYOK (Bring Your Own Key) tracking.
