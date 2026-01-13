# Vercel AI SDK Image Generator - Trigger.dev

## Overview

This Next.js example demonstrates a full-stack implementation combining multiple technologies. The project utilizes:

- **Next.js application** with shadcn UI components for the user interface
- **useRealtimeRun React hook** to subscribe to task execution and display live updates on the frontend
- **Vercel AI SDK** for generating images using OpenAI's DALL-E models

## Key Components

### GitHub Repository
The complete source code is available in the Trigger.dev examples repository, available for forking and customization as a project starting point.

### Architecture
The demonstration is a full-stack example that shows:

1. A frontend application built with Next.js and shadcn components
2. Real-time subscription to task execution status using React hooks
3. Backend image generation using the Vercel AI SDK

### Relevant Implementation Files

**Task Code**: The Trigger.dev task implementation (`src/trigger/realtime-generate-image.ts`) handles image generation using the Vercel AI SDK with DALL-E models.

**Frontend Integration**: The React component (`src/app/processing/[id]/ProcessingContent.tsx`) implements the useRealtimeRun hook to subscribe to task execution and display real-time progress updates to users.

## Learning Resources

To understand the implementation better, consult:

- **Trigger.dev Realtime documentation** - covers subscribing to runs and receiving real-time updates
- **Realtime streaming documentation** - details streaming data from tasks
- **Batch Triggering documentation** - explains triggering multiple tasks at once
- **React hooks reference** - documents available React hooks for Trigger.dev API integration
