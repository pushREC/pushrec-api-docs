---
source: https://openrouter.ai/docs/sdks/dev-tools/devtools
scraped: 2026-01-08
---

# OpenRouter DevTools

## Overview

OpenRouter DevTools is a development-focused solution for monitoring AI SDK operations. It consists of telemetry hooks that automatically capture SDK activity and a web-based viewer for visualizing that data.

## Key Components

| Component | Description |
|-----------|-------------|
| **SDK Telemetry Hooks** | Capture all operations asynchronously |
| **DevTools Viewer** | Web interface for visualizing data |

## Features

### Telemetry Hooks

The hooks automatically record:

- Chat completions with full request/response data
- Token usage metrics
- Performance timing
- Failures and errors
- Function/tool calls
- Environmental context (git branch information)

### DevTools Viewer

The viewer provides:

- Real-time run tracking
- Detailed step analysis
- Token usage monitoring
- Error debugging capabilities
- Multi-run comparison
- Theme support (light/dark)

## Installation

Install as a development dependency:

```bash
npm install --save-dev @openrouter/devtools
```

## Safety Design

DevTools is designed with safety in mind:

- **Development Only**: Throws errors when `NODE_ENV === 'production'`
- **Async Operation**: Never blocks SDK calls
- **Isolated Failures**: Capture failures never propagate to application logic

## Basic Setup

```typescript
import { createOpenRouterDevtools } from '@openrouter/devtools';
import { OpenRouter } from '@openrouter/sdk';

const sdk = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
  hooks: createOpenRouterDevtools(),
});

// Use SDK as normal - all operations are automatically captured
const result = sdk.callModel({
  model: 'openai/gpt-4o',
  input: 'Hello, world!',
});

const text = await result.getText();
```

## Launching the Viewer

Start the DevTools viewer with:

```bash
openrouter devtools
```

This starts a local server on port 4983 by default.

Then open `http://localhost:4983` in your browser.

## Configuration

### Custom Settings

```typescript
import { createOpenRouterDevtools } from '@openrouter/devtools';

const devtools = createOpenRouterDevtools({
  // Custom storage location (default: .devtools/openrouter-generations.json)
  storagePath: './my-devtools/generations.json',

  // Custom server URL (default: http://localhost:4983/api/notify)
  serverUrl: 'http://localhost:5000/api/notify',
});
```

### Port Configuration

The DevTools port can be configured in `~/.openrouter/claude-code-proxy.json`:

```json
{
  "devtools": {
    "port": 5000
  }
}
```

## Usage Example

```typescript
import { createOpenRouterDevtools } from '@openrouter/devtools';
import { OpenRouter, tool } from '@openrouter/sdk';
import { z } from 'zod';

// Initialize with DevTools
const sdk = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
  hooks: createOpenRouterDevtools(),
});

// Define a tool
const calculatorTool = tool({
  name: 'calculator',
  description: 'Perform math calculations',
  inputSchema: z.object({
    expression: z.string(),
  }),
  outputSchema: z.object({
    result: z.number(),
  }),
  execute: async ({ params }) => {
    return { result: eval(params.expression) };
  },
});

// Make API calls - all captured by DevTools
async function main() {
  const result = sdk.callModel({
    model: 'openai/gpt-4o',
    input: 'Calculate 15 * 23',
    tools: [calculatorTool],
  });

  const text = await result.getText();
  console.log(text);
}

main();
```

## Viewer Interface

The DevTools viewer displays:

### Run List

- Timestamp of each run
- Model used
- Token counts (input/output)
- Cost estimate
- Status (success/error)

### Run Details

- Full request parameters
- Complete response data
- Tool calls and results
- Timing breakdown
- Error messages (if any)

### Analysis Features

- Compare multiple runs side-by-side
- Filter by model, status, or time range
- Export data for further analysis
- Search through request/response content

## Best Practices

| Practice | Description |
|----------|-------------|
| **Development Only** | Never deploy DevTools to production |
| **Regular Review** | Check DevTools during development to catch issues early |
| **Clear Storage** | Periodically clear the generations file to prevent bloat |
| **Git Ignore** | Add `.devtools/` to `.gitignore` |

## Troubleshooting

### Viewer Not Showing Data

1. Ensure the DevTools server is running (`openrouter devtools`)
2. Check that hooks are properly attached to the SDK
3. Verify the storage path is accessible

### Production Error

If you see "DevTools cannot run in production":

1. Remove DevTools from production builds
2. Use environment checks:

```typescript
const hooks = process.env.NODE_ENV === 'development'
  ? createOpenRouterDevtools()
  : undefined;

const sdk = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
  hooks,
});
```

### Port Conflicts

If port 4983 is in use:

1. Configure a different port in `~/.openrouter/claude-code-proxy.json`
2. Or specify via command line: `openrouter devtools --port 5000`

## Integration with CI/CD

For automated testing, you can capture DevTools data without the viewer:

```typescript
import { createOpenRouterDevtools } from '@openrouter/devtools';

const devtools = createOpenRouterDevtools({
  // Store to a specific location for test artifacts
  storagePath: './test-results/devtools-capture.json',
  // Don't try to notify a viewer server
  serverUrl: null,
});
```

## Related Resources

- [SDK Overview](./overview.md) - Getting started with the SDK
- [API Reference](./api-reference.md) - Complete API documentation
- [Tools Guide](./tools.md) - Creating and using tools
