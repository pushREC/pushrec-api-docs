# Generate an Image Using DALL·E 3 with Trigger.dev

## Overview

This example demonstrates using Trigger.dev to make reliable calls to AI APIs, specifically OpenAI's GPT-4o and DALL-E 3. The implementation showcases automatic retrying (up to 3 attempts), built-in error handling to prevent timeouts, and API call tracing.

## Task Implementation

```typescript
import { task } from "@trigger.dev/sdk";
import OpenAI from "openai";

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

type Payload = {
  theme: string;
  description: string;
};

export const generateContent = task({
  id: "generate-content",
  retry: {
    maxAttempts: 3,
  },
  run: async ({ theme, description }: Payload) => {
    const textResult = await openai.chat.completions.create({
      model: "gpt-4o",
      messages: generateTextPrompt(theme, description),
    });

    if (!textResult.choices[0]) {
      throw new Error("No content, retrying…");
    }

    const imageResult = await openai.images.generate({
      model: "dall-e-3",
      prompt: generateImagePrompt(theme, description),
    });

    if (!imageResult.data[0]) {
      throw new Error("No image, retrying…");
    }

    return {
      text: textResult.choices[0],
      image: imageResult.data[0].url,
    };
  },
});

function generateTextPrompt(theme: string, description: string): any {
  return `Theme: ${theme}\n\nDescription: ${description}`;
}

function generateImagePrompt(theme: string, description: string): any {
  return `Theme: ${theme}\n\nDescription: ${description}`;
}
```

## Testing

Use this payload to test in the dashboard:

```json
{
  "theme": "A beautiful sunset",
  "description": "A sunset over the ocean with a tiny yacht in the distance."
}
```

## Key Features

- **Automatic Retrying**: Configured to retry failed requests up to 3 times
- **Error Handling**: Validates API responses and throws errors if content generation fails
- **Dual API Integration**: Combines text generation (GPT-4o) with image generation (DALL-E 3)
- **Monitoring**: Trigger.dev provides built-in tracing and monitoring of all API calls
