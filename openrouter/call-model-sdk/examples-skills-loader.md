---
source: https://openrouter.ai/docs/sdks/call-model/examples/skills-loader
scraped: 2026-01-08
---

# Skills Loader Example

## Overview

This guide demonstrates building encapsulated tools that enrich conversations with specialized instructions. The system uses `nextTurnParams` for context injection while maintaining idempotency.

## Core Architecture

The implementation centers on a skills directory structure containing domain-specific instruction files:

```
~/.claude/skills/
├── coding/
│   └── SKILL.md
├── writing/
│   └── SKILL.md
├── analysis/
│   └── SKILL.md
└── research/
    └── SKILL.md
```

Each skill loads via a tool that injects its `SKILL.md` content into subsequent conversation turns.

## Basic Skill Loader

```typescript
import { OpenRouter, tool } from '@openrouter/sdk';
import { z } from 'zod';
import { existsSync, readdirSync, readFileSync } from 'fs';
import path from 'path';

const SKILLS_DIR = path.join(process.env.HOME || '', '.claude/skills');

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

// Discover available skills
function getAvailableSkills(): string[] {
  if (!existsSync(SKILLS_DIR)) return [];

  return readdirSync(SKILLS_DIR, { withFileTypes: true })
    .filter((dirent) => existsSync(path.join(SKILLS_DIR, dirent.name, 'SKILL.md')))
    .map((dirent) => dirent.name);
}

// Load skill content
function loadSkillContent(skillName: string): string | null {
  const skillPath = path.join(SKILLS_DIR, skillName, 'SKILL.md');
  if (!existsSync(skillPath)) return null;
  return readFileSync(skillPath, 'utf-8');
}

const skillLoaderTool = tool({
  name: 'load_skill',
  description: `Load a specialized skill to enhance responses. Available skills: ${getAvailableSkills().join(', ')}`,
  inputSchema: z.object({
    skill: z.string().describe('Name of the skill to load'),
  }),
  outputSchema: z.object({
    loaded: z.boolean(),
    skill: z.string(),
    message: z.string(),
  }),
  execute: async ({ params }) => {
    const content = loadSkillContent(params.skill);
    if (!content) {
      return {
        loaded: false,
        skill: params.skill,
        message: `Skill "${params.skill}" not found. Available: ${getAvailableSkills().join(', ')}`,
      };
    }
    return {
      loaded: true,
      skill: params.skill,
      message: `Skill "${params.skill}" loaded successfully.`,
    };
  },
  nextTurnParams: ({ params, context }) => {
    const skillMarker = `<!-- SKILL:${params.skill} -->`;

    // Idempotency check - prevent duplicate loading
    if (JSON.stringify(context.input).includes(skillMarker)) {
      return context.input; // Already loaded, return unchanged
    }

    const content = loadSkillContent(params.skill);
    if (!content) return {}; // Skill not found, no changes

    // Append skill instructions to conversation
    return {
      input: [
        ...context.input,
        {
          role: 'system',
          content: `${skillMarker}\n${content}`,
        },
      ],
    };
  },
});
```

## Idempotency Pattern

Skills include unique markers to prevent duplicate loading. The implementation checks:

```typescript
// Check if skill is already loaded
if (JSON.stringify(context.input).includes(skillMarker)) {
  return context.input; // Skip - already present
}
```

This ensures that calling `load_skill` multiple times for the same skill doesn't bloat the context.

## Multi-Skill Loader

An extended `multiSkillLoader` accepts skill arrays, iterating through each to inject relevant content while skipping already-loaded skills:

```typescript
const multiSkillLoaderTool = tool({
  name: 'load_skills',
  description: 'Load multiple skills at once',
  inputSchema: z.object({
    skills: z.array(z.string()).describe('List of skill names to load'),
  }),
  outputSchema: z.object({
    loaded: z.array(z.string()),
    skipped: z.array(z.string()),
    not_found: z.array(z.string()),
  }),
  execute: async ({ params }) => {
    const loaded: string[] = [];
    const skipped: string[] = [];
    const not_found: string[] = [];

    for (const skill of params.skills) {
      const content = loadSkillContent(skill);
      if (!content) {
        not_found.push(skill);
      } else {
        loaded.push(skill);
      }
    }

    return { loaded, skipped, not_found };
  },
  nextTurnParams: ({ params, context }) => {
    let newInput = [...context.input];

    for (const skill of params.skills) {
      const skillMarker = `<!-- SKILL:${skill} -->`;

      // Skip if already loaded
      if (JSON.stringify(newInput).includes(skillMarker)) {
        continue;
      }

      const content = loadSkillContent(skill);
      if (!content) continue;

      newInput.push({
        role: 'system',
        content: `${skillMarker}\n${content}`,
      });
    }

    return { input: newInput };
  },
});
```

## Configuration Capabilities

Skills support customizable options including verbosity levels, strict mode enforcement, and output formatting:

