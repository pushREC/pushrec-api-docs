# How to Reduce Your Spend on Trigger.dev

This documentation provides practical strategies to optimize costs when using Trigger.dev's background job platform.

## Key Cost-Reduction Strategies

### Monitor Usage Regularly
Review your usage dashboard to identify spending patterns, including "Your most expensive tasks," "Total duration by task," "Number of runs by task," and "Spikes in your daily usage." Access this through the Organization menu.

### Set Billing Alerts
Configure two alert types:
- **Standard alerts** trigger at 75%, 90%, 100%, 200%, and 500% of monthly budget
- **Spike alerts** catch runaway usage at 1000%, 2000%, 5000%, and 10000% thresholds

### Optimize Machine Sizes
Start with the smallest machine tier (small-1x: 0.5 vCPU, 0.5 GB RAM) and scale up only when necessary. Larger machines cost more per second. You can override machine size during task triggering based on payload requirements.

### Use Idempotency Keys
These prevent expensive duplicate work by ensuring operations execute only once. The `idempotencyKeyTTL` parameter controls cache duration—use shorter periods (1 hour) for time-sensitive operations or longer durations (up to 30 days) for expensive operations.

### Parallelize Work Efficiently
Consolidate multiple API calls within a single task rather than splitting across many tasks. This is particularly effective for async operations where most time involves waiting.

### Manage Retries Carefully
Set realistic `maxAttempts` values for less critical tasks. Use `AbortTaskRunError` to prevent retries for permanent errors that will repeatedly fail and waste compute resources.

### Implement Duration Limits
Apply realistic `maxDuration` settings to prevent tasks from running indefinitely.

### Leverage Checkpointing
Waits exceeding 5 seconds automatically checkpoint tasks, eliminating compute charges during wait periods. Use `wait.for()`, `wait.until()`, or `triggerAndWait()` instead of polling loops.

### Apply Debouncing
Consolidate multiple rapid triggers into single runs using debounce with configurable delay and mode settings. This benefits document indexing, webhook aggregation, cache invalidation, and real-time sync scenarios.
