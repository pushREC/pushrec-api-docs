## 
[​
](#trigger-functions)Trigger functions

Trigger tasks **from your backend**:

FunctionWhat it does`tasks.trigger()`Triggers a task and returns a handle you can use to fetch and manage the run.[Docs](#tasks-trigger)`tasks.batchTrigger()`Triggers a single task in a batch and returns a handle you can use to fetch and manage the runs.[Docs](#tasks-batchtrigger)`batch.trigger()`Similar to `tasks.batchTrigger` but allows running multiple different tasks[Docs](#batch-trigger)

Trigger tasks **from inside a another task**:

FunctionWhat it does`yourTask.trigger()`Triggers a task and gets a handle you can use to monitor and manage the run. It does not wait for the result.[Docs](#yourtask-trigger)`yourTask.batchTrigger()`Triggers a task multiple times and gets a handle you can use to monitor and manage the runs. It does not wait for the results.[Docs](#yourtask-batchtrigger)`yourTask.triggerAndWait()`Triggers a task and then waits until it’s complete. You get the result data to continue with.[Docs](#yourtask-triggerandwait)`yourTask.batchTriggerAndWait()`Triggers a task multiple times in parallel and then waits until they’re all complete. You get the resulting data to continue with.[Docs](#yourtask-batchtriggerandwait)`batch.triggerAndWait()`Similar to `batch.trigger` but will wait on the triggered tasks to finish and return the results.[Docs](#batch-triggerandwait)`batch.triggerByTask()`Similar to `batch.trigger` but allows passing in task instances instead of task IDs.[Docs](#batch-triggerbytask)`batch.triggerByTaskAndWait()`Similar to `batch.triggerbyTask` but will wait on the triggered tasks to finish and return the results.[Docs](#batch-triggerbytaskandwait)

## 
[​
](#triggering-from-your-backend)Triggering from your backend

When you trigger a task from your backend code, you need to set the `TRIGGER_SECRET_KEY` environment variable. If you’re [using a preview branch](/docs/deployment/preview-branches), you also need to set the `TRIGGER_PREVIEW_BRANCH` environment variable. You can find the value on the API keys page in the Trigger.dev dashboard. [More info on API keys](/docs/apikeys).

If you are using Next.js Server Actions [you’ll need to be careful with
bundling](/docs/guides/frameworks/nextjs#triggering-your-task-in-next-js).

### 
[​
](#tasks-trigger)tasks.trigger()

Triggers a single run of a task with the payload you pass in, and any options you specify, without needing to import the task.

By using `tasks.trigger()`, you can pass in the task type as a generic argument, giving you full
type checking. Make sure you use a `type` import so that your task code is not imported into your
application.