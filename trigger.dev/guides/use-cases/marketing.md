# Marketing Workflows - Trigger.dev

## Page Overview

**Title:** Marketing workflows - Trigger.dev

**Description:** "Learn how to use Trigger.dev for marketing workflows, including drip campaigns, behavioral triggers, personalization engines, and AI-powered content workflows"

## Main Content

### Overview
Build marketing workflows from email drip sequences to orchestrating full multi-channel campaigns. Handle multi-day sequences, behavioral triggers, dynamic content generation, and build live analytics dashboards.

### Featured Examples

Three main examples are highlighted:

1. **Email sequences with Resend** - "Send multi-day email sequences with wait delays between messages."

2. **Product image generator** - "Transform product photos into professional marketing images using Replicate."

3. **Human-in-the-loop workflow** - "Approve marketing content using a human-in-the-loop workflow."

### Key Benefits

**Delays without idle costs:** "Wait hours or weeks between steps. Waits over 5 seconds are automatically checkpointed and don't count towards compute usage."

**Guaranteed delivery:** "Messages send exactly once, even after retries. Personalized content isn't regenerated on failure."

**Scale without limits:** "Process thousands in parallel while respecting rate limits. Send to entire segments without overwhelming APIs."

### Production Use Cases

Icon customer story reference highlighting their use of Trigger.dev for processing and generating thousands of videos monthly.

### Example Workflow Patterns

Four patterns are documented with Mermaid diagrams:

1. **Drip email campaign** - User signup → welcome email → 24h wait → product tips → 7d wait → feedback
2. **Multi-channel campaigns** - Router pattern selecting channels (email/SMS/push) with coordinated delays
3. **AI content with approval** - Generation → human review token → approval gate → publish
4. **Survey response enrichment** - Parallel enrichment from CRM/analytics → scoring → profile updates → follow-up

### Featured Use Cases (Links)

- Data processing & ETL workflows
- Media processing workflows
- AI media generation workflows
- Marketing workflows
