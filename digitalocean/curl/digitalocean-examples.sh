#!/bin/bash
# DigitalOcean API - curl Examples
# Generated: 2026-01-07 16:55:16

# Configuration
BASE_URL="https://api.digitalocean.com/v2"
API_TOKEN="${API_TOKEN:-your_token_here}"

# ============================================
# Endpoints
# ============================================

# ---  ---

# OPTIONS //
curl -X OPTIONS \
  -H "Authorization: Bearer $API_TOKEN" \
  "$BASE_URL//"

# --- COPY ---

# PUT /copy
curl -X PUT \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/copy"

# --- HELLO ---

# GET /hello
curl -X GET \
  -H "Authorization: Bearer $API_TOKEN" \
  "$BASE_URL/hello"

# PUT /hello
curl -X PUT \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/hello"

# DELETE /hello
curl -X DELETE \
  -H "Authorization: Bearer $API_TOKEN" \
  "$BASE_URL/hello"

# --- LARGE-FILE ---

# POST /large-file
curl -X POST \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/large-file"

# PUT /large-file
curl -X PUT \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}' \
  "$BASE_URL/large-file"
