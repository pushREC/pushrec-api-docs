Get the context of a task run.

Copy page

Context (`ctx`) is a way to get information about a run.

The context object does not change whilst your code is executing. This means values like
`ctx.run.durationMs` will be fixed at the moment the `run()` function is called.

Context example

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

export const parentTask = task({
 id: "parent-task",
 run: async (payload: { message: string }, { ctx }) => {
 if (ctx.environment.type === "DEVELOPMENT") {
 return;
 }
 },
});

```

## 
[​
](#context-properties)Context properties

[​
](#param-task)
task

object

Hide properties

[​

](#param-export-name)
exportName

string

The exported function name of the task e.g. `myTask` if you defined it like this: `export const myTask = task(...)`.

[​
](#param-id)
id

string

The ID of the task.

[​
](#param-file-path)
filePath

string

The file path of the task.

[​
](#param-attempt)
attempt

object

Show properties

[​

](#param-id-1)
id

string

The ID of the execution attempt.

[​
](#param-number)
number

number

The attempt number.

[​
](#param-started-at)
startedAt

date

The start time of the attempt.

[​
](#param-background-worker-id)
backgroundWorkerId

string

The ID of the background worker.

[​
](#param-background-worker-task-id)
backgroundWorkerTaskId

string

The ID of the background worker task.

[​
](#param-status)
status

string

The current status of the attempt.

[​
](#param-run)
run

object

Show properties

[​

](#param-id-2)
id

string

The ID of the task run.

[​
](#param-context)
context

any

The context of the task run.

[​
](#param-tags)
tags

array

An array of [tags](/docs/tags) associated with the task run.

[​
](#param-is-test)
isTest

boolean

Whether this is a [test run](/docs/run-tests).

[​
](#param-created-at)
createdAt

date

The creation time of the task run.

[​
](#param-started-at-1)
startedAt

date

The start time of the task run.

[​
](#param-idempotency-key)
idempotencyKey

string

An optional [idempotency key](/docs/idempotency) for the task run.

[​
](#param-max-attempts)
maxAttempts

number

The [maximum number of attempts](/docs/triggering#maxattempts) allowed for this task run.

[​
](#param-duration-ms)
durationMs

number

The duration of the task run in milliseconds when the `run()` function is called. For live
values use the [usage SDK functions](/docs/run-usage).

[​
](#param-cost-in-cents)
costInCents

number

The cost of the task run in cents when the `run()` function is called. For live values use the
[usage SDK functions](/docs/run-usage).

[​
](#param-base-cost-in-cents)
baseCostInCents

number

The base cost of the task run in cents when the `run()` function is called. For live values
use the [usage SDK functions](/docs/run-usage).

[​
](#param-version)
version

string

The [version](/docs/versioning) of the task run.

[​
](#param-max-duration)
maxDuration

number

The [maximum allowed duration](/docs/runs/max-duration) for the task run.

[​
](#param-queue)
queue

object

Show properties

[​

](#param-id-3)
id

string

The ID of the queue.

[​
](#param-name)
name

string

The name of the queue.

[​
](#param-environment)
environment

object

Show properties

[​

](#param-id-4)
id

string

The ID of the environment.

[​
](#param-slug)
slug

string

The slug of the environment.

[​
](#param-type)
type

string

The type of the environment (PRODUCTION, STAGING, DEVELOPMENT, or PREVIEW).

[​
](#param-branch-name)
branchName

string

If the environment is `PREVIEW` then this will be the branch name.

[​
](#param-git)
git

object

Show properties

[​

](#param-commit-author-name)
commitAuthorName

string

The name of the commit author.

[​
](#param-commit-message)
commitMessage

string

The message of the commit.

[​
](#param-commit-ref)
commitRef

string

The ref of the commit.

[​
](#param-commit-sha)
commitSha

string

The SHA of the commit.

[​
](#param-dirty)
dirty

boolean

Whether the commit is dirty, i.e. there are uncommitted changes.

[​
](#param-remote-url)
remoteUrl

string

The remote URL of the repository.

[​
](#param-pull-request-number)
pullRequestNumber

number

The number of the pull request.

[​
](#param-pull-request-title)
pullRequestTitle

string

The title of the pull request.

[​
](#param-pull-request-state)
pullRequestState

string

The state of the pull request (open, closed, or merged).

[​
](#param-organization)
organization

object

Show properties

[​

](#param-id-5)
id

string

The ID of the organization.

[​
](#param-slug-1)
slug

string

The slug of the organization.

[​
](#param-name-1)
name

string

The name of the organization.

[​
](#param-project)
project

object

Show properties

[​

](#param-id-6)
id

string

The ID of the project.

[​
](#param-ref)
ref

string

The reference of the project.

[​
](#param-slug-2)
slug

string

The slug of the project.

[​
](#param-name-2)
name

string

The name of the project.

[​
](#param-batch)
batch

object

Optional information about the batch, if applicable.Show properties

[​

](#param-id-7)
id

string

The ID of the batch.

[​
](#param-machine)
machine

object

Optional information about the machine preset used for execution.Show properties

[​

](#param-name-3)
name

string

The name of the machine preset.

[​
](#param-cpu)
cpu

number

The CPU allocation for the machine.

[​
](#param-memory)
memory

number

The memory allocation for the machine.

[​
](#param-cents-per-ms)
centsPerMs

number

The cost in cents per millisecond for this machine preset.

Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/context.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /context)

[Previous](/docs/run-usage)[PrioritySpecify a priority when triggering a run.

Next
](/docs/runs/priority)
⌘I

Context example

Copy

Ask AI

```
import { task } from "@trigger.dev/sdk";

export const parentTask = task({
 id: "parent-task",
 run: async (payload: { message: string }, { ctx }) => {
 if (ctx.environment.type === "DEVELOPMENT") {
 return;
 }
 },
});

```

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)