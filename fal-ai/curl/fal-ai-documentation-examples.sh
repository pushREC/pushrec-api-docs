#!/bin/bash
# FAL.ai API - curl Examples
# Generated: 2026-01-07 16:55:17

# Configuration
BASE_URL="https://fal.run"
API_TOKEN="${API_TOKEN:-your_token_here}"

# ============================================
# Endpoints
# ============================================

# --- V1 ---

# Usage API
curl -X GET \
  -H "Authorization: Key \$FAL_KEY" \
  "$BASE_URL/v1/models/usage"

# Pricing API
curl -X GET \
  -H "Authorization: Key \$FAL_KEY" \
  "$BASE_URL/v1/models/pricing"

# --- WEBHOOK ---

# POST /webhook
curl -X POST \
  -H "Authorization: Key \$FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/webhook"
