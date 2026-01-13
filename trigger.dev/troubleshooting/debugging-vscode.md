# Debugging in VS Code - Trigger.dev

## Overview

Trigger.dev supports debugging task code directly in Visual Studio Code during development, without requiring additional flags or complex configuration.

## Setup Instructions

To enable debugging, create a launch configuration file at `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Trigger.dev: Dev",
      "type": "node",
      "request": "launch",
      "cwd": "${workspaceFolder}",
      "runtimeExecutable": "npx",
      "runtimeArgs": ["trigger.dev@latest", "dev"],
      "skipFiles": ["<node_internals>/**"],
      "sourceMaps": true
    }
  ]
}
```

## Using the Debugger

Once configured, activate debugging by selecting the "Trigger.dev: Dev" configuration from VS Code's debug panel. You can then set breakpoints directly in your task code and step through execution as needed.
