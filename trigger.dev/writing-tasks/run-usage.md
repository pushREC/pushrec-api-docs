## 
[​
](#getting-the-run-cost-and-duration)Getting the run cost and duration

You can get the cost and duration of the current including retries of the same run.

Copy

Ask AI

```
export const heavyTask = task({
 id: "heavy-task",
 machine: {
 preset: "medium-2x",
 },
 run: async (payload, { ctx }) => {
 // Do some compute
 const result = await convertVideo(payload.videoUrl);

 // Get the current cost and duration up until this line of code
 // This includes the compute time of the previous lines
 let currentUsage = usage.getCurrent();
 /* currentUsage = {
 compute: {
 attempt: {
 costInCents: 0.01700,
 durationMs: 1000,
 },
 total: {
 costInCents: 0.0255,
 durationMs: 1500,
 },
 },
 baseCostInCents: 0.0025,
 totalCostInCents: 0.028,
 } 
 */

 // In the cloud product we do not count waits towards the compute cost or duration.
 // We also don't include time between attempts or before the run starts executing your code.
 // So this line does not affect the cost or duration.
 await wait.for({ seconds: 5 });

 // This will give the same result as before the wait.
 currentUsage = usage.getCurrent();

 // Do more compute
 const result = await convertVideo(payload.videoUrl);

 // This would give a different value
 currentUsage = usage.getCurrent();
 },
});

```

In Trigger.dev cloud we do not include time between attempts, before your code executes, or waits
towards the compute cost or duration.

## 
[​
](#getting-the-run-cost-and-duration-from-your-backend)Getting the run cost and duration from your backend

You can use [runs.retrieve()](/docs/management/runs/retrieve) to get a single run or [runs.list()](/docs/management/runs/list) to get a list of runs. The response will include `costInCents` `baseCostInCents` and `durationMs` fields.

single run

Copy

Ask AI

```
import { runs } from "@trigger.dev/sdk";

const run = await runs.retrieve("run-id");
console.log(run.costInCents, run.baseCostInCents, run.durationMs);
const totalCost = run.costInCents + run.baseCostInCents;

```