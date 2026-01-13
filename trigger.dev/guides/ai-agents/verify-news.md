# Verify News Article - Trigger.dev Documentation

## Overview

This guide demonstrates the **orchestrator pattern**, where multiple specialized AI agents coordinate to accomplish a complex task. The example implements a news article verification system using multiple AI workers that analyze different aspects of an article's credibility.

## Pattern Description

The orchestrator pattern coordinates multiple AI workers to verify news articles through parallel analysis:

- **Orchestrator Agent**: Coordinates the overall verification workflow
- **Specialized Workers**: Individual agents focusing on specific verification aspects
- **Result Aggregation**: Combines findings from all workers into a comprehensive assessment

## Key Concepts

### Multi-Agent Coordination

The orchestrator delegates verification tasks to specialized agents, each analyzing different dimensions:
- Source credibility assessment
- Factual claim verification
- Bias detection
- Cross-reference validation

### Parallel Execution

Workers execute concurrently using Trigger.dev's batch operations (`batch.triggerByTaskAndWait()`), significantly reducing overall processing time compared to sequential analysis.

### Telemetry and Observability

Each agent uses `experimental_telemetry` integration for complete visibility into the verification process, enabling monitoring of individual agent decisions and reasoning.

## Implementation Pattern

The typical workflow structure:

1. **Input Processing**: Orchestrator receives article URL or text
2. **Task Distribution**: Distributes verification subtasks to specialized agents
3. **Parallel Analysis**: Each worker analyzes assigned aspect independently
4. **Result Collection**: Orchestrator gathers findings from all workers
5. **Final Assessment**: Aggregates worker outputs into verification verdict

## Use Cases

This pattern excels when:
- Multiple independent analyses are needed
- Each analysis requires different specialized knowledge
- Results must be combined for final decision
- Parallel execution provides significant performance benefits

## Related Documentation

- Trigger.dev batch operations for parallel task execution
- Vercel AI SDK integration for LLM interactions
- Experimental telemetry for agent observability

## Note

This page was part of the AI Agents documentation series demonstrating five fundamental agent patterns: Prompt Chaining, Routing, Parallelization, Orchestrator Pattern, and Evaluator-Optimizer.
