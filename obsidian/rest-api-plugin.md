---
created: 2025-12-23
tags: [type/resource]
---

[[3-Resources/anchors/status-active]]

# Local REST API Integration for Obsidian

**Created:** 2025-12-13
**Purpose:** Comprehensive documentation of the Local REST API plugin for advanced Obsidian integrations
**Priority:** LOW (DataviewJS is recommended for most use cases)
**Status:** Complete

---

## Executive Summary

The **Local REST API** plugin exposes your Obsidian vault via a local HTTPS server, enabling external applications to read and write vault data. This is an **advanced approach** for users who need:

- React/Vue/Svelte frontends
- External tool integrations
- Programmatic vault access outside Obsidian

**Verdict:** Use DataviewJS for dashboards. Use Local REST API only for complex external integrations.

---

## Plugin Overview

### What It Does

- Runs local HTTPS server on port `27124` (configurable)
- Exposes vault CRUD operations via REST endpoints
- Supports API key authentication
- Enables external HTML/JS to manipulate vault

### Installation

1. Settings → Community Plugins → Browse
2. Search "Local REST API"
3. Install & Enable
4. Settings → Local REST API
5. Enable HTTPS (required for security)
6. Copy API Key (required for authentication)

### GitHub Repository

**URL:** https://github.com/coddingtonbear/obsidian-local-rest-api

**Maintainer:** Adam Coddington
**Stars:** 1,200+
**Last Updated:** Active development

---

## API Endpoints Reference

### Base URL

```
https://127.0.0.1:27124
```

**Note:** Must use HTTPS. HTTP is disabled for security.

### Authentication

All requests require Bearer token:

```javascript
const headers = {
  'Authorization': 'Bearer YOUR_API_KEY',
  'Content-Type': 'application/json'
};
```

---

### Vault Operations

#### GET /vault/

List all files in vault.

```javascript
const response = await fetch('https://127.0.0.1:27124/vault/', {
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
const files = await response.json();
// Returns: { files: ['note1.md', 'folder/note2.md', ...] }
```

#### GET /vault/{path}

Read file content.

```javascript
const response = await fetch('https://127.0.0.1:27124/vault/1-Projects/my-project.md', {
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
const content = await response.text();
```

#### PUT /vault/{path}

Create or update file.

```javascript
const response = await fetch('https://127.0.0.1:27124/vault/1-Projects/new-note.md', {
  method: 'PUT',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'text/markdown'
  },
  body: `---
created: 2025-12-13
tags: [type/project]
status: active
---

# New Note

Content here...`
});
```

#### DELETE /vault/{path}

Delete file.

```javascript
const response = await fetch('https://127.0.0.1:27124/vault/1-Projects/old-note.md', {
  method: 'DELETE',
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
```

#### PATCH /vault/{path}

Append to file.

```javascript
const response = await fetch('https://127.0.0.1:27124/vault/Daily/2025-12-13.md', {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'text/markdown'
  },
  body: '\n\n## New Section\n\nAppended content...'
});
```

---

### Search Operations

#### POST /search/

Search vault content.

```javascript
const response = await fetch('https://127.0.0.1:27124/search/', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    query: 'project status:active'
  })
});
const results = await response.json();
```

#### POST /search/simple/

Simple text search.

```javascript
const response = await fetch('https://127.0.0.1:27124/search/simple/', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    query: 'meeting notes',
    contextLength: 100
  })
});
```

---

### Command Operations

#### POST /commands/{commandId}/

Execute Obsidian command.

```javascript
// Open daily note
const response = await fetch('https://127.0.0.1:27124/commands/daily-notes/', {
  method: 'POST',
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
```

#### GET /commands/

List available commands.

```javascript
const response = await fetch('https://127.0.0.1:27124/commands/', {
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
const commands = await response.json();
// Returns: { commands: [{ id: 'daily-notes', name: 'Open daily note' }, ...] }
```

---

### Active File Operations

#### GET /active/

Get currently active file.

```javascript
const response = await fetch('https://127.0.0.1:27124/active/', {
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
const activeFile = await response.json();
// Returns: { path: '1-Projects/current.md', content: '...' }
```

#### PUT /active/

Update active file content.

```javascript
const response = await fetch('https://127.0.0.1:27124/active/', {
  method: 'PUT',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'text/markdown'
  },
  body: 'New content for active file'
});
```

---

