We use atomic versioning to ensure that started tasks are not affected by changes to the task code.

Copy page

A version is a bundle of tasks at a certain point in time.

## [​
](#version-identifiers)Version identifiers

Version identifiers look like this:

- `20240313.1` - March 13th, 2024, version 1

- `20240313.2` - March 13th, 2024, version 2

- `20240314.1` - March 14th, 2024, version 1

You can see there are two parts to the version identifier:

- The date (in reverse format)

- The version number

Versions numbers are incremented each time a new version is created for that date and environment. So it’s possible to have `20240313.1` in both the `dev` and `prod` environments.

## 
[​
](#version-locking)Version locking

When a task run starts it is locked to the latest version of the code (for that environment). Once locked it won’t change versions, even if you deploy new versions. This is to ensure that a task run is not affected by changes to the code.

### 
[​
](#child-tasks-and-version-locking)Child tasks and version locking

Trigger and wait functions version lock child task runs to the parent task run version. This ensures the results from child runs match what the parent task is expecting. If you don’t wait then version locking doesn’t apply.

Trigger functionParent task versionChild task versionisLocked`trigger()``20240313.2`LatestNo`batchTrigger()``20240313.2`LatestNo`triggerAndWait()``20240313.2``20240313.2`Yes`batchTriggerAndWait()``20240313.2``20240313.2`Yes

## 
[​
](#local-development)Local development

When running the local server (using `npx trigger.dev dev`), every relevant code change automatically creates a new version of all tasks.
So a task run will continue running on the version it was locked to. We do this by spawning a new process for each task run. This ensures that the task run is not affected by changes to the code.

## 
[​
](#deployment)Deployment

Every deployment creates a new version of all tasks for that environment.

## 
[​
](#retries-and-reattempts)Retries and reattempts

When a task has an uncaught error it will [retry](/docs/errors-retrying), assuming you have not set `maxAttempts` to 0. Retries are locked to the original version of the run.

## 
[​
](#replays)Replays

A “replay” is a new run of a task that uses the same inputs but will use the latest version of the code. This is useful when you fix a bug and want to re-run a task with the same inputs. See [replaying](/docs/replaying) for more information.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/versioning.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /versioning)

[Previous](/docs/queue-concurrency)[MachinesConfigure the number of vCPUs and GBs of RAM you want the task to use.

Next
](/docs/machines)
⌘I

On this page
- [Version identifiers](#version-identifiers)
- [Version locking](#version-locking)
- [Child tasks and version locking](#child-tasks-and-version-locking)
- [Local development](#local-development)
- [Deployment](#deployment)
- [Retries and reattempts](#retries-and-reattempts)
- [Replays](#replays)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)