# Using Webhooks with Trigger.dev - Documentation Summary

## Overview

According to the documentation, "Webhooks are a way to send and receive events from external services." They enable real-time, event-driven functionality by allowing external services to trigger tasks when specific events occur.

A webhook handler is application code that executes in response to an incoming event, typically implemented as endpoints within your framework's routing system.

## Available Webhook Guides

The documentation provides several implementation guides:

1. **Next.js Webhooks** - Instructions for creating webhook handlers in Next.js applications and triggering tasks from them

2. **Remix Webhooks** - Guidance on webhook handler creation within Remix app frameworks

3. **Stripe Webhooks** - Specific example demonstrating task triggering when Stripe sends 'checkout session completed' events

4. **Supabase Database Webhooks** - Instructions for triggering tasks from Supabase edge functions when database events occur

## Key Concept

The core pattern involves setting up an endpoint in your application that receives webhook notifications from external services, then using Trigger.dev's SDK to trigger background tasks based on those incoming events. This creates a seamless integration between external services and long-running asynchronous work.

Each guide provides framework-specific implementation details, allowing developers to choose the approach matching their technology stack.
