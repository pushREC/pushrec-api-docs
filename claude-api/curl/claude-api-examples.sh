#!/bin/bash
# Anthropic Claude API - curl Examples
# Generated: 2026-01-07 16:55:16

# Configuration
BASE_URL="https://api.anthropic.com/v1"
API_TOKEN="${API_TOKEN:-your_token_here}"

# ============================================
# Endpoints
# ============================================

# --- V1 ---

# POST /v1/messages
curl -X POST \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/messages"

# POST /v1/messages/batches
curl -X POST \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/messages/batches"

# POST /v1/messages/count_tokens
curl -X POST \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/messages/count_tokens"

# GET /v1/models
curl -X GET \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  "$BASE_URL/v1/models"

# POST /v1/files
curl -X POST \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/files"

# GET /v1/files
curl -X GET \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  "$BASE_URL/v1/files"

# POST /v1/skills
curl -X POST \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/v1/skills"

# GET /v1/skills
curl -X GET \
  -H "x-api-key: \$ANTHROPIC_API_KEY" \
  "$BASE_URL/v1/skills"
