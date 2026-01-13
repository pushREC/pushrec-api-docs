# Convert Documents to Markdown Using Python and MarkItDown

## Overview
"Convert documents to markdown using Microsoft's MarkItDown library. This can be especially useful for preparing documents in a structured format for AI applications."

## Prerequisites
- A Trigger.dev project initialized
- Python installed (requires version 3.10 or higher)

## Key Features
- Downloads documents from URLs and converts them to markdown
- Uses Microsoft's MarkItDown library for conversion
- Integrates Trigger.dev's Python build extension for dependency management

## Build Configuration

The `trigger.config.ts` file requires:
- Import of `pythonExtension` from "@trigger.dev/python/extension"
- `requirementsFile` pointing to "./requirements.txt"
- `devPythonBinaryPath` set to "venv/bin/python"
- `scripts` pattern configured for Python files

## Task Implementation

The TypeScript task performs five steps:
1. Creates temporary files with unique naming
2. Downloads files from provided URLs
3. Runs the Python conversion script
4. Cleans up temporary files
5. Processes and returns results

## Dependencies

The `requirements.txt` file requires: `markitdown[all]`

## Python Converter Script

The Python script:
- Imports json, sys, os modules and MarkItDown
- Defines `convert_to_markdown()` function checking file existence
- Initializes MarkItDown and converts files
- Includes error handling for file operations
- Returns JSON-formatted results via stdout

## Testing Instructions

1. Create virtual environment: `python -m venv venv`
2. Activate environment (Mac/Linux: `source venv/bin/activate`)
3. Install dependencies: `pip install -r requirements.txt`
4. Add project reference to trigger.config.ts
5. Run Trigger.dev CLI dev command
6. Test via dashboard with document URLs
7. Deploy using CLI deploy command

## MarkItDown Capabilities

Supports conversion of:
- Office formats (Word, PowerPoint, Excel)
- PDFs and images
- HTML, CSV, JSON, XML
- Audio files with optional transcription
- ZIP archives

Preserves document structure including headings, lists, and tables.

## Resources

Link to GitHub repository for full project code available in examples.