### Periodic Notes Operations

#### GET /periodic/daily/

Get today's daily note.

```javascript
const response = await fetch('https://127.0.0.1:27124/periodic/daily/', {
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
```

#### POST /periodic/daily/

Create/open today's daily note.

```javascript
const response = await fetch('https://127.0.0.1:27124/periodic/daily/', {
  method: 'POST',
  headers: { 'Authorization': 'Bearer YOUR_API_KEY' }
});
```

---

## CORS Configuration

### Default Behavior

The plugin allows CORS requests from:
- `file://` origins (local HTML files)
- `https://127.0.0.1:*` (localhost)
- `https://localhost:*`

### Custom Frames Integration

When embedding HTML in Custom Frames plugin:

1. **File-based HTML:**
   ```
   file:///path/to/dashboard.html
   ```
   CORS allowed by default.

2. **Localhost server:**
   ```
   https://localhost:3000/dashboard
   ```
   CORS allowed by default.

3. **External server:**
   Not supported (security restriction).

### Troubleshooting CORS

If getting CORS errors:

1. Verify HTTPS is enabled in plugin settings
2. Check API key is correct
3. Ensure request origin is allowed
4. Check browser console for specific error

---

## Integration with Custom Frames Plugin

### Architecture

```
┌─────────────────────────────────────────┐
│ Obsidian                                │
│  ┌────────────────────────────────────┐ │
│  │ Custom Frames Plugin               │ │
│  │  ┌──────────────────────────────┐  │ │
│  │  │ iframe: dashboard.html       │  │ │
│  │  │  ┌─────────────────────────┐ │  │ │
│  │  │  │ React/Vue/Vanilla JS   │ │  │ │
│  │  │  │ fetch() → REST API      │ │  │ │
│  │  │  └─────────────────────────┘ │  │ │
│  │  └──────────────────────────────┘  │ │
│  └────────────────────────────────────┘ │
│                                         │
│  Local REST API Plugin                  │
│  └─ HTTPS Server :27124                 │
└─────────────────────────────────────────┘
```

### Setup Steps

1. **Install plugins:**
   - Local REST API
   - Custom Frames

2. **Configure Local REST API:**
   - Enable HTTPS
   - Copy API key

3. **Create HTML dashboard:**

```html
<!DOCTYPE html>
<html>
<head>
  <title>Vault Dashboard</title>
  <style>
    body { font-family: system-ui; padding: 20px; }
    .project { padding: 10px; margin: 5px 0; background: #f0f0f0; border-radius: 4px; }
  </style>
</head>
<body>
  <h1>My Projects</h1>
  <div id="projects"></div>

  <script>
    const API_URL = 'https://127.0.0.1:27124';
    const API_KEY = 'YOUR_API_KEY_HERE';

    async function loadProjects() {
      try {
        const response = await fetch(`${API_URL}/vault/`, {
          headers: { 'Authorization': `Bearer ${API_KEY}` }
        });

        const data = await response.json();
        const projects = data.files.filter(f => f.startsWith('1-Projects/'));

        const container = document.getElementById('projects');
        container.innerHTML = projects.map(p =>
          `<div class="project">${p}</div>`
        ).join('');
      } catch (error) {
        console.error('Failed to load projects:', error);
        document.getElementById('projects').innerHTML =
          '<p>Error loading projects. Check API key and HTTPS settings.</p>';
      }
    }

    loadProjects();
  </script>
</body>
</html>
```

4. **Save HTML file** (e.g., `/Users/you/dashboards/vault-dashboard.html`)

5. **Configure Custom Frames:**
   - Settings → Custom Frames
   - Add new frame:
     - Name: "Vault Dashboard"
     - URL: `file:///Users/you/dashboards/vault-dashboard.html`
     - Add to ribbon: Yes

6. **Use in Obsidian:**
   - Click ribbon icon, or
   - Use code block in note:

   ````markdown
   ```custom-frames
   frame: Vault Dashboard
   ```
   ````

---

## Security Considerations

### API Key Protection

**Never commit API key to version control:**

```javascript
// ❌ Bad - hardcoded key
const API_KEY = 'abc123def456';

// ✅ Better - load from environment/config
const API_KEY = localStorage.getItem('obsidian_api_key');
```

### HTTPS Certificate

The plugin uses self-signed certificate. Browser may warn:

