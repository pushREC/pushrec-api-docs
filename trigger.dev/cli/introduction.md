---
source: https://trigger.dev/docs/cli-introduction
scraped: 2026-01-13
---

# Trigger.dev CLI Documentation

## Introduction

The Trigger.dev CLI provides a suite of tools to help developers build, test, and deploy tasks locally and to the cloud. "The Trigger.dev CLI has a number of options and commands to help you develop locally, self host, and deploy your tasks."

## Options

### Help
- **Flag:** `--help` or `-h`
- **Purpose:** Displays help information for any command

### Version
- **Flag:** `--version` or `-v`
- **Purpose:** Shows the current CLI version number

## Commands

| Command | Description |
|---------|-------------|
| `login` | Authenticate with Trigger.dev to enable authenticated operations |
| `init` | Set up an existing project for development with Trigger.dev |
| `dev` | Execute your Trigger.dev tasks in a local environment |
| `deploy` | Push your Trigger.dev v3 project to the cloud |
| `whoami` | View information about the currently logged-in user and active project |
| `logout` | Terminate your Trigger.dev session |
| `list-profiles` | Display all available CLI profiles |
| `update` | Synchronize all `@trigger.dev/*` packages with the CLI version |

Each command can be invoked with the `--help` flag to access detailed information about its specific options and usage patterns.
