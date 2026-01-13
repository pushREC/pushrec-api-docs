# Using the Vercel AI SDK with Trigger.dev

## Overview

The Vercel AI SDK is a streamlined way to interact with AI models from multiple providers including OpenAI, Microsoft Azure, Google Generative AI, Anthropic, Amazon Bedrock, Groq, and Perplexity. It offers a unified interface that allows developers to switch between different AI models without requiring code modifications.

## Generate Text Using OpenAI

This example demonstrates how to use the Vercel AI SDK to generate text responses from prompts with OpenAI's models.

### Task Code

```typescript
import { logger, task } from "@trigger.dev/sdk";
import { generateText } from "ai";
import { openai } from "@ai-sdk/openai";

export const openaiTask = task({
  id: "openai-text-generate",

  run: async (payload: { prompt: string }) => {
    const chatCompletion = await generateText({
      model: openai("gpt-4-turbo"),
      system: "You are a friendly assistant!",
      prompt: payload.prompt,
    });

    logger.log("chatCompletion text:" + chatCompletion.text);

    return chatCompletion;
  },
});
```

**Note:** Ensure the `OPENAI_API_KEY` environment variable is set.

## Testing Your Task

To test this task in the dashboard, use this payload:

```json
{
  "prompt": "What is the meaning of life?"
}
```

## Learn More

### Related Guides

- **Next.js setup guide**: Instructions for integrating Trigger.dev with Next.js using pages or app router
- **Next.js webhooks**: Creating webhook handlers in Next.js apps to trigger tasks

### Related Examples

- Fal.ai with Realtime image generation in Next.js
- Cartoon image generation using Fal.ai
- Vercel environment variable synchronization
- Broader Vercel AI SDK integration patterns
