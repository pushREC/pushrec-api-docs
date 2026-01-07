---
source: https://developers.google.com/youtube/terms/developer-policies
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: compliance
method: webfetch
---
 YouTube API Services - Developer Policies

## Core Principles

YouTube's policies rest on five foundational software development principles:

1. **High-Quality Applications**: Build stable, feature-rich API clients that add significant value to YouTube's ecosystem and maintain them promptly.

2. **Honesty & Transparency**: "Be clear about who you are and what your API Client does. Don't engage in any deceptive activity."

3. **User Control**: Users must actively consent to actions taken on their behalf and retain authority over data modifications.

4. **Privacy Protection**: Implement secure data collection, storage, and deletion practices. Never request YouTube login credentials.

5. **Good Citizenship**: Prohibit abuse, harassment, malware, and illegal activities.

## Key Policy Areas

### API Client Requirements

- Display YouTube Terms of Service links prominently
- Require privacy policy acceptance before feature access
- Privacy policies must explain data collection, usage, and third-party sharing comprehensively
- Link to Google Privacy Policy and Google security settings pages
- Explain data revocation procedures

### API Access & Credentials

- Use Google Developers Console to create API Credentials
- Create exactly one API Project per API Client
- Never share credentials with unauthorized third parties
- Don't embed credentials in open-source projects
- Request authorization scopes contextually and only when needed
- Clearly identify requesting entities and purposes

### Data Handling Restrictions

**Audiovisual Content**:
- No downloading or caching YouTube videos without written approval
- No offline playback features
- Don't facilitate copyright infringement

**Data Aggregation**:
- Aggregate data only for channels under the same content owner
- Cannot use aggregated data to analyze YouTube's business metrics

**Authorized Data Storage**:
- Analytics and reporting data: Store long-term with 30-day verification
- Other authorized data: Maximum 30 calendar days
- Non-authorized data: Maximum 30 calendar days
- Provide clear user deletion mechanisms (7-day completion deadline)
- Delete data within 7 days of user revocation or 30 days via Google security settings

### Feature Implementation

- Comply with Required Minimum Functionality standards
- Don't limit YouTube features unless core to your application's purpose
- Clearly identify YouTube actions distinct from your own functionality
- Users maintain final control over published data
- Don't modify user-provided values without explicit consent
- Don't replace, modify, or merge YouTube search results with other sources

### Prohibited Actions

API Clients must **not**:

- Download or cache YouTube audiovisual content without approval
- Aggregate data to analyze YouTube's operations or revenue
- Create substitute services mimicking YouTube's core experience
- Automate views, uploads, comments, or likes without user consent
- Interfere with YouTube players, advertisements, or infrastructure
- Separate or isolate audio/video components
- Modify, block, or disable YouTube advertisements
- Circumvent geographical restrictions
- Reverse engineer or access undocumented APIs
- Scrape YouTube or Google applications
- Charge users to watch embedded videos
- Gate content behind actions other than clicking play
- Offer incentives for viewing, liking, subscribing, or commenting

### Commercial Use

**Permitted**:
- Sell API Clients
- Develop ad-enabled applications
- Upload original content to YouTube
- Distribute devices containing API Clients

**Prohibited**:
- Sell YouTube API Services access without written approval
- Place ads on/within YouTube content without approval
- Place ads on pages containing YouTube data unless substantial independent content justifies it

### Branding & Attribution

- Display YouTube Brand Features to clearly identify YouTube as content source
- Don't obscure YouTube attribution or embedded player credits
- Distinguish YouTube content from other sources on mixed-source pages
- Ensure YouTube branding appears across all device types

### Playback Integrity

- Never charge for video playback
- Don't require actions beyond clicking play to watch content
- Don't offer compensation for engagement (views, likes, subscriptions, comments)
- Don't trade video views for fees or other actions

### Child-Directed API Clients

- Comply with COPPA and GDPR requirements
- Notify Google of child-directed status
- Prohibit personalized/remarketing ads
- Restrict write-based actions (uploads, comments, playlists)
- Can upload personal videos using separate "Upload Project" with "_mfk110" prefix
- Users cannot execute write actions; implementations won't process

### Data Collection & Transparency

- Disclose device-level data collection (cookies, tracking)
- Verify "Made for Kids" status for embedded videos
- Disable tracking for Made for Kids content per COPPA/GDPR
- Provide clear disclosure when displaying non-API data alongside API metrics
- Cannot replace API data with independently calculated equivalents

## Monitoring & Compliance

YouTube reserves rights to:
- Survey, monitor, and audit API usage
- Request account access for compliance verification
- Disable or curtail access for 90+ days inactivity
- Reject or revoke API credentials for policy violations
- Suspend access indefinitely if credentials were previously suspended

Developers must respond to compliance communications via the email associated with their Google Account.

## Quota & Appeal Process

- YouTube manages quotas to ensure quality service
- Request extensions via API Compliance Audit form
- Provide use-case justification for approval
- Notify YouTube if use case changes
- Previously compliant developers can request additional extensions
- Appeal rejected applications through formal process

---

**Last Updated**: August 28, 2025
