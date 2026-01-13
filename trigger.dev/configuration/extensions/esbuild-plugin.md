# esbuild Plugin - Trigger.dev Documentation

## Overview

The `esbuildPlugin` build extension enables developers to integrate existing or custom esbuild plugins into their Trigger.dev build process.

## Implementation

### Basic Setup

To use the esbuildPlugin extension, import it from `@trigger.dev/build/extensions` and configure it within your project's build settings:

```typescript
import { defineConfig } from "@trigger.dev/sdk";
import { esbuildPlugin } from "@trigger.dev/build/extensions";
import { sentryEsbuildPlugin } from "@sentry/esbuild-plugin";

export default defineConfig({
  project: "<project ref>",
  // Your other config settings...
  build: {
    extensions: [
      esbuildPlugin(
        sentryEsbuildPlugin({
          org: process.env.SENTRY_ORG,
          project: process.env.SENTRY_PROJECT,
          authToken: process.env.SENTRY_AUTH_TOKEN,
        }),
        // optional - only runs during the deploy command, and adds the plugin to the end of the list of plugins
        { placement: "last", target: "deploy" }
      ),
    ],
  },
});
```

## Configuration Options

The extension accepts optional configuration parameters:

- **placement**: Specifies where in the plugin chain the extension executes (`"last"` adds it to the end)
- **target**: Designates when the plugin activates (`"deploy"` restricts it to deployment operations)

## Use Cases

This extension supports adding:
- Third-party esbuild plugins (like Sentry's error tracking plugin)
- Custom-built esbuild plugins for specialized build requirements
- Environment-specific plugins that only run during deployment

The flexibility of this approach allows teams to extend their build pipeline without modifying core Trigger.dev configuration.

---
Source: https://trigger.dev/docs/config/extensions/esbuildPlugin
