---
source: https://openrouter.ai/docs/guides/community/zapier
scraped: 2026-01-08
---

# Zapier

Integrate OpenRouter with Zapier to build AI-powered automation workflows. Access 500+ AI models in your workflows and connect to 8000+ apps through Zapier.

## Overview

OpenRouter's Zapier integration enables you to add AI capabilities to any automated workflow. Use any of OpenRouter's 500+ models to process text, generate content, analyze data, and more.

## Getting Started

### Step 1: Create a Zap

1. Log in to [Zapier](https://zapier.com)
2. Click **Create Zap**
3. Choose your trigger app and event

### Step 2: Add OpenRouter Action

1. Search for **OpenRouter** in the action step
2. Select **Create Chat Completion**
3. Connect your OpenRouter account

### Step 3: Configure the Action

| Field | Description |
|-------|-------------|
| **Model** | Select from 500+ models (e.g., `openai/gpt-4o`) |
| **Messages** | The conversation messages to send |
| **System Message** | Optional system prompt |
| **Max Tokens** | Maximum response length |
| **Temperature** | Creativity level (0-2) |

## Authentication

Connect your OpenRouter account:

1. Click **Connect Account**
2. Enter your OpenRouter API key
3. Click **Test Connection**
4. Save the connection

## Example Workflows

### Email Summarization

**Trigger:** New email in Gmail
**Action:** OpenRouter - Summarize email content
**Action:** Slack - Post summary to channel

```
Model: openai/gpt-4o-mini
System: Summarize this email in 2-3 bullet points
Messages: {{email_body}}
```

### Content Generation

**Trigger:** New row in Google Sheets
**Action:** OpenRouter - Generate content
**Action:** Google Docs - Create document

```
Model: anthropic/claude-3.5-sonnet
System: You are a content writer
Messages: Write a blog post about {{topic}}
```

### Customer Support

**Trigger:** New support ticket in Zendesk
**Action:** OpenRouter - Draft response
**Action:** Zendesk - Add internal note

```
Model: openai/gpt-4o
System: You are a helpful support agent
Messages: Draft a response to: {{ticket_description}}
```

### Social Media

**Trigger:** Schedule (daily)
**Action:** OpenRouter - Generate post
**Action:** Twitter - Post tweet

```
Model: google/gemini-2.0-flash
System: Write engaging social media content
Messages: Create a tweet about {{topic}}
Max Tokens: 280
```

## Available Actions

| Action | Description |
|--------|-------------|
| **Create Chat Completion** | Send messages and get a response |
| **Create Completion** | Generate text from a prompt |
| **List Models** | Get available models |

## Model Selection

Choose the right model for your workflow:

| Use Case | Recommended Model |
|----------|-------------------|
| Quick tasks | `google/gemini-2.0-flash` |
| General purpose | `openai/gpt-4o` |
| Long content | `anthropic/claude-3.5-sonnet` |
| Cost-effective | `openai/gpt-4o-mini` |

## Best Practices

1. **Use system messages** - Define the AI's role clearly
2. **Set max tokens** - Control response length
3. **Test thoroughly** - Run test Zaps before going live
4. **Handle errors** - Add error handling paths
5. **Monitor usage** - Track API usage in OpenRouter dashboard

## Pricing

- OpenRouter usage is billed separately from Zapier
- Check model pricing at [openrouter.ai/models](https://openrouter.ai/models)
- Zapier pricing based on your Zapier plan

## Troubleshooting

### Authentication Failed

- Verify your API key is correct
- Ensure the API key has not expired
- Check for extra spaces in the key

### Empty Response

- Increase max tokens
- Check that messages are properly formatted
- Verify the model is available

### Rate Limits

- Add delays between actions
- Use a model with higher rate limits
- Upgrade your OpenRouter plan if needed

---

*For more information, visit the [Zapier Help Center](https://help.zapier.com) and [OpenRouter documentation](https://openrouter.ai/docs).*
