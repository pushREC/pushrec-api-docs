---
source: https://openrouter.ai/docs/sdks/call-model/stop-conditions
scraped: 2026-01-08
---

# Stop Conditions

## Overview

The documentation covers controlling multi-turn execution using `stopWhen` with built-in helpers and custom conditions based on step count, tool calls, costs, or tokens.

## Default Behavior

Without explicit `stopWhen` specification, the system defaults to `stepCountIs(5)`.

## Built-in Stop Condition Helpers

### stepCountIs(n)

Stop after a specific number of steps:

```typescript
import { stepCountIs } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Help me plan a project',
  tools: [planningTool],
  stopWhen: stepCountIs(3),
});
```

### hasToolCall(name)

Halts execution when a designated tool executes:

```typescript
import { hasToolCall } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Research and then finalize',
  tools: [researchTool, finalizeTool],
  stopWhen: hasToolCall('finalize'),
});
```

### maxTokensUsed(n)

Terminates after consuming a token threshold:

```typescript
import { maxTokensUsed } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Write a detailed analysis',
  stopWhen: maxTokensUsed(10000),
});
```

### maxCost(amount)

Stops upon reaching a spending limit:

```typescript
import { maxCost } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Comprehensive research task',
  tools: [researchTool],
  stopWhen: maxCost(0.50), // Stop at $0.50
});
```

### finishReasonIs(reason)

Halts when the model produces a specific finish reason:

```typescript
import { finishReasonIs } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Generate content',
  stopWhen: finishReasonIs('stop'),
});
```

## Combining Conditions

Multiple conditions can be passed as an array, with execution stopping when **any** condition triggers:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Complex task',
  tools: [tool1, tool2],
  stopWhen: [
    stepCountIs(10),
    maxTokensUsed(20000),
    maxCost(1.00),
    hasToolCall('complete'),
  ],
});
```

## Custom Conditions

Functions receive a `StopConditionContext` containing `steps` data:

```typescript
type StopCondition = (ctx: StopConditionContext) => boolean | Promise<boolean>;

interface StopConditionContext {
  steps: StepResult[];
}
```

### StepResult Structure

Each `StepResult` includes:

| Property | Description |
|----------|-------------|
| `response` | The model response object |
| `toolCalls` | Array of tool calls made |
| `toolResults` | Results from tool executions |
| `inputTokens` | Tokens consumed for input |
| `outputTokens` | Tokens generated |
| `cost` | Cost of this step |

### Custom Condition Example

```typescript
const customStop = (ctx: StopConditionContext) => {
  const totalCost = ctx.steps.reduce((sum, step) => sum + step.cost, 0);
  const totalTokens = ctx.steps.reduce(
    (sum, step) => sum + step.inputTokens + step.outputTokens,
    0
  );

  return totalCost > 0.25 || totalTokens > 15000;
};

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Task',
  stopWhen: customStop,
});
```

## Advanced Patterns

### Time-Based Stopping

Using elapsed time:

```typescript
const startTime = Date.now();

const timeBasedStop = (ctx: StopConditionContext) => {
  const elapsed = Date.now() - startTime;
  return elapsed > 30000; // 30 seconds
};

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Task with time limit',
  stopWhen: timeBasedStop,
});
```

### Content-Based Stopping

Searching response text:

```typescript
const contentBasedStop = (ctx: StopConditionContext) => {
  const lastStep = ctx.steps.at(-1);
  if (!lastStep) return false;

  const responseText = lastStep.response.content || '';
  return responseText.includes('TASK COMPLETE');
};
```

### Quality-Based Stopping

Evaluating tool result metrics:

```typescript
const qualityBasedStop = (ctx: StopConditionContext) => {
  const lastStep = ctx.steps.at(-1);
  if (!lastStep?.toolResults) return false;

  return lastStep.toolResults.some(result => {
    return result.output?.confidence > 0.95;
  });
};
```

## Best Practices

| Practice | Description |
|----------|-------------|
| **Hard Limits** | Always include hard limits to prevent excessive execution |
| **Logging** | Log stopping reasons for debugging |
| **Conservative Testing** | Test conditions with conservative thresholds before deployment |
| **Combine Conditions** | Use multiple conditions as safety nets |

## Complete Example

```typescript
import {
  stepCountIs,
  maxTokensUsed,
  maxCost,
  hasToolCall
} from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Research and compile a report',
  tools: [researchTool, compileTool, submitTool],
  stopWhen: [
    // Stop after successful submission
    hasToolCall('submit'),
    // Safety limits
    stepCountIs(20),
    maxTokensUsed(50000),
    maxCost(2.00),
    // Custom condition
    (ctx) => {
      const errors = ctx.steps.filter(s =>
        s.toolResults?.some(r => r.output?.error)
      );
      return errors.length >= 3; // Stop after 3 errors
    },
  ],
});
```