1. Navigate to `https://127.0.0.1:27124` directly
2. Click "Advanced" → "Proceed to localhost"
3. Certificate will be trusted for session

### Network Exposure

**Default:** Only accessible from localhost (127.0.0.1)

**Warning:** Do not expose to network. The API has full vault access including delete operations.

### Rate Limiting

No built-in rate limiting. If building external app:

```javascript
// Implement client-side rate limiting
const rateLimiter = {
  lastCall: 0,
  minInterval: 100, // ms

  async call(fn) {
    const now = Date.now();
    const wait = Math.max(0, this.minInterval - (now - this.lastCall));
    await new Promise(r => setTimeout(r, wait));
    this.lastCall = Date.now();
    return fn();
  }
};
```

---

## DataviewJS vs Local REST API Comparison

### When to Use DataviewJS

| Scenario | Recommendation |
|----------|----------------|
| Dashboard inside Obsidian | DataviewJS |
| Read vault data | DataviewJS |
| Update frontmatter | DataviewJS + MetaEdit |
| Simple forms | DataviewJS + Modal Form |
| Mobile support needed | DataviewJS |
| No external files | DataviewJS |

### When to Use Local REST API

| Scenario | Recommendation |
|----------|----------------|
| React/Vue/Svelte frontend | Local REST API |
| External tool integration | Local REST API |
| Desktop-only, complex UI | Local REST API |
| Existing web app reuse | Local REST API |
| Full HTML/CSS control | Local REST API |

### Decision Matrix

```
Do you need interactive features in Obsidian?
│
├─ Can it be done with DataviewJS?
│  └─ YES → Use DataviewJS (simpler, more portable)
│
└─ NO (need React, external integration, etc.)
   └─ Use Local REST API + Custom Frames
```

---

## Limitations & Gotchas

### Cannot Do

1. **Real-time sync:** No WebSocket support. Must poll for changes.
2. **Metadata queries:** No Dataview-like query syntax. Must fetch files and parse.
3. **Plugin APIs:** Cannot access other plugin APIs (MetaEdit, Modal Form).
4. **Mobile:** Not supported (no server on mobile).

### Common Issues

1. **HTTPS certificate warning:**
   - Solution: Visit API URL directly in browser, accept certificate

2. **CORS errors:**
   - Solution: Verify origin is localhost or file://

3. **Connection refused:**
   - Solution: Check plugin is enabled, HTTPS is on

4. **API key invalid:**
   - Solution: Copy key again from plugin settings

5. **File not found:**
   - Solution: URL-encode paths with special characters

---

## Example: Full Dashboard Implementation

### File: `/Users/you/dashboards/content-pipeline.html`

