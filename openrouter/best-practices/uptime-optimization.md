---
source: https://openrouter.ai/docs/guides/best-practices/uptime-optimization
scraped: 2026-01-08
---

# Uptime Optimization

## Overview

OpenRouter implements a comprehensive system for maintaining service reliability. The platform continuously monitors the health and availability of AI providers to ensure maximum uptime for your applications.

## Key Monitoring Features

The system tracks three primary metrics across all integrated providers:

1. **Response times**
2. **Error rates**
3. **Real-time availability**

This monitoring data informs routing decisions and gives users visibility into service dependability.

## Provider Examples

The documentation includes uptime tracking examples for:

- Claude 4 Sonnet (Anthropic)
- Llama 3.3 70B Instruct (Meta)

These examples demonstrate how the monitoring system measures and displays reliability information.

## Customization Options

Users aren't locked into automatic routing. While intelligent routing optimizes availability, developers can customize provider selection using request parameters to direct requests to specific providers.

The system maintains automatic fallback capabilities even when users specify preferences.

## Additional Resources

For deeper customization guidance, see the Provider Routing documentation.
