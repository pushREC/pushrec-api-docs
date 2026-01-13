# Python PDF Form Extractor Example - Trigger.dev

## Overview
This demonstration illustrates extracting structured form data from PDF files using Trigger.dev with Python.

## Prerequisites
- "A project with Trigger.dev initialized"
- Python installed locally

## Key Features
- Trigger.dev task for executing Python scripts
- "Trigger.dev Python build extension to install the dependencies and run the Python script"
- PyMuPDF library for form extraction
- Requests library for URL-based PDF downloads

## Build Configuration
The `trigger.config.ts` file requires:

```typescript
import { pythonExtension } from "@trigger.dev/python/extension";
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  runtime: "node",
  project: "<your-project-ref>",
  build: {
    extensions: [
      pythonExtension({
        requirementsFile: "./requirements.txt",
        devPythonBinaryPath: `venv/bin/python`,
        scripts: ["src/python/**/*.py"],
      }),
    ],
  },
});
```

## Task Code

```typescript
import { task } from "@trigger.dev/sdk";
import { python } from "@trigger.dev/python";

export const processPdfForm = task({
  id: "process-pdf-form",
  run: async (payload: { pdfUrl: string }, io: any) => {
    const { pdfUrl } = payload;
    const args = [pdfUrl];
    const result = await python.runScript("./src/python/extract-pdf-form.py", args);

    let formData;
    try {
      formData = JSON.parse(result.stdout);
    } catch (error) {
      throw new Error(`Failed to parse JSON output: ${result.stdout}`);
    }

    return { formData, stderr: result.stderr, exitCode: result.exitCode };
  },
});
```

## Dependencies

```text
PyMuPDF==1.23.8
requests==2.31.0
```

## Python Script Implementation

```python
import fitz
import requests
import os
import json
import sys
from urllib.parse import urlparse

def download_pdf(url):
    """Download PDF from URL to a temporary file"""
    response = requests.get(url)
    response.raise_for_status()
    filename = os.path.basename(urlparse(url).path) or "downloaded.pdf"
    filepath = os.path.join("/tmp", filename)
    with open(filepath, 'wb') as f:
        f.write(response.content)
    return filepath

def extract_form_data(pdf_path):
    """Extract form data from a PDF file."""
    doc = fitz.open(pdf_path)
    form_data = {}

    for page_num, page in enumerate(doc):
        fields = page.widgets()
        for field in fields:
            field_name = field.field_name or f"unnamed_field_{page_num}_{len(form_data)}"
            field_type = field.field_type_string
            field_value = field.field_value

            if field_type == "CheckBox":
                field_value = field_value == "Yes"

            form_data[field_name] = {
                "type": field_type,
                "value": field_value,
                "page": page_num + 1
            }

    return form_data

def main():
    if len(sys.argv) < 2:
        print(json.dumps({"error": "PDF URL is required"}), file=sys.stderr)
        return 1

    url = sys.argv[1]

    try:
        pdf_path = download_pdf(url)
        form_data = extract_form_data(pdf_path)
        structured_output = json.dumps(form_data, indent=2)
        print(structured_output)
        return 0
    except Exception as e:
        print(json.dumps({"error": str(e)}), file=sys.stderr)
        return 1

if __name__ == "__main__":
    sys.exit(main())
```

## Testing Instructions
1. Create virtual environment: `python -m venv venv`
2. Activate it (Mac/Linux: `source venv/bin/activate` | Windows: `venv\Scripts\activate`)
3. Install dependencies: `pip install -r requirements.txt`
4. Add project reference to `trigger.config.ts`
5. Execute: `trigger.dev dev`
6. Test via dashboard with valid PDF URL
7. Deploy with: `trigger.dev deploy`

## Related Resources
"Python build extension to install dependencies and run your Python code"
