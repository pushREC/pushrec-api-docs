# Claude 3.7 Thinking Chatbot - Trigger.dev Documentation

## Overview

This example demonstrates a full-stack Next.js application that leverages several key technologies:

- **Next.js** framework for the chat interface
- **Trigger.dev Realtime** for streaming AI responses and reasoning to the frontend
- **Claude 3.7 Sonnet** model for generating responses
- **Vercel AI SDK** for Claude model integration

## Key Components

### Claude Stream Task
Located in `src/trigger/claude-stream.ts`, this Trigger.dev task manages the streaming connection with Claude, enabling real-time response generation.

### Chat Component
The `app/components/claude-chat.tsx` file houses the main interface and handles:
- Message state management
- User input processing
- Message bubble rendering
- Trigger.dev streaming integration

### Stream Response Component
Within the chat component, the StreamResponse component manages:
- Display of streaming text from Claude
- Toggle for showing/hiding the thinking process with animation
- Auto-scrolling as content arrives

## GitHub Repository

The complete codebase is available in the examples repository, allowing you to fork and customize it for your own projects.

## Learning Resources

To deepen your understanding:
- **Trigger.dev Realtime** documentation covers subscribing to runs and real-time updates
- **Realtime streaming** guides explain data streaming from tasks
- **Batch Triggering** documentation details triggering tasks in batches
- **React hooks** resources explain interacting with the Trigger.dev API
