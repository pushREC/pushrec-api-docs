# Python Extension Documentation Summary

## Overview
The `pythonExtension` build extension enables executing Python scripts within Trigger.dev projects via the `@trigger.dev/python` package.

## Installation & Setup
Install the package with `npm add @trigger.dev/python`, then configure it in `trigger.config.ts` by importing and adding `pythonExtension()` to the build extensions array.

## Core Functionality
The extension handles Python environment setup and provides utilities like `python.runInline()` for executing inline scripts and `python.runScript()` for running script files with arguments.

## Key Features

**Script Management**: Use the `scripts` option to automatically include Python files during deployment. The extension manages path consistency between development and production environments.

**Dependency Installation**: Configure a `requirements.txt` file path via the `requirementsFile` option to install packages during builds (production mode only; manual installation required in development).

**Virtual Environment Support**: Specify custom Python binary paths using `devPythonBinaryPath` for development environments.

**Streaming Output**: All Python functions have streaming counterparts (e.g., `python.stream.runScript()`) that return async iterables for real-time output consumption.

**Environment Variables**: The extension automatically injects `process.env` variables accessible via `os.environ` in Python scripts. Additional variables can be passed via the `env` option in function calls.

## Configuration Example
```typescript
pythonExtension({
  scripts: ["./python/**/*.py"],
  requirementsFile: "./requirements.txt",
  devPythonBinaryPath: ".venv/bin/python"
})
```

This documentation provides complete setup instructions, usage patterns, and configuration options for integrating Python execution capabilities into Trigger.dev workflows.

---
Source: https://trigger.dev/docs/config/extensions/pythonExtension
