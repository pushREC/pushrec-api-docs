# Google Docs API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-16
> **Source:** docs.googleapis.com

## Contents

| Type | Description |
|------|-------------|
| `discovery-v1.json` | Docs API Discovery Document |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set OAuth credentials
export GOOGLE_OAUTH_CREDENTIALS="path/to/credentials.json"

# Get document content
curl "https://docs.googleapis.com/v1/documents/{documentId}" \
  -H "Authorization: Bearer $ACCESS_TOKEN"

# Create a new document
curl -X POST "https://docs.googleapis.com/v1/documents" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title": "My New Document"}'
```

## Key Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| **GET** | `/v1/documents/{documentId}` | Get document content and structure |
| **POST** | `/v1/documents` | Create a blank document with title |
| **POST** | `/v1/documents/{documentId}:batchUpdate` | Apply updates atomically |

## Batch Update Operations

The `batchUpdate` endpoint supports various operations:

| Operation | Description |
|-----------|-------------|
| `insertText` | Insert text at a location |
| `deleteContentRange` | Delete content in a range |
| `updateTextStyle` | Update text formatting |
| `updateParagraphStyle` | Update paragraph formatting |
| `insertInlineImage` | Insert an image |
| `insertTable` | Insert a table |
| `insertTableRow` | Insert a row in a table |
| `insertTableColumn` | Insert a column in a table |
| `deleteTable` | Delete a table |
| `replaceAllText` | Find and replace text |
| `createNamedRange` | Create a named range |
| `deleteNamedRange` | Delete a named range |
| `updateDocumentStyle` | Update document-level style |
| `createHeader` | Create a header |
| `createFooter` | Create a footer |
| `createFootnote` | Create a footnote |

## Authentication

- **Type:** OAuth 2.0 (required)
- **Scopes:**
  - `https://www.googleapis.com/auth/documents` - Full read/write access
  - `https://www.googleapis.com/auth/documents.readonly` - Read-only access
  - `https://www.googleapis.com/auth/drive` - Full Drive access (includes Docs)
  - `https://www.googleapis.com/auth/drive.file` - Access to files created by app
  - `https://www.googleapis.com/auth/drive.readonly` - Read-only Drive access
- **Console:** https://console.cloud.google.com/apis/credentials

## Document Structure

A Google Doc is structured as:

```
Document
├── documentId (string)
├── title (string)
├── body (Body)
│   └── content[] (StructuralElement)
│       ├── Paragraph
│       │   └── elements[] (ParagraphElement)
│       │       ├── TextRun (text content)
│       │       ├── InlineObjectElement (images)
│       │       └── ...
│       ├── SectionBreak
│       ├── Table
│       └── TableOfContents
├── headers (map)
├── footers (map)
├── footnotes (map)
├── documentStyle (DocumentStyle)
├── namedStyles (NamedStyles)
├── lists (map)
├── namedRanges (map)
└── inlineObjects (map)
```

## Index Positioning

Google Docs uses 1-based index positions:
- Index 1 = Start of document body
- Each character, object, and structural element occupies index positions
- Use `startIndex` and `endIndex` in batch updates to specify ranges

## Resources

- [API Docs](https://developers.google.com/docs/api)
- [API Reference](https://developers.google.com/docs/api/reference/rest)
- [Python Client](https://github.com/googleapis/google-api-python-client)
- [Concepts Guide](https://developers.google.com/docs/api/concepts)
- [Document Structure](https://developers.google.com/docs/api/concepts/structure)
