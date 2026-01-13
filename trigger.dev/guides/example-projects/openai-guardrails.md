# OpenAI Agents SDK for Python Guardrails

## Overview

This example project demonstrates implementing AI safety mechanisms alongside the OpenAI Agent SDK for Python with Trigger.dev. The guide covers:

- **Three guardrail types**: input validation, output verification, and real-time streaming monitoring
- Integration combining OpenAI Agent SDK for Python with Trigger.dev for production workflows
- Python script execution from tasks using Trigger.dev's Python build extension
- Educational implementations of safety controls for AI systems
- Real-world use cases like math tutoring agents with content and complexity validation

"Guardrails are safety mechanisms that run alongside AI agents to validate input, check output, monitor streaming content in real-time, and prevent unwanted or harmful behavior."

## Key Resources

**GitHub Repository**: Full implementation available at the [OpenAI Agent SDK Guardrails examples repository](https://github.com/triggerdotdev/examples/tree/main/openai-agent-sdk-guardrails-examples)

## Code Components

### Trigger.dev Tasks

- **inputGuardrails.ts** - Forwards user prompts to Python scripts and handles `InputGuardrailTripwireTriggered` exceptions
- **outputGuardrails.ts** - Executes agent generation and captures `OutputGuardrailTripwireTriggered` exceptions with error details
- **streamingGuardrails.ts** - Processes `ResponseTextDeltaEvent` streams and exports guardrail metrics as JSON

### Python Scripts

- **input-guardrails.py** - Uses `@input_guardrail` decorator validating prompts before processing
- **output-guardrails.py** - Employs `@output_guardrail` decorator checking responses via separate validation agent
- **streaming-guardrails.py** - Monitors `ResponseTextDeltaEvent` streams with configurable async checks

### Configuration

**trigger.config.ts** - Implements Trigger.dev Python extension

## Additional Resources

- [OpenAI Agent SDK documentation](https://openai.github.io/openai-agents-python/)
- [OpenAI guardrails guide](https://openai.github.io/openai-agents-python/guardrails/)
- [Python build extension documentation](/config/extensions/pythonExtension)
