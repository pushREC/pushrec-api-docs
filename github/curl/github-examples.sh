#!/bin/bash
# GitHub API curl Examples
# 719 endpoints - showing first 50

GITHUB_TOKEN="${GITHUB_TOKEN:-your-token-here}"
BASE_URL="https://api.github.com"


# GitHub API Root
curl -X GET "$BASE_URL/" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List global security advisories
curl -X GET "$BASE_URL/advisories" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get a global security advisory
curl -X GET "$BASE_URL/advisories/${ghsa_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get the authenticated app
curl -X GET "$BASE_URL/app" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create a GitHub App from a manifest
curl -X POST "$BASE_URL/app-manifests/${code}/conversions" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get a webhook configuration for an app
curl -X GET "$BASE_URL/app/hook/config" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Update a webhook configuration for an app
curl -X PATCH "$BASE_URL/app/hook/config" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List deliveries for an app webhook
curl -X GET "$BASE_URL/app/hook/deliveries" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get a delivery for an app webhook
curl -X GET "$BASE_URL/app/hook/deliveries/${delivery_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Redeliver a delivery for an app webhook
curl -X POST "$BASE_URL/app/hook/deliveries/${delivery_id}/attempts" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List installation requests for the authenticated a
curl -X GET "$BASE_URL/app/installation-requests" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List installations for the authenticated app
curl -X GET "$BASE_URL/app/installations" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get an installation for the authenticated app
curl -X GET "$BASE_URL/app/installations/${installation_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete an installation for the authenticated app
curl -X DELETE "$BASE_URL/app/installations/${installation_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create an installation access token for an app
curl -X POST "$BASE_URL/app/installations/${installation_id}/access_tokens" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Suspend an app installation
curl -X PUT "$BASE_URL/app/installations/${installation_id}/suspended" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Unsuspend an app installation
curl -X DELETE "$BASE_URL/app/installations/${installation_id}/suspended" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete an app authorization
curl -X DELETE "$BASE_URL/applications/${client_id}/grant" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Check a token
curl -X POST "$BASE_URL/applications/${client_id}/token" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Reset a token
curl -X PATCH "$BASE_URL/applications/${client_id}/token" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete an app token
curl -X DELETE "$BASE_URL/applications/${client_id}/token" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create a scoped access token
curl -X POST "$BASE_URL/applications/${client_id}/token/scoped" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get an app
curl -X GET "$BASE_URL/apps/${app_slug}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get an assignment
curl -X GET "$BASE_URL/assignments/${assignment_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List accepted assignments for an assignment
curl -X GET "$BASE_URL/assignments/${assignment_id}/accepted_assignments" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get assignment grades
curl -X GET "$BASE_URL/assignments/${assignment_id}/grades" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List classrooms
curl -X GET "$BASE_URL/classrooms" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get a classroom
curl -X GET "$BASE_URL/classrooms/${classroom_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List assignments for a classroom
curl -X GET "$BASE_URL/classrooms/${classroom_id}/assignments" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get all codes of conduct
curl -X GET "$BASE_URL/codes_of_conduct" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get a code of conduct
curl -X GET "$BASE_URL/codes_of_conduct/${key}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Revoke a list of credentials
curl -X POST "$BASE_URL/credentials/revoke" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get emojis
curl -X GET "$BASE_URL/emojis" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get GitHub Actions cache retention limit for an en
curl -X GET "$BASE_URL/enterprises/${enterprise}/actions/cache/retention-limit" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Set GitHub Actions cache retention limit for an en
curl -X PUT "$BASE_URL/enterprises/${enterprise}/actions/cache/retention-limit" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get GitHub Actions cache storage limit for an ente
curl -X GET "$BASE_URL/enterprises/${enterprise}/actions/cache/storage-limit" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Set GitHub Actions cache storage limit for an ente
curl -X PUT "$BASE_URL/enterprises/${enterprise}/actions/cache/storage-limit" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get code security configurations for an enterprise
curl -X GET "$BASE_URL/enterprises/${enterprise}/code-security/configurations" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create a code security configuration for an enterp
curl -X POST "$BASE_URL/enterprises/${enterprise}/code-security/configurations" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get default code security configurations for an en
curl -X GET "$BASE_URL/enterprises/${enterprise}/code-security/configurations/defaults" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Retrieve a code security configuration of an enter
curl -X GET "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Update a custom code security configuration for an
curl -X PATCH "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete a code security configuration for an enterp
curl -X DELETE "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Attach an enterprise configuration to repositories
curl -X POST "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}/attach" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Set a code security configuration as a default for
curl -X PUT "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}/defaults" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get repositories associated with an enterprise cod
curl -X GET "$BASE_URL/enterprises/${enterprise}/code-security/configurations/${configuration_id}/repositories" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List Dependabot alerts for an enterprise
curl -X GET "$BASE_URL/enterprises/${enterprise}/dependabot/alerts" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List enterprise teams
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create an enterprise team
curl -X POST "$BASE_URL/enterprises/${enterprise}/teams" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List members in an enterprise team
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Bulk add team members
curl -X POST "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships/add" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Bulk remove team members
curl -X POST "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships/remove" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get enterprise team membership
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships/${username}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Add team member
curl -X PUT "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships/${username}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Remove team membership
curl -X DELETE "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/memberships/${username}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get organization assignments
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Add organization assignments
curl -X POST "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations/add" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Remove organization assignments
curl -X POST "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations/remove" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get organization assignment
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations/${org}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Add an organization assignment
curl -X PUT "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations/${org}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete an organization assignment
curl -X DELETE "$BASE_URL/enterprises/${enterprise}/teams/${enterprise-team}/organizations/${org}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get an enterprise team
curl -X GET "$BASE_URL/enterprises/${enterprise}/teams/${team_slug}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Update an enterprise team
curl -X PATCH "$BASE_URL/enterprises/${enterprise}/teams/${team_slug}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Delete an enterprise team
curl -X DELETE "$BASE_URL/enterprises/${enterprise}/teams/${team_slug}" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List public events
curl -X GET "$BASE_URL/events" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Get feeds
curl -X GET "$BASE_URL/feeds" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# List gists for the authenticated user
curl -X GET "$BASE_URL/gists" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"

# Create a gist
curl -X POST "$BASE_URL/gists" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json"
