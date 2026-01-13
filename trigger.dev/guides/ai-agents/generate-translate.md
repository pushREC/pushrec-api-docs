# Generate and Translate Copy - Trigger.dev Guide

## Overview

This guide demonstrates **prompt chaining**, an AI workflow pattern that decomposes complex tasks into sequential steps. Each LLM call processes the previous output, trading latency for accuracy.

## Key Concept

"Prompt chaining" breaks difficult operations into easier, more focused tasks with programmatic checks between steps to maintain process integrity.

## Example Task Architecture

The implementation creates a workflow that:

1. **Generates marketing copy** - Uses OpenAI's o1-mini model with system and user prompts
2. **Validates output** - Checks generated text meets word count requirements (±10 words tolerance)
3. **Translates copy** - Converts validated text to target language while preserving tone

## Code Structure

The task accepts a `TranslatePayload` interface containing:
- `marketingSubject` (string) - Topic for copy generation
- `targetLanguage` (string) - Destination language for translation
- `targetWordCount` (number) - Desired word count (±10 word variance allowed)

## Implementation Details

**Step 1: Generate Copy**
- Calls `generateText()` from Vercel AI SDK
- Uses `experimental_telemetry` for LLM logging
- Generates marketing content based on subject and word count target

**Step 2: Validate**
- Splits generated text by whitespace to count words
- Throws error if outside acceptable range
- Prevents translation of invalid output

**Step 3: Translate**
- Sends validated copy to translation model
- Maintains marketing impact and tone
- Returns both English and translated versions

## Testing

Access the dashboard test page, select "generate-and-translate-copy" task, and provide:
```json
{
  "marketingSubject": "The controversial new Jaguar electric concept car",
  "targetLanguage": "Spanish",
  "targetWordCount": 100
}
```

This demonstrates sequential LLM calls with validation gates between execution phases.