```html
<!DOCTYPE html>
<html>
<head>
  <title>Content Pipeline</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, sans-serif;
      background: #1e1e1e;
      color: #e0e0e0;
      padding: 20px;
    }
    h1 { margin-bottom: 20px; }
    .pipeline {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
    }
    .column {
      background: #2d2d2d;
      border-radius: 8px;
      padding: 16px;
    }
    .column-header {
      font-weight: bold;
      margin-bottom: 12px;
      padding-bottom: 8px;
      border-bottom: 2px solid #444;
    }
    .card {
      background: #3d3d3d;
      padding: 12px;
      margin-bottom: 8px;
      border-radius: 6px;
      border-left: 3px solid #7c3aed;
    }
    .card-title { font-weight: 500; }
    .card-meta { font-size: 12px; color: #888; margin-top: 4px; }
    .btn {
      padding: 4px 8px;
      margin-top: 8px;
      margin-right: 4px;
      font-size: 11px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      background: #4a4a4a;
      color: #e0e0e0;
    }
    .btn:hover { background: #7c3aed; }
    .error { color: #ef4444; padding: 20px; }
    .loading { color: #888; padding: 20px; }
  </style>
</head>
<body>
  <h1>Content Pipeline</h1>
  <div id="pipeline" class="pipeline">
    <div class="loading">Loading...</div>
  </div>

  <script>
    const API_URL = 'https://127.0.0.1:27124';
    const API_KEY = localStorage.getItem('obsidian_api_key') || prompt('Enter API key:');

    if (API_KEY) {
      localStorage.setItem('obsidian_api_key', API_KEY);
    }

    const CONTENT_PATH = '2-Areas/content-machine';
    const STAGES = ['idea', 'draft', 'review', 'published'];

    async function fetchWithAuth(url, options = {}) {
      return fetch(url, {
        ...options,
        headers: {
          'Authorization': `Bearer ${API_KEY}`,
          ...options.headers
        }
      });
    }

    function parseMarkdown(content) {
      const frontmatterMatch = content.match(/^---\n([\s\S]*?)\n---/);
      if (!frontmatterMatch) return {};

      const frontmatter = {};
      frontmatterMatch[1].split('\n').forEach(line => {
        const [key, ...valueParts] = line.split(':');
        if (key && valueParts.length) {
          frontmatter[key.trim()] = valueParts.join(':').trim();
        }
      });
      return frontmatter;
    }

    async function loadContent() {
      try {
        const response = await fetchWithAuth(`${API_URL}/vault/`);
        const data = await response.json();

        const contentFiles = data.files.filter(f =>
          f.startsWith(CONTENT_PATH) && f.endsWith('.md')
        );

        const items = await Promise.all(contentFiles.map(async (path) => {
          const fileResponse = await fetchWithAuth(`${API_URL}/vault/${encodeURIComponent(path)}`);
          const content = await fileResponse.text();
          const frontmatter = parseMarkdown(content);
          return {
            path,
            name: path.split('/').pop().replace('.md', ''),
            stage: frontmatter['content-type'] || 'idea',
            platform: frontmatter.platform || 'unknown'
          };
        }));

        renderPipeline(items);
      } catch (error) {
        document.getElementById('pipeline').innerHTML =
          `<div class="error">Error: ${error.message}</div>`;
      }
    }

    function renderPipeline(items) {
      const pipeline = document.getElementById('pipeline');
      pipeline.innerHTML = STAGES.map(stage => {
        const stageItems = items.filter(i => i.stage === stage);
        return `
          <div class="column">
            <div class="column-header">${stage.toUpperCase()} (${stageItems.length})</div>
            ${stageItems.map(item => `
              <div class="card">
                <div class="card-title">${item.name}</div>
                <div class="card-meta">Platform: ${item.platform}</div>
                <div>
                  ${STAGES.indexOf(stage) > 0 ?
                    `<button class="btn" onclick="moveItem('${item.path}', '${STAGES[STAGES.indexOf(stage) - 1]}')">
                      ← ${STAGES[STAGES.indexOf(stage) - 1]}
                    </button>` : ''}
                  ${STAGES.indexOf(stage) < STAGES.length - 1 ?
                    `<button class="btn" onclick="moveItem('${item.path}', '${STAGES[STAGES.indexOf(stage) + 1]}')">
                      ${STAGES[STAGES.indexOf(stage) + 1]} →
                    </button>` : ''}
                </div>
              </div>
            `).join('')}
          </div>
        `;
      }).join('');
    }

    async function moveItem(path, newStage) {
      try {
        const response = await fetchWithAuth(`${API_URL}/vault/${encodeURIComponent(path)}`);
        let content = await response.text();

        // Update frontmatter
        content = content.replace(
          /content-type:\s*\w+/,
          `content-type: ${newStage}`
        );

        await fetchWithAuth(`${API_URL}/vault/${encodeURIComponent(path)}`, {
          method: 'PUT',
          headers: { 'Content-Type': 'text/markdown' },
          body: content
        });

        loadContent(); // Refresh
      } catch (error) {
        alert(`Failed to move: ${error.message}`);
      }
    }

    loadContent();
  </script>
</body>
</html>
```

---

## Recommendation

**For 95% of use cases: Use DataviewJS.**

Local REST API is powerful but adds complexity:
- External HTML files to maintain
- API key management
- HTTPS certificate trust
- No mobile support

Only use Local REST API when:
1. You MUST use React/Vue/Svelte
2. You're integrating with external tools
3. You need UI capabilities beyond DataviewJS

**Default to DataviewJS + MetaEdit + Modal Form.**

---

## References

- **Plugin GitHub:** https://github.com/coddingtonbear/obsidian-local-rest-api
- **API Documentation:** https://coddingtonbear.github.io/obsidian-local-rest-api/
- **Custom Frames Plugin:** https://github.com/Ellpeck/ObsidianCustomFrames
- **Obsidian Forum Discussion:** https://forum.obsidian.md/t/local-rest-api-plugin/

---

**Last Updated:** 2025-12-13
**Research Status:** Complete
**Priority:** LOW (DataviewJS recommended for most cases)
