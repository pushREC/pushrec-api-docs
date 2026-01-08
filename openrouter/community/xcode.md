---
source: https://openrouter.ai/docs/guides/community/xcode
scraped: 2026-01-08
---

# Xcode

Integrate OpenRouter with Apple Intelligence in Xcode 26. Complete setup guide for accessing hundreds of AI models directly in your Xcode development environment.

## Overview

Xcode 26 introduces Apple Intelligence features that can be extended with custom AI providers. Configure OpenRouter to access 500+ models directly within your Xcode development workflow.

## Prerequisites

- Xcode 26 or later
- macOS Tahoe 16.0 or later
- OpenRouter API key

## Configuration

### Step 1: Open Xcode Settings

1. Open Xcode
2. Go to **Xcode > Settings** (or press `Cmd + ,`)
3. Navigate to the **Intelligence** tab

### Step 2: Add Custom Provider

1. Click the **+** button to add a new provider
2. Select **Custom OpenAI-Compatible** from the dropdown
3. Enter the following details:

| Field | Value |
|-------|-------|
| **Name** | OpenRouter |
| **Base URL** | `https://openrouter.ai/api/v1` |
| **API Key** | Your OpenRouter API key |
| **Default Model** | `openai/gpt-4o` |

### Step 3: Save and Test

1. Click **Save**
2. Click **Test Connection** to verify the setup
3. Select OpenRouter as your preferred provider

## Usage

### Code Completion

With OpenRouter configured, you can use AI-powered code completion:

1. Start typing code in the editor
2. Press `Option + Esc` or wait for suggestions
3. Accept suggestions with `Tab`

### Chat Assistant

Access the AI chat assistant:

1. Open the Assistant pane (`Cmd + Shift + A`)
2. Select OpenRouter from the provider dropdown
3. Ask questions about your code

### Inline Suggestions

Enable inline suggestions:

1. Go to **Xcode > Settings > Intelligence**
2. Enable **Show inline suggestions**
3. Select your preferred model

## Model Selection

Configure different models for different tasks:

| Task | Recommended Model |
|------|-------------------|
| Code completion | `openai/gpt-4o-mini` |
| Code explanation | `anthropic/claude-3.5-sonnet` |
| Documentation | `openai/gpt-4o` |
| Quick fixes | `google/gemini-2.0-flash` |

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Option + Esc` | Trigger completion |
| `Tab` | Accept suggestion |
| `Esc` | Dismiss suggestion |
| `Cmd + Shift + A` | Open Assistant |

## Environment Variables (Optional)

For command-line tools or scripts:

```bash
export OPENROUTER_API_KEY=sk-or-v1-...
```

## Troubleshooting

### Connection Issues

- Verify your API key is correct
- Check that the base URL is `https://openrouter.ai/api/v1`
- Ensure you have internet connectivity

### Model Not Found

- Use the full model ID format: `provider/model-name`
- Check the [OpenRouter models page](https://openrouter.ai/models) for available models

### Slow Responses

- Try a faster model like `google/gemini-2.0-flash`
- Check your network connection

---

*For more information, visit the [Apple Developer documentation](https://developer.apple.com/xcode/) and [OpenRouter API reference](https://openrouter.ai/docs).*
