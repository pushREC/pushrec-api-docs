# Next.js Batch LLM Evaluator - Trigger.dev Documentation

## Overview

This full-stack example demonstrates a Next.js application that evaluates multiple LLM models using the Vercel AI SDK while streaming real-time updates to the frontend via Trigger.dev's Realtime capabilities.

The project incorporates several key technologies:

- **Next.js with Prisma**: A Next.js application paired with Prisma for database management
- **Trigger.dev Realtime**: Enables real-time streaming of task updates to the frontend
- **Vercel AI SDK**: Supports integration with multiple LLM providers including OpenAI, Anthropic, and XAI
- **Batch Task Distribution**: Uses the `batch.triggerByTaskAndWait` method to distribute evaluation work across different LLM models

## GitHub Repository

The complete source code is available in the [Batch LLM Evaluator repository](https://github.com/triggerdotdev/examples/tree/main/batch-llm-evaluator). You can fork this project as a foundation for your own implementations.

## Video Walkthrough

A video demonstration is available showing the project in action.

## Relevant Implementation Details

**Task Structure**: The `evaluateModels` task leverages `batch.triggerByTaskAndWait` to distribute evaluation across different models. Results feed into a `summarizeEvals` task that generates summary tags for each response.

**Frontend Subscription**: The application uses `useRealtimeRunsWithTag` hooks to monitor evaluation task runs across three distinct model evaluators (Anthropic, XAI, and OpenAI). Each component subscribes to streaming data using `useRealtimeRunWithStreams`.

**Modern Alternative**: For new projects, the newer `useRealtimeStream` hook (SDK 4.1.0+) offers improved type safety and simplified APIs compared to the older streaming approach used in this example.

## Additional Resources

- Trigger.dev Realtime documentation for subscription and update patterns
- Realtime streaming guide for task data transmission
- Batch triggering documentation for task distribution strategies
- React hooks reference for Trigger.dev API interactions
