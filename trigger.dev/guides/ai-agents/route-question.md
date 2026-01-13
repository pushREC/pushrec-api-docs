# Route a Question to a Different AI Model - Trigger.dev Documentation

## Overview

The routing pattern classifies inputs and directs them to specialized followup tasks. This separation of concerns enables more optimized, specialized prompts when distinct input categories require different handling approaches.

## Example Implementation

This guide demonstrates creating a workflow that routes questions to different AI models based on complexity assessment.

### Key Components

**Schema Definition:**
The implementation uses Zod to define the routing response structure with two fields: the selected model identifier and reasoning for the selection.

**Router Mechanism:**
A lightweight model (o1-mini) evaluates question complexity and determines whether to route to gpt-4o for straightforward queries or gpt-o3-mini for complex reasoning tasks.

**Telemetry Integration:**
The `experimental_telemetry` option provides LLM logging capabilities within Trigger.dev tasks, enabling visibility into model interactions.

### Task Structure

The `routeAndAnswerQuestion` task executes in two sequential steps:

1. **Routing Phase**: Sends the question to o1-mini with a system prompt specifying routing criteria and expected JSON response format
2. **Answer Phase**: Forwards the question to the selected model and returns the response alongside routing metadata

### Response Format

Tasks return an object containing:
- `answer`: The generated response from the selected model
- `selectedModel`: Identifier of the chosen model
- `routingReason`: Explanation for the routing decision

### Error Handling

The implementation includes JSON cleanup logic to handle markdown formatting artifacts that may appear in model responses, ensuring reliable parsing.

## Testing

Triggering with a simple factual question demonstrates the router selecting gpt-4o and returning the answer with routing justification.
