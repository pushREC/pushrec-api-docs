#!/bin/bash
# Stripe API curl Examples
# 414 endpoints - showing first 50

STRIPE_SECRET_KEY="${STRIPE_SECRET_KEY:-sk_test_...}"
BASE_URL="https://api.stripe.com"


# Retrieve account
curl -X GET "$BASE_URL/v1/account" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create an account link
curl -X POST "$BASE_URL/v1/account_links" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create an Account Session
curl -X POST "$BASE_URL/v1/account_sessions" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all connected accounts
curl -X GET "$BASE_URL/v1/accounts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/accounts
curl -X POST "$BASE_URL/v1/accounts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete an account
curl -X DELETE "$BASE_URL/v1/accounts/${account}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve account
curl -X GET "$BASE_URL/v1/accounts/${account}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update an account
curl -X POST "$BASE_URL/v1/accounts/${account}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create an external account
curl -X POST "$BASE_URL/v1/accounts/${account}/bank_accounts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete an external account
curl -X DELETE "$BASE_URL/v1/accounts/${account}/bank_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve an external account
curl -X GET "$BASE_URL/v1/accounts/${account}/bank_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/accounts/{account}/bank_accounts/{id}
curl -X POST "$BASE_URL/v1/accounts/${account}/bank_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all account capabilities
curl -X GET "$BASE_URL/v1/accounts/${account}/capabilities" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve an Account Capability
curl -X GET "$BASE_URL/v1/accounts/${account}/capabilities/${capability}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update an Account Capability
curl -X POST "$BASE_URL/v1/accounts/${account}/capabilities/${capability}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all external accounts
curl -X GET "$BASE_URL/v1/accounts/${account}/external_accounts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create an external account
curl -X POST "$BASE_URL/v1/accounts/${account}/external_accounts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete an external account
curl -X DELETE "$BASE_URL/v1/accounts/${account}/external_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve an external account
curl -X GET "$BASE_URL/v1/accounts/${account}/external_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/accounts/{account}/external_accounts/{id}
curl -X POST "$BASE_URL/v1/accounts/${account}/external_accounts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a login link
curl -X POST "$BASE_URL/v1/accounts/${account}/login_links" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all persons
curl -X GET "$BASE_URL/v1/accounts/${account}/people" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a person
curl -X POST "$BASE_URL/v1/accounts/${account}/people" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete a person
curl -X DELETE "$BASE_URL/v1/accounts/${account}/people/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a person
curl -X GET "$BASE_URL/v1/accounts/${account}/people/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update a person
curl -X POST "$BASE_URL/v1/accounts/${account}/people/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all persons
curl -X GET "$BASE_URL/v1/accounts/${account}/persons" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a person
curl -X POST "$BASE_URL/v1/accounts/${account}/persons" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete a person
curl -X DELETE "$BASE_URL/v1/accounts/${account}/persons/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a person
curl -X GET "$BASE_URL/v1/accounts/${account}/persons/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update a person
curl -X POST "$BASE_URL/v1/accounts/${account}/persons/${person}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Reject an account
curl -X POST "$BASE_URL/v1/accounts/${account}/reject" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/apple_pay/domains
curl -X GET "$BASE_URL/v1/apple_pay/domains" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/apple_pay/domains
curl -X POST "$BASE_URL/v1/apple_pay/domains" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/apple_pay/domains/{domain}
curl -X DELETE "$BASE_URL/v1/apple_pay/domains/${domain}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/apple_pay/domains/{domain}
curl -X GET "$BASE_URL/v1/apple_pay/domains/${domain}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all application fees
curl -X GET "$BASE_URL/v1/application_fees" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve an application fee refund
curl -X GET "$BASE_URL/v1/application_fees/${fee}/refunds/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update an application fee refund
curl -X POST "$BASE_URL/v1/application_fees/${fee}/refunds/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve an application fee
curl -X GET "$BASE_URL/v1/application_fees/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# /v1/application_fees/{id}/refund
curl -X POST "$BASE_URL/v1/application_fees/${id}/refund" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all application fee refunds
curl -X GET "$BASE_URL/v1/application_fees/${id}/refunds" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create an application fee refund
curl -X POST "$BASE_URL/v1/application_fees/${id}/refunds" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List secrets
curl -X GET "$BASE_URL/v1/apps/secrets" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Set a Secret
curl -X POST "$BASE_URL/v1/apps/secrets" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Delete a Secret
curl -X POST "$BASE_URL/v1/apps/secrets/delete" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Find a Secret
curl -X GET "$BASE_URL/v1/apps/secrets/find" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve balance
curl -X GET "$BASE_URL/v1/balance" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all balance transactions
curl -X GET "$BASE_URL/v1/balance/history" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a balance transaction
curl -X GET "$BASE_URL/v1/balance/history/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve balance settings
curl -X GET "$BASE_URL/v1/balance_settings" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update balance settings
curl -X POST "$BASE_URL/v1/balance_settings" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List all balance transactions
curl -X GET "$BASE_URL/v1/balance_transactions" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a balance transaction
curl -X GET "$BASE_URL/v1/balance_transactions/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List billing alerts
curl -X GET "$BASE_URL/v1/billing/alerts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a billing alert
curl -X POST "$BASE_URL/v1/billing/alerts" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a billing alert
curl -X GET "$BASE_URL/v1/billing/alerts/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Activate a billing alert
curl -X POST "$BASE_URL/v1/billing/alerts/${id}/activate" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Archive a billing alert
curl -X POST "$BASE_URL/v1/billing/alerts/${id}/archive" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Deactivate a billing alert
curl -X POST "$BASE_URL/v1/billing/alerts/${id}/deactivate" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve the credit balance summary for a customer
curl -X GET "$BASE_URL/v1/billing/credit_balance_summary" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List credit balance transactions
curl -X GET "$BASE_URL/v1/billing/credit_balance_transactions" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a credit balance transaction
curl -X GET "$BASE_URL/v1/billing/credit_balance_transactions/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List credit grants
curl -X GET "$BASE_URL/v1/billing/credit_grants" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a credit grant
curl -X POST "$BASE_URL/v1/billing/credit_grants" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a credit grant
curl -X GET "$BASE_URL/v1/billing/credit_grants/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update a credit grant
curl -X POST "$BASE_URL/v1/billing/credit_grants/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Expire a credit grant
curl -X POST "$BASE_URL/v1/billing/credit_grants/${id}/expire" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Void a credit grant
curl -X POST "$BASE_URL/v1/billing/credit_grants/${id}/void" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a billing meter event adjustment
curl -X POST "$BASE_URL/v1/billing/meter_event_adjustments" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a billing meter event
curl -X POST "$BASE_URL/v1/billing/meter_events" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# List billing meters
curl -X GET "$BASE_URL/v1/billing/meters" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Create a billing meter
curl -X POST "$BASE_URL/v1/billing/meters" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Retrieve a billing meter
curl -X GET "$BASE_URL/v1/billing/meters/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Update a billing meter
curl -X POST "$BASE_URL/v1/billing/meters/${id}" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"

# Deactivate a billing meter
curl -X POST "$BASE_URL/v1/billing/meters/${id}/deactivate" \
  -u "$STRIPE_SECRET_KEY:" \
  -H "Content-Type: application/x-www-form-urlencoded"
