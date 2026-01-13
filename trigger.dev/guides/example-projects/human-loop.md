# Human-in-the-loop Workflow with ReactFlow and Trigger.dev Waitpoint Tokens

## Overview

This demonstration integrates several technologies to enable audio summaries of newspaper articles through a human-in-the-loop workflow:

- **Next.js** for the web application
- **ReactFlow** for the workflow UI visualization
- **Trigger.dev Realtime** for subscribing to task runs and displaying real-time workflow step status
- **Trigger.dev Waitpoint Tokens** to implement human-in-the-loop review steps
- **OpenAI API** for generating article summaries
- **ElevenLabs** for text-to-speech conversion

## GitHub Repository

The complete project code is available in the Trigger.dev examples repository, allowing developers to fork and adapt it for their own use cases.

## Architecture

### Task Composition

The workflow is built through task composition where each node represents a Trigger.dev task:

1. **summarizeArticle** - Uses OpenAI API to generate article summaries
2. **convertTextToSpeech** - Converts summaries to audio using ElevenLabs and uploads to S3
3. **reviewSummary** - Human-in-the-loop step requiring approval before continuation
4. **articleWorkflow** - Orchestrates task execution

### ReactFlow Implementation

Three custom node types compose the UI:

- **InputNode** - Workflow trigger accepting article URLs
- **ActionNode** - Displays real-time task run status via React hooks
- **ReviewNode** - Shows results and requests user approval; completes waitpoint tokens

### Waitpoint Token Usage

Tokens are created within Next.js server actions with tags, timeouts, and idempotency keys, then completed upon user approval with structured payload data.

## Resources

- Trigger.dev Realtime documentation
- Realtime streaming capabilities
- React hooks for API interaction
- Waitpoint tokens guide
