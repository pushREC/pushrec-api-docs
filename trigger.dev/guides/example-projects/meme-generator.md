# Meme Generator with Human-in-the-Loop Approval - Documentation

## Overview

This example demonstrates a complete full-stack application that combines several technologies:

- A **Next.js application** with an endpoint for approving generated memes
- **Trigger.dev tasks** that orchestrate image generation and waitpoint workflows
- **OpenAI DALL-E 3** for image generation capabilities
- A **Slack app** integration that provides the human approval step, with buttons linking to the approval endpoint

## GitHub Repository

The complete source code is available in the [triggerdotdev/examples repository](https://github.com/triggerdotdev/examples/tree/main/meme-generator-human-in-the-loop). Users can fork this project to use as a foundation for their own applications.

## Slack Integration

The system posts generated meme variants to Slack where human reviewers can approve or reject them through interactive buttons before the workflow continues.

## Key Implementation Components

**Meme Generator Task** (`memegenerator.ts`):
- Generates multiple meme variants using DALL-E 3
- Employs `batchTriggerAndWait` to generate variants simultaneously (necessary since DALL-E 3 processes one image at a time)
- Creates a waitpoint token for pausing execution
- Sends generated images with approval buttons to Slack
- Handles the complete approval workflow

**Approval Endpoint** (`page.tsx`):
- Processes user selections from Slack button interactions
- Completes the waitpoint with the selected meme variant
- Provides success or failure feedback to the approver

## Related Resources

- [Waitpoint tokens documentation](/wait-for-token) - Learn about human-in-the-loop workflows
- [OpenAI DALL-E API documentation](https://platform.openai.com/docs/guides/images)
- [Next.js Documentation](https://nextjs.org/docs)
- [Slack Incoming Webhooks](https://api.slack.com/messaging/webhooks)
