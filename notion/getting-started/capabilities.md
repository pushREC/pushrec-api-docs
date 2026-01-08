---
source: https://developers.notion.com/reference/capabilities
scraped: 2026-01-08
---

# Integration Capabilities

## Overview

The Notion API provides integration capabilities that control what an integration can access and modify within a workspace. These permissions are configured during integration setup and determine which API endpoints are available.

**Key principle**: "If an integration is added to a page, then the integration can access the page's children. When an integration receives access to a Notion page or database, it can read and write to both that resource and its children."

## Content Capabilities

Three primary content permissions exist:

| Capability | Description |
|------------|-------------|
| **Read content** | Allows retrieving existing workspace data (e.g., retrieving databases) without modification rights |
| **Update content** | Permits modifying existing resources (e.g., updating pages) but not creating new ones |
| **Insert content** | Enables creating new content but does not grant full read access to existing objects |

These can be combined in any configuration based on integration needs.

## Comment Capabilities

| Capability | Description |
|------------|-------------|
| **Read comments** | Permission to retrieve comments from pages or blocks |
| **Insert comments** | Permission to create new comments on pages or within existing discussions |

## User Capabilities

Three user information access levels:

| Level | Access |
|-------|--------|
| **No user information** | Integration cannot request user data |
| **User information without email** | Includes name and profile image only |
| **User information with email** | Complete user information access |

## Best Practices

Request minimum capabilities that your integration needs in order to function:

| Integration Type | Recommended Capability |
|------------------|------------------------|
| Data import integrations | **Insert content** only |
| Export tools | **Read content** only |
| Property updates | **Update content** only |

**Important constraint**: User permissions override integration capabilities. If a user loses access, the integration access is automatically reduced accordingly.
