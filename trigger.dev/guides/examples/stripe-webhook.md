# Trigger a Task from Stripe Webhook Events

## Overview

This guide demonstrates how to set up a webhook handler that listens for incoming Stripe events and triggers tasks. The handler specifically processes `checkout.session.completed` events but can be customized for other Stripe event types.

## Key Features

- Creating a Stripe webhook handler in an existing application
- Triggering backend tasks when specific Stripe events occur (e.g., `checkout.session.completed`)

## Required Environment Variables

- `STRIPE_WEBHOOK_SECRET`: Secret key for verifying Stripe webhook signatures
- `TRIGGER_API_URL`: Your Trigger.dev API endpoint (`https://api.trigger.dev`)
- `TRIGGER_SECRET_KEY`: Your Trigger.dev authentication key

## Setting Up the Stripe Webhook Handler

Create a webhook handler route that accepts POST requests and verifies the Stripe signature. Examples are provided for both Next.js and Remix frameworks.

### Next.js Example

```typescript
// app/api/stripe-webhook/route.ts
import { NextResponse } from "next/server";
import { tasks } from "@trigger.dev/sdk";
import Stripe from "stripe";
import type { stripeCheckoutCompleted } from "@/trigger/stripe-checkout-completed";

export async function POST(request: Request) {
  const signature = request.headers.get("stripe-signature");
  const payload = await request.text();

  if (!signature || !payload) {
    return NextResponse.json(
      { error: "Invalid Stripe payload/signature" },
      { status: 400 }
    );
  }

  const event = Stripe.webhooks.constructEvent(
    payload,
    signature,
    process.env.STRIPE_WEBHOOK_SECRET as string
  );

  switch (event.type) {
    case "checkout.session.completed": {
      const { id } = await tasks.trigger<typeof stripeCheckoutCompleted>(
        "stripe-checkout-completed",
        event.data.object
      );
      return NextResponse.json({ runId: id });
    }
    default: {
      return NextResponse.json(
        { message: "Event not handled" },
        { status: 200 }
      );
    }
  }
}
```

### Remix Example

```typescript
// app/webhooks.stripe.ts
import { type ActionFunctionArgs, json } from "@remix-run/node";
import type { stripeCheckoutCompleted } from "src/trigger/stripe-webhook";
import { tasks } from "@trigger.dev/sdk";
import Stripe from "stripe";

export async function action({ request }: ActionFunctionArgs) {
  const signature = request.headers.get("stripe-signature");
  const payload = await request.text();

  if (!signature || !payload) {
    return json({ error: "Invalid Stripe payload/signature" }, { status: 400 });
  }

  const event = Stripe.webhooks.constructEvent(
    payload,
    signature,
    process.env.STRIPE_WEBHOOK_SECRET as string
  );

  switch (event.type) {
    case "checkout.session.completed": {
      const { id } = await tasks.trigger<typeof stripeCheckoutCompleted>(
        "stripe-checkout-completed",
        event.data.object
      );
      return json({ runId: id });
    }
    default: {
      return json({ message: "Event not handled" }, { status: 200 });
    }
  }
}
```

## Task Code

This task executes when a `checkout.session.completed` event arrives:

```typescript
import { task } from "@trigger.dev/sdk";
import type stripe from "stripe";

export const stripeCheckoutCompleted = task({
  id: "stripe-checkout-completed",
  run: async (payload: stripe.Checkout.Session) => {
    // Add your custom logic for handling the checkout.session.completed event here
  },
});
```

## Testing Locally

Use the Stripe CLI to test your webhook handler:

1. Install and authenticate the Stripe CLI
2. Follow Stripe's testing instructions to forward events to your endpoint (includes temporary webhook secret)
3. Trigger the test event using: `stripe trigger checkout.session.completed`
4. Verify the endpoint responds with HTTP 200 status
5. Check the Trigger.dev dashboard for successful task execution

For comprehensive webhook setup details, consult the official "Stripe Webhook Documentation."
