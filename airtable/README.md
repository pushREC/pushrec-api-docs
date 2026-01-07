# Airtable API Documentation

> **Status:** Documentation Only (No Universal Spec)
> **Last Updated:** 2026-01-08
> **Source:** api.airtable.com

## Important Note

Airtable does **NOT** provide a universal OpenAPI specification. The API dynamically generates documentation per-base because:
- Each base has different tables and fields
- Field types vary per base
- Relationships are base-specific

For base-specific specs, use community tools like [airtable-openapi-schema-generator](https://github.com/yaniv-golan/airtable-openapi-schema-generator).

## Quick Start

```bash
# Set API key
export AIRTABLE_API_KEY="pat.xxxxxxxxxx"

# List bases
curl "https://api.airtable.com/v0/meta/bases" \
  -H "Authorization: Bearer $AIRTABLE_API_KEY"

# List records
curl "https://api.airtable.com/v0/{baseId}/{tableName}" \
  -H "Authorization: Bearer $AIRTABLE_API_KEY"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Meta** | `GET /v0/meta/bases` | List accessible bases |
| **Meta** | `GET /v0/meta/bases/{baseId}/tables` | Get base schema |
| **Records** | `GET /v0/{baseId}/{tableIdOrName}` | List records |
| **Records** | `POST /v0/{baseId}/{tableIdOrName}` | Create records |
| **Records** | `PATCH /v0/{baseId}/{tableIdOrName}` | Update records |
| **Records** | `DELETE /v0/{baseId}/{tableIdOrName}` | Delete records |

## Authentication

- **Type:** Bearer Token (Personal Access Token or OAuth)
- **Header:** `Authorization: Bearer {token}`
- **Get Token:** https://airtable.com/create/tokens

## Resources

- [API Docs](https://airtable.com/developers/web/api/introduction)
- [Web API Reference](https://airtable.com/developers/web/api)
- [Field Types](https://airtable.com/developers/web/api/field-model)
- [OpenAPI Generator](https://github.com/yaniv-golan/airtable-openapi-schema-generator)