```typescript
const configurableSkillLoader = tool({
  name: 'load_skill_configured',
  description: 'Load a skill with configuration options',
  inputSchema: z.object({
    skill: z.string(),
    options: z.object({
      verbosity: z.enum(['low', 'medium', 'high']).optional().default('medium'),
      strict: z.boolean().optional().default(false),
      outputFormat: z.enum(['markdown', 'plain', 'json']).optional().default('markdown'),
    }).optional(),
  }),
  outputSchema: z.object({
    loaded: z.boolean(),
    skill: z.string(),
    config: z.object({
      verbosity: z.string(),
      strict: z.boolean(),
      outputFormat: z.string(),
    }),
  }),
  execute: async ({ params }) => {
    const options = params.options || {};
    return {
      loaded: true,
      skill: params.skill,
      config: {
        verbosity: options.verbosity || 'medium',
        strict: options.strict || false,
        outputFormat: options.outputFormat || 'markdown',
      },
    };
  },
  nextTurnParams: ({ params, context }) => {
    const options = params.options || {};
    const skillMarker = `<!-- SKILL:${params.skill} -->`;

    if (JSON.stringify(context.input).includes(skillMarker)) {
      return {};
    }

    const content = loadSkillContent(params.skill);
    if (!content) return {};

    // Build configuration header
    const configHeader = `
Configuration:
- Verbosity: ${options.verbosity || 'medium'}
- Strict Mode: ${options.strict || false}
- Output Format: ${options.outputFormat || 'markdown'}
`.trim();

    // Adjust temperature based on strict mode
    const newParams: any = {
      input: [
        ...context.input,
        {
          role: 'system',
          content: `${skillMarker}\n${configHeader}\n\n${content}`,
        },
      ],
    };

    // Lower temperature for strict mode
    if (options.strict) {
      newParams.temperature = 0.3;
    }

    return newParams;
  },
});
```

## Implementation Patterns

The documentation emphasizes four critical practices:

### 1. Graceful Fallbacks

Return user-friendly messages for missing skills:

```typescript
execute: async ({ params }) => {
  const content = loadSkillContent(params.skill);
  if (!content) {
    return {
      loaded: false,
      skill: params.skill,
      message: `Skill "${params.skill}" not found. Available skills: ${getAvailableSkills().join(', ')}`,
    };
  }
  // ...
}
```

### 2. Clear Markers

Unique identifiers make injected content reliably detectable:

```typescript
const skillMarker = `<!-- SKILL:${params.skill} -->`;
```

### 3. Marker Detection

Consistent checking prevents duplication across turns:

```typescript
if (JSON.stringify(context.input).includes(skillMarker)) {
  return context.input;
}
```

### 4. Input Preservation

Always maintain existing conversation context (append, don't replace):

```typescript
return {
  input: [
    ...context.input,  // Preserve existing
    { role: 'system', content: newContent },  // Add new
  ],
};
```

## Complete Example

```typescript
import { OpenRouter, tool, stepCountIs } from '@openrouter/sdk';
import { z } from 'zod';
import { existsSync, readdirSync, readFileSync } from 'fs';
import path from 'path';

const SKILLS_DIR = path.join(process.env.HOME || '', '.claude/skills');

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

function getAvailableSkills(): string[] {
  if (!existsSync(SKILLS_DIR)) return [];
  return readdirSync(SKILLS_DIR, { withFileTypes: true })
    .filter((d) => d.isDirectory() && existsSync(path.join(SKILLS_DIR, d.name, 'SKILL.md')))
    .map((d) => d.name);
}

function loadSkillContent(skillName: string): string | null {
  const skillPath = path.join(SKILLS_DIR, skillName, 'SKILL.md');
  if (!existsSync(skillPath)) return null;
  return readFileSync(skillPath, 'utf-8');
}

const skillLoaderTool = tool({
  name: 'load_skill',
  description: `Load a domain-specific skill. Available: ${getAvailableSkills().join(', ') || 'none'}`,
  inputSchema: z.object({
    skill: z.string().describe('Skill name to load'),
  }),
  outputSchema: z.object({
    loaded: z.boolean(),
    skill: z.string(),
    message: z.string(),
  }),
  execute: async ({ params }) => {
    const content = loadSkillContent(params.skill);
    if (!content) {
      return {
        loaded: false,
        skill: params.skill,
        message: `Skill not found. Available: ${getAvailableSkills().join(', ')}`,
      };
    }
    return {
      loaded: true,
      skill: params.skill,
      message: `Loaded ${params.skill} skill`,
    };
  },
  nextTurnParams: ({ params, context }) => {
    const marker = `<!-- SKILL:${params.skill} -->`;

    // Idempotency: skip if already loaded
    if (JSON.stringify(context.input).includes(marker)) {
      return {};
    }

    const content = loadSkillContent(params.skill);
    if (!content) return {};

    return {
      input: [
        ...context.input,
        { role: 'system', content: `${marker}\n${content}` },
      ],
    };
  },
});

async function main() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'I need help writing a technical blog post about TypeScript generics. Load the writing skill first.',
    tools: [skillLoaderTool],
    stopWhen: stepCountIs(5),
  });

  for await (const toolCall of result.getToolCallsStream()) {
    console.log('Tool called:', toolCall.name);
    console.log('Result:', toolCall.result);
  }

  const text = await result.getText();
  console.log('\nResponse:', text);
}

main();
```

## Example SKILL.md File

```markdown
# Writing Skill

You are an expert technical writer with the following capabilities:

## Guidelines

1. **Clarity First**: Use simple, direct language
2. **Structure**: Use headings, lists, and code examples
3. **Audience Awareness**: Tailor complexity to the reader
4. **Examples**: Always include practical examples

## Output Format

- Use Markdown formatting
- Include code blocks with language tags
- Add section headings for organization

## Best Practices

- Start with a hook or problem statement
- Build concepts progressively
- End with a summary or call to action
```

## Related Resources

- [Next Turn Params](./next-turn-params.md) - Understanding parameter modification
- [Tools Guide](./tools.md) - Complete tools documentation
