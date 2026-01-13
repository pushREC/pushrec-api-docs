# Translate Text and Refine It Based on Feedback - Documentation Summary

## Overview

This guide demonstrates implementation of the **evaluator-optimizer pattern**, where one LLM generates content while another provides iterative feedback. This approach excels for tasks with clear evaluation criteria requiring refinement.

## Core Concept

The pattern uses two LLM calls in a loop:
1. **Generator**: Creates or improves the translation
2. **Evaluator**: Assesses quality and provides specific feedback

## Key Implementation Details

### Task Structure

The `translateAndRefine` task accepts:
- `text`: Source content to translate
- `targetLanguage`: Destination language
- `previousTranslation`: Prior attempt (optional)
- `feedback`: Evaluator suggestions (optional)
- `rejectionCount`: Iteration counter (optional)

### Maximum Iterations

The task terminates after 10 iterations to prevent infinite loops, returning `MAX_ITERATIONS_REACHED` status if the limit is reached.

### Translation Generation

Uses `generateText` from Vercel's AI SDK with the `o1-mini` model. The prompt differs based on whether this is an initial translation or refinement:
- **First pass**: "Translate this text into [language], preserving style and meaning"
- **Refinement**: Incorporates previous translation and feedback

### Evaluation Criteria

The evaluator assesses:
- Accuracy of meaning (primary consideration)
- Natural flow in target language
- Preservation of stylistic elements

**Approval threshold**: 90%+ quality triggers "APPROVED" response

### Telemetry

Both calls use `experimental_telemetry` to log LLM interactions for dashboard visibility.

### Recursive Refinement

Upon rejection, the task recursively calls itself with:
- Current translation as `previousTranslation`
- Evaluator feedback as `feedback`
- Incremented `rejectionCount`

## Testing

The dashboard Test page accepts payloads like:
```json
{
  "text": "In the twilight of his years, the old clockmaker's hands, once steady as the timepieces he crafted, now trembled like autumn leaves in the wind.",
  "targetLanguage": "French"
}
```

This example provides sufficient complexity to require multiple iterations for quality refinement.
