A task that is triggered on a recurring schedule using cron syntax.

**
Copy page

Scheduled tasks are only for recurring tasks. If you want to trigger a one-off task at a future
time, you should [use the delay option](/docs/triggering#delay).

## 
[​
](#defining-a-scheduled-task)Defining a scheduled task

This task will run when any of the attached schedules trigger. They have a predefined payload with some useful properties:

Copy

Ask AI

```
import { schedules } from "@trigger.dev/sdk";

export const firstScheduledTask = schedules.task({
 id: "first-scheduled-task",
 run: async (payload) => {
 //when the task was scheduled to run
 //note this will be slightly different from new Date() because it takes a few ms to run the task
 console.log(payload.timestamp); //is a Date object

 //when the task was last run
 //this can be undefined if it's never been run
 console.log(payload.lastTimestamp); //is a Date object or undefined

 //the timezone the schedule was registered with, defaults to "UTC"
 //this is in IANA format, e.g. "America/New_York"
 //See the full list here: https://cloud.trigger.dev/timezones
 console.log(payload.timezone); //is a string

 //If you want to output the time in the user's timezone do this:
 const formatted = payload.timestamp.toLocaleString("en-US", {
 timeZone: payload.timezone,
 });

 //the schedule id (you can have many schedules for the same task)
 //using this you can remove the schedule, update it, etc
 console.log(payload.scheduleId); //is a string

 //you can optionally provide an external id when creating the schedule
 //usually you would set this to a userId or some other unique identifier
 //this can be undefined if you didn't provide one
 console.log(payload.externalId); //is a string or undefined

 //the next 5 dates this task is scheduled to run
 console.log(payload.upcoming); //is an array of Date objects
 },
});

```

You can see from the comments that the payload has several useful properties:

- `timestamp` - the time the task was scheduled to run, as a UTC date.

- `lastTimestamp` - the time the task was last run, as a UTC date.

- `timezone` - the timezone the schedule was registered with, defaults to “UTC”. In IANA format, e.g. “America/New_York”.

- `scheduleId` - the id of the schedule that triggered the task

- `externalId` - the external id you (optionally) provided when creating the schedule

- `upcoming` - the next 5 times the task is scheduled to run

This task will NOT get triggered on a schedule until you attach a schedule to it. Read on for how
to do that.

Like all tasks they don’t have timeouts, they should be placed inside a [/trigger folder](/docs/config/config-file), and you [can configure them](/docs/tasks/overview#defining-a-task).

## 
[​
](#how-to-attach-a-schedule)How to attach a schedule

Now that we’ve defined a scheduled task, we need to define when it will actually run. To do this we need to attach one or more schedules.
There are two ways of doing this:

- Declarative:** defined on your `schedules.task`. They sync when you run the dev command or deploy.

- **Imperative:** created from the dashboard or by using the imperative SDK functions like `schedules.create()`.

A scheduled task can have multiple schedules attached to it, including a declarative schedule
and/or many imperative schedules.

### 
[​
](#declarative-schedules)Declarative schedules

These sync when you run the [dev](/docs/cli-dev) or [deploy](/docs/cli-deploy) commands.
To create them you add the `cron` property to your `schedules.task()`. This property is optional and is only used if you want to add a declarative schedule to your task:

Copy

Ask AI

```
export const firstScheduledTask = schedules.task({
 id: "first-scheduled-task",
 //every two hours (UTC timezone)
 cron: "0 */2 * * *",
 run: async (payload, { ctx }) => {
 //do something
 },
});

```

If you use a string it will be in UTC. Alternatively, you can specify a timezone like this:

Copy

Ask AI

```
export const secondScheduledTask = schedules.task({
 id: "second-scheduled-task",
 cron: {
 //5am every day Tokyo time
 pattern: "0 5 * * *",
 timezone: "Asia/Tokyo",
 //optional, defaults to all environments
 //possible values are "PRODUCTION", "STAGING", "PREVIEW" and "DEVELOPMENT"
 environments: ["PRODUCTION", "STAGING"],
 },
 run: async (payload) => {},
});

```

When you run the [dev](/docs/cli-dev) or [deploy](/docs/cli-deploy) commands, declarative schedules will be synced. If you add, delete or edit the `cron` property it will be updated when you run these commands. You can view your schedules on the Schedules page in the dashboard.

### 
[​
](#imperative-schedules)Imperative schedules

Alternatively you can explicitly attach schedules to a `schedules.task`. You can do this in the Schedules page in the dashboard by just pressing the “New schedule” button, or you can use the SDK to create schedules.
The advantage of imperative schedules is that they can be created dynamically, for example, you could create a schedule for each user in your database. They can also be activated, disabled, edited, and deleted without deploying new code by using the SDK or dashboard.
To use imperative schedules you need to do two things:

- Define a task in your code using `schedules.task()`.

- Attach 1+ schedules to the task either using the dashboard or the SDK.

## 
[​
](#supported-cron-syntax)Supported cron syntax

Copy

Ask AI

```
* * * * *
┬ ┬ ┬ ┬ ┬
│ │ │ │ |
│ │ │ │ └ day of week (0 - 7, 1L - 7L) (0 or 7 is Sun)
│ │ │ └───── month (1 - 12)
│ │ └────────── day of month (1 - 31, L)
│ └─────────────── hour (0 - 23)
└──────────────────── minute (0 - 59)

```

“L” means the last. In the “day of week” field, 1L means the last Monday of the month. In the “day of month” field, L means the last day of the month.
We do not support seconds in the cron syntax.

## 
[​
](#when-schedules-won’t-trigger)When schedules won’t trigger

There are two situations when a scheduled task won’t trigger:

- For Dev environments scheduled tasks will only trigger if you’re running the dev CLI.

- For Staging/Production environments scheduled tasks will only trigger if the task is in the current deployment (latest version). We won’t trigger tasks from previous deployments.

## 
[​
](#attaching-schedules-in-the-dashboard)Attaching schedules in the dashboard

You need to attach a schedule to a task before it will run on a schedule. You can attach static schedules in the dashboard:

1

Go to the Schedules page
In the sidebar select the “Schedules” page, then press the “New schedule” button. Or you can
follow the onboarding and press the create in dashboard button. 

2

Create your schedule
Fill in the form and press “Create schedule” when you’re done. These are the options when creating a schedule:NameDescriptionTaskThe id of the task you want to attach to.Cron patternThe schedule in cron format.TimezoneThe timezone the schedule will run in. Defaults to “UTC”External idAn optional external id, usually you’d use a userId.Deduplication keyAn optional deduplication key. If you pass the same value, it will update rather than create.EnvironmentsThe environments this schedule will run in.

## 
[​

](#attaching-schedules-with-the-sdk)Attaching schedules with the SDK

You call `schedules.create()` to create a schedule from your code. Here’s the simplest possible example:

Copy

Ask AI

```
const createdSchedule = await schedules.create({
 //The id of the scheduled task you want to attach to.
 task: firstScheduledTask.id,
 //The schedule in cron format.
 cron: "0 0 * * *",
 //this is required, it prevents you from creating duplicate schedules. It will update the schedule if it already exists.
 deduplicationKey: "my-deduplication-key",
});

```

The `task` id must be a task that you defined using `schedules.task()`.

You can create many schedules with the same `task`, `cron`, and `externalId` but only one with the same `deduplicationKey`.
This means you can have thousands of schedules attached to a single task, but only one schedule per `deduplicationKey`. Here’s an example with all the options:

Copy

Ask AI

```
const createdSchedule = await schedules.create({
 //The id of the scheduled task you want to attach to.
 task: firstScheduledTask.id,
 //The schedule in cron format.
 cron: "0 0 * * *",
 // Optional, it defaults to "UTC". In IANA format, e.g. "America/New_York".
 // In this case, the task will run at midnight every day in New York time.
 // If you specify a timezone it will automatically work with daylight saving time.
 timezone: "America/New_York",
 //Optionally, you can specify your own IDs (like a user ID) and then use it inside the run function of your task.
 //This allows you to have per-user cron tasks.
 externalId: "user_123456",
 //You can only create one schedule with this key.
 //If you use it twice, the second call will update the schedule.
 //This is useful because you don't want to create duplicate schedules for a user.
 deduplicationKey: "user_123456-todo_reminder",
});

```

See [the SDK reference](/docs/management/schedules/create) for full details.

### 
[​
](#dynamic-schedules-or-multi-tenant-schedules)Dynamic schedules (or multi-tenant schedules)

By using the `externalId` you can have schedules for your users. This is useful for things like reminders, where you want to have a schedule for each user.
A reminder task:

/trigger/reminder.ts

Copy

Ask AI

```
import { schedules } from "@trigger.dev/sdk";

//this task will run when any of the attached schedules trigger
export const reminderTask = schedules.task({
 id: "todo-reminder",
 run: async (payload) => {
 if (!payload.externalId) {
 throw new Error("externalId is required");
 }

 //get user using the externalId you used when creating the schedule
 const user = await db.getUser(payload.externalId);

 //send a reminder email
 await sendReminderEmail(user);
 },
});

```

Then in your backend code, you can create a schedule for each user:

Next.js API route

Copy

Ask AI

```
import { reminderTask } from "~/trigger/reminder";

//app/reminders/route.ts
export async function POST(request: Request) {
 //get the JSON from the request
 const data = await request.json();

 //create a schedule for the user
 const createdSchedule = await schedules.create({
 task: reminderTask.id,
 //8am every day
 cron: "0 8 * * *",
 //the user's timezone
 timezone: data.timezone,
 //the user id
 externalId: data.userId,
 //this makes it impossible to have two reminder schedules for the same user
 deduplicationKey: `${data.userId}-reminder`,
 });

 //return a success response with the schedule
 return Response.json(createdSchedule);
}

```

You can also retrieve, list, delete, deactivate and re-activate schedules using the SDK. More on that later.

## 
[​
](#testing-schedules)Testing schedules

You can test a scheduled task in the dashboard. Note that the `scheduleId` will always come through as `sched_1234` to the run.

1

Go to the Test page
In the sidebar select the “Test” page, then select a scheduled task from the list (they have a
clock icon on them) 

2

Create your schedule
Fill in the form [1]. You can select from a recent run [2] to pre-populate the fields. Press “Run
test” when you’re ready 

## 
[​

](#managing-schedules-with-the-sdk)Managing schedules with the SDK

### 
[​
](#retrieving-an-existing-schedule)Retrieving an existing schedule

Copy

Ask AI

```
const retrievedSchedule = await schedules.retrieve(scheduleId);

```

See [the SDK reference](/docs/management/schedules/retrieve) for full details.

### 
[​
](#listing-schedules)Listing schedules

Copy

Ask AI

```
const allSchedules = await schedules.list();

```

See [the SDK reference](/docs/management/schedules/list) for full details.

### 
[​
](#updating-a-schedule)Updating a schedule

Copy

Ask AI

```
const updatedSchedule = await schedules.update(scheduleId, {
 task: firstScheduledTask.id,
 cron: "0 0 1 * *",
 externalId: "ext_1234444",
 deduplicationKey: "my-deduplication-key",
});

```

See [the SDK reference](/docs/management/schedules/update) for full details.

### 
[​
](#deactivating-a-schedule)Deactivating a schedule

Copy

Ask AI

```
const deactivatedSchedule = await schedules.deactivate(scheduleId);

```

See [the SDK reference](/docs/management/schedules/deactivate) for full details.

### 
[​
](#activating-a-schedule)Activating a schedule

Copy

Ask AI

```
const activatedSchedule = await schedules.activate(scheduleId);

```

See [the SDK reference](/docs/management/schedules/activate) for full details.

### 
[​
](#deleting-a-schedule)Deleting a schedule

Copy

Ask AI

```
const deletedSchedule = await schedules.del(scheduleId);

```

See [the SDK reference](/docs/management/schedules/delete) for full details.

### 
[​
](#getting-possible-timezones)Getting possible timezones

You might want to show a dropdown menu in your UI so your users can select their timezone. You can get a list of all possible timezones using the SDK:

Copy

Ask AI

```
const timezones = await schedules.timezones();

```

See [the SDK reference](/docs/management/schedules/timezones) for full details.
Was this page helpful?

YesNo

[Suggest edits](https://github.com/triggerdotdev/trigger.dev/edit/main/docs/tasks/scheduled.mdx)[Raise issue](https://github.com/triggerdotdev/trigger.dev/issues/new?title=Issue on docs&body=Path: /tasks/scheduled)

[Previous](/docs/tasks/schemaTask)[TriggeringTasks need to be triggered in order to run.

Next
](/docs/triggering)
⌘I

On this page
- [Defining a scheduled task](#defining-a-scheduled-task)
- [How to attach a schedule](#how-to-attach-a-schedule)
- [Declarative schedules](#declarative-schedules)
- [Imperative schedules](#imperative-schedules)
- [Supported cron syntax](#supported-cron-syntax)
- [When schedules won’t trigger](#when-schedules-won%E2%80%99t-trigger)
- [Attaching schedules in the dashboard](#attaching-schedules-in-the-dashboard)
- [Attaching schedules with the SDK](#attaching-schedules-with-the-sdk)
- [Dynamic schedules (or multi-tenant schedules)](#dynamic-schedules-or-multi-tenant-schedules)
- [Testing schedules](#testing-schedules)
- [Managing schedules with the SDK](#managing-schedules-with-the-sdk)
- [Retrieving an existing schedule](#retrieving-an-existing-schedule)
- [Listing schedules](#listing-schedules)
- [Updating a schedule](#updating-a-schedule)
- [Deactivating a schedule](#deactivating-a-schedule)
- [Activating a schedule](#activating-a-schedule)
- [Deleting a schedule](#deleting-a-schedule)
- [Getting possible timezones](#getting-possible-timezones)

[Trigger.dev home page](https://trigger.dev)[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

Developers
[Changelog](https://trigger.dev/changelog)[Contributing](https://github.com/triggerdotdev/trigger.dev/blob/main/CONTRIBUTING.md)[Open source](https://github.com/triggerdotdev/trigger.dev?tab=Apache-2.0-1-ov-file#readme)[GitHub](https://github.com/triggerdotdev/trigger.dev)[OSS Friends](https://trigger.dev/oss-friends)

Product
[Pricing](https://trigger.dev/pricing)[How it works](https://trigger.dev/#how-it-works)[Features](https://trigger.dev/product)[Roadmap](https://feedback.trigger.dev/roadmap)[FAQs](https://trigger.dev/pricing#faqs)[Uptime status](https://status.trigger.dev/)

Company
[Blog](https://trigger.dev/blog)[Contact](https://trigger.dev/contact)[Careers](https://trigger.dev/jobs)[Privacy](https://trigger.dev/legal/privacy)[Terms of service](https://trigger.dev/legal)

[x](https://twitter.com/triggerdotdev)[github](https://github.com/triggerdotdev)[linkedin](https://www.linkedin.com/company/triggerdotdev)

[Powered by](https://www.mintlify.com?utm_campaign=poweredBy&utm_medium=referral&utm_source=trigger)