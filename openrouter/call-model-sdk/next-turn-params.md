---
source: https://openrouter.ai/docs/sdks/call-model/next-turn-params
scraped: 2026-01-08
---

# Next Turn Params

## Overview

`nextTurnParams` enables tools to modify model parameters for subsequent conversation turns, supporting use cases like skill systems, adaptive behavior, and progressive context building.

## Key Capabilities

| Capability | Description |
|------------|-------------|
| **Skills/Plugins** | Load domain-specific instructions when activated |
| **Progressive Context** | Accumulate context across tool usage |
| **Adaptive Behavior** | Adjust parameters based on tool outcomes |
| **Clean Separation** | Tools manage their own context independently |

## Execution Flow

The system follows this sequence:

1. Model generates tool calls
2. All `execute` functions run
3. `nextTurnParams` functions execute (in tools array order)
4. Modified parameters apply to next model turn
5. Process repeats until tool calling stops

## Available Modifications

Tools can adjust these `CallModelInput` parameters:

| Parameter | Description |
|-----------|-------------|
| `input` | Message history |
| `model` | Model selection |
| `instructions` | System prompts |
| `temperature` | Randomness control |
| `maxOutputTokens` | Output length limit |
| `topP` | Nucleus sampling |
| `topK` | Top-k sampling |

## Context Object Properties

The `nextTurnParams` function receives:

| Property | Description |
|----------|-------------|
| `params` | Validated tool input parameters |
| `context.input` | Current message history |
| `context.model` | Current model |
| `context.instructions` | Current system instructions |
| `context.temperature` | Current temperature |
| `context.maxOutputTokens` | Current max tokens |

## Implementation Patterns

### 1. Expert Mode

Enhancing technical responses through instruction modification:

```typescript
const expertModeTool = tool({
  name: 'enable_expert_mode',
  description: 'Enable expert mode for detailed technical responses',
  inputSchema: z.object({
    domain: z.string().describe('The technical domain'),
  }),
  execute: async ({ params }) => {
    return { enabled: true, domain: params.domain };
  },
  nextTurnParams: ({ params, context }) => {
    return {
      instructions: `${context.instructions}\n\nYou are now in expert mode for ${params.domain}. Provide detailed, technical responses.`,
    };
  },
});
```

### 2. Skills Loading

Preventing duplicate skill injection via idempotency checks:

```typescript
const loadSkillTool = tool({
  name: 'load_skill',
  description: 'Load a skill into the conversation',
  inputSchema: z.object({
    skillName: z.string(),
  }),
  execute: async ({ params }) => {
    const skillContent = await loadSkillFile(params.skillName);
    return { loaded: true, skill: params.skillName };
  },
  nextTurnParams: ({ params, context }) => {
    const skillMarker = `[SKILL:${params.skillName}]`;

    // Idempotency check - prevent duplicate loading
    if (JSON.stringify(context.input).includes(skillMarker)) {
      return context.input;
    }

    const skillContent = getSkillContent(params.skillName);
    return {
      input: [
        ...context.input,
        { role: 'system', content: `${skillMarker}\n${skillContent}` },
      ],
    };
  },
});
```

### 3. Research Accumulation

Building contextual knowledge progressively:

```typescript
const researchTool = tool({
  name: 'research',
  description: 'Research a topic and add findings to context',
  inputSchema: z.object({
    topic: z.string(),
  }),
  execute: async ({ params }) => {
    const findings = await performResearch(params.topic);
    return { findings };
  },
  nextTurnParams: ({ params, context }) => {
    return {
      input: [
        ...context.input,
        {
          role: 'system',
          content: `Research findings for "${params.topic}": ${JSON.stringify(context.result)}`,
        },
      ],
    };
  },
});
```

### 4. Model Upgrading

Selecting better models for complex tasks:

```typescript
const complexTaskTool = tool({
  name: 'complex_analysis',
  description: 'Perform complex analysis requiring a more capable model',
  inputSchema: z.object({
    data: z.string(),
  }),
  execute: async ({ params }) => {
    return { analyzed: true };
  },
  nextTurnParams: ({ context }) => {
    return {
      model: 'anthropic/claude-3-opus',
      temperature: 0.1,
    };
  },
});
```

### 5. Multi-Language Support

Adapting responses to user language preferences:

```typescript
const setLanguageTool = tool({
  name: 'set_language',
  description: 'Set the response language',
  inputSchema: z.object({
    language: z.string(),
  }),
  execute: async ({ params }) => {
    return { language: params.language };
  },
  nextTurnParams: ({ params, context }) => {
    return {
      instructions: `${context.instructions}\n\nRespond in ${params.language}.`,
    };
  },
});
```

## Best Practices

| Practice | Description |
|----------|-------------|
| **Idempotency Checks** | Always check if content is already present before adding |
| **Type-Safe Context** | Use proper typing for context access |
| **Minimal Modifications** | Make targeted changes, avoid unnecessary parameter spreading |
| **Preserve Input** | Append to existing input rather than replacing |

## Example: Complete Skill System

```typescript
const skillLoaderTool = tool({
  name: 'load_skill',
  description: 'Load a domain-specific skill',
  inputSchema: z.object({
    skill: z.enum(['coding', 'writing', 'analysis']),
  }),
  execute: async ({ params }) => {
    return { loaded: params.skill };
  },
  nextTurnParams: ({ params, context }) => {
    const skillMarker = `<!-- SKILL:${params.skill} -->`;

    // Idempotency: skip if already loaded
    if (JSON.stringify(context.input).includes(skillMarker)) {
      return {};
    }

    const skillInstructions = {
      coding: 'You are an expert programmer. Write clean, documented code.',
      writing: 'You are a skilled writer. Focus on clarity and engagement.',
      analysis: 'You are a data analyst. Provide thorough, evidence-based insights.',
    };

    return {
      instructions: `${context.instructions}\n\n${skillMarker}\n${skillInstructions[params.skill]}`,
      temperature: params.skill === 'coding' ? 0.2 : 0.7,
    };
  },
});
```
