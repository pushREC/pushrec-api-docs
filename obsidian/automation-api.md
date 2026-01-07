---
created: 2025-12-25
tags:
  - type/research
  - topic/obsidian
  - topic/automation
  - topic/api
  - topic/integration
status: active
priority: p1
research_phase: deep-research
---

[[3-Resources/anchors/status-active]]

[[3-Resources/anchors/priority-p1]]

# Obsidian Automation & API Integration: Comprehensive Research Report 2025

## Executive Summary

Obsidian offers robust automation capabilities through plugins, URI schemes, and external integrations. This report covers all major automation pathways: from the Local REST API for programmatic access, to mobile automation with iOS Shortcuts and Android Tasker, to sync-specific hooks and backup automation.

**Key Automation Pathways:**
1. **Local REST API** - Full CRUD operations via HTTP
2. **Advanced URI** - URL scheme for deep linking
3. **GitHub Actions** - CI/CD for vault operations
4. **Templater/DataviewJS** - In-vault scripting
5. **External Tools** - Zapier, Make, n8n, Home Assistant
6. **Mobile Automation** - iOS Shortcuts, Android Tasker
7. **AI Integration** - Smart Connections, Copilot, Claude

---

## 1. Obsidian Local REST API Plugin

### Overview

The [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) by coddingtonbear exposes your Obsidian vault via a secure HTTPS interface, enabling programmatic interaction from any tool that can make HTTP requests.

**Key Features:**
- Full CRUD operations on notes
- Secure HTTPS with auto-generated certificates
- API key authentication
- Extensible by other plugins
- Interactive API documentation

### Installation & Configuration

1. Install from Community Plugins: "Local REST API"
2. Enable the plugin
3. Note your API key from Settings
4. Default port: 27123 (HTTPS), 27124 (HTTP)
5. By default, binds to 127.0.0.1 (localhost only)

**Security Settings:**

| Setting | Default | Description |
|---------|---------|-------------|
| HTTPS Port | 27123 | Secure endpoint |
| HTTP Port | 27124 | Insecure (disable in production) |
| Bind Address | 127.0.0.1 | Change to 0.0.0.0 for network access |
| API Key | Auto-generated | Required for all requests |
| Certificate | Self-signed | Valid 365 days, auto-regenerated |

### Available Endpoints

#### Notes Operations

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/vault/{path}` | Read note content |
| `PUT` | `/vault/{path}` | Create or overwrite note |
| `POST` | `/vault/{path}` | Create note (fail if exists) |
| `PATCH` | `/vault/{path}` | Insert content at heading |
| `DELETE` | `/vault/{path}` | Delete note |

#### Vault Operations

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/vault/` | List all files in vault |
| `GET` | `/search/` | Search vault contents |
| `GET` | `/search/simple/` | Simple text search |

#### Periodic Notes

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/periodic/daily/` | Get today's daily note |
| `POST` | `/periodic/daily/` | Create today's daily note |
| `GET` | `/periodic/weekly/` | Get current weekly note |

#### Commands

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/commands/` | List all available commands |
| `POST` | `/commands/{commandId}/` | Execute a command |

#### Active File

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/active/` | Get currently open file |
| `PUT` | `/active/` | Open a file |
| `PATCH` | `/active/` | Insert content at cursor |

### Example API Calls

**Read a note:**
```bash
curl -k -H "Authorization: Bearer YOUR_API_KEY" \
  "https://127.0.0.1:27123/vault/Daily/2025-12-25.md"
```

**Create a note:**
```bash
curl -k -X PUT \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: text/markdown" \
  -d "# New Note\n\nContent here" \
  "https://127.0.0.1:27123/vault/0-Inbox/new-note.md"
```

**Append to daily note:**
```bash
curl -k -X POST \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: text/markdown" \
  -d "- [ ] New task from API" \
  "https://127.0.0.1:27123/periodic/daily/"
```

**Execute a command:**
```bash
curl -k -X POST \
  -H "Authorization: Bearer YOUR_API_KEY" \
  "https://127.0.0.1:27123/commands/workspace:export-pdf/"
```

**Search vault:**
```bash
curl -k -H "Authorization: Bearer YOUR_API_KEY" \
  "https://127.0.0.1:27123/search/simple/?query=project%20meeting"
```

### Python Integration Example

```python
import requests

class ObsidianAPI:
    def __init__(self, api_key, port=27123):
        self.base_url = f"https://127.0.0.1:{port}"
        self.headers = {
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "text/markdown"
        }
        self.session = requests.Session()
        self.session.verify = False  # Self-signed cert

    def read_note(self, path):
        r = self.session.get(
            f"{self.base_url}/vault/{path}",
            headers=self.headers
        )
        return r.text if r.ok else None

    def create_note(self, path, content):
        r = self.session.put(
            f"{self.base_url}/vault/{path}",
            headers=self.headers,
            data=content
        )
        return r.ok

    def append_to_daily(self, content):
        r = self.session.post(
            f"{self.base_url}/periodic/daily/",
            headers=self.headers,
            data=content
        )
        return r.ok

    def search(self, query):
        r = self.session.get(
            f"{self.base_url}/search/simple/",
            headers=self.headers,
            params={"query": query}
        )
        return r.json() if r.ok else []

# Usage
api = ObsidianAPI("your-api-key")
api.append_to_daily("- [ ] Task from Python script")
```

### Security Considerations

**Best Practices:**
1. Never expose to the internet without VPN/tunnel
2. Use HTTPS (disable HTTP port)
3. Rotate API key periodically
4. Bind to 127.0.0.1 unless needed otherwise
5. Use firewall rules to restrict access

**Remote Access (if needed):**
- Use Cloudflare Tunnel or Tailscale
- Set up proper authentication
- Consider rate limiting
- Enable audit logging

### Interactive Documentation

Visit the [Interactive API Docs](https://coddingtonbear.github.io/obsidian-local-rest-api/) to test endpoints directly.

---

## 2. Obsidian Advanced URI Plugin

### Overview

[Advanced URI](https://github.com/Vinzent03/obsidian-advanced-uri) extends Obsidian's built-in URI scheme with powerful actions for automation.

**Documentation:** https://publish.obsidian.md/advanced-uri-doc

### URI Scheme Basics

**Format:**
```
obsidian://adv-uri?vault=<vault-name>&<parameters>
```

### Core Actions

#### Open Files

```
obsidian://adv-uri?vault=MyVault&filepath=folder/note.md
```

#### Create Notes

```
obsidian://adv-uri?vault=MyVault&filepath=new-note.md&data=Content%20here
```

#### Append/Prepend Content

```
# Append to end
obsidian://adv-uri?vault=MyVault&filepath=note.md&data=New%20content&mode=append

# Prepend to start
obsidian://adv-uri?vault=MyVault&filepath=note.md&data=New%20content&mode=prepend
```

#### Insert at Heading

```
obsidian://adv-uri?vault=MyVault&filepath=note.md&heading=Tasks&data=New%20task&mode=append
```

#### Daily Notes

```
# Open today's daily note
obsidian://adv-uri?vault=MyVault&daily=true

# Append to daily note
obsidian://adv-uri?vault=MyVault&daily=true&data=Log%20entry&mode=append

# From clipboard
obsidian://adv-uri?vault=MyVault&daily=true&clipboard=true&mode=append
```

#### Execute Commands

```
obsidian://adv-uri?vault=MyVault&commandid=editor:toggle-bold
obsidian://adv-uri?vault=MyVault&filepath=note.md&commandid=workspace:export-pdf
```

#### Search

```
obsidian://adv-uri?vault=MyVault&search=project%20status
```

### Parameter Reference

| Parameter | Description | Example |
|-----------|-------------|---------|
| `vault` | Vault name | `vault=MyVault` |
| `filepath` | Path to file | `filepath=folder/note.md` |
| `filename` | File name (searches) | `filename=note` |
| `daily` | Use daily note | `daily=true` |
| `data` | Content to write | `data=Hello` |
| `clipboard` | Use clipboard content | `clipboard=true` |
| `mode` | Write mode | `mode=append\|prepend\|overwrite` |
| `heading` | Target heading | `heading=Tasks` |
| `line` | Target line number | `line=10` |
| `commandid` | Command to execute | `commandid=editor:toggle-bold` |
| `search` | Search query | `search=project` |
| `newpane` | Open in new pane | `newpane=true` |
| `settingid` | Open setting tab | `settingid=plugins` |

### iOS Shortcuts Integration

#### Quick Capture Shortcut

```
1. Create new Shortcut
2. Add "Get Clipboard" or "Ask for Input"
3. Add "URL Encode" text action
4. Add "Open URL" with:
   obsidian://adv-uri?vault=MyVault&daily=true&data=[Encoded Text]&mode=append
```

#### Voice to Note Shortcut

```
1. "Dictate Text" action
2. Store in variable
3. "URL Encode" the variable
4. Open URL:
   obsidian://adv-uri?vault=MyVault&filepath=0-Inbox/voice-[Date].md&data=[Variable]
```

#### Share Sheet Capture

```
1. Accept "Text" or "URL" from Share Sheet
2. Format as desired
3. URL encode
4. Open Advanced URI to append to Inbox
```

### Android Tasker Integration

#### Basic Task Setup

1. Create new Task
2. Add Action → Net → Browse URL
3. Enter Advanced URI

**Example - Quick Task Add:**
```
Task: Add Task to Daily
Action: Browse URL
URL: obsidian://adv-uri?vault=MyVault&daily=true&data=-%20[%20]%20%task&mode=append
```

#### MacroDroid Alternative

For users who prefer MacroDroid over Tasker:

1. Add "Send Intent" action
2. **Action:** `android.intent.action.VIEW`
3. **Data:** `obsidian://adv-uri?vault=MyVault&daily=true`

#### Widget Trigger

1. Create Tasker Task for capture
2. Add Tasker Widget to home screen
3. Link widget to task

### Related: Actions URI Plugin

[Actions URI](https://github.com/czottmann/obsidian-actions-uri) extends functionality further with x-callback-url support:

- Return data to calling app
- Chain multiple actions
- Better error handling
- macOS/iOS Shortcuts app integration

---

## 3. GitHub Actions Automation

### Why GitHub Actions for Obsidian?

If your vault is in a Git repository, GitHub Actions can automate:
- Markdown linting
- Link validation
- Static site publishing
- Backup verification
- Daily note generation

### Markdown Linting Workflow

**.github/workflows/lint.yml:**
```yaml
name: Lint Markdown

on:
  push:
    paths:
      - '**.md'
  pull_request:
    paths:
      - '**.md'

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Lint Markdown
        uses: DavidAnson/markdownlint-cli2-action@v17
        with:
          config: '.markdownlint.json'
          globs: '**/*.md'
```

**.markdownlint.json (Obsidian-friendly):**
```json
{
  "MD013": false,
  "MD033": false,
  "MD041": false,
  "MD024": { "allow_different_nesting": true },
  "MD036": false
}
```

### Static Site Publishing (Quartz)

```yaml
name: Deploy Quartz

on:
  push:
    branches: [main]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Build Quartz
        run: |
          npx quartz build

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

### Daily Backup Workflow

```yaml
name: Daily Vault Backup

on:
  schedule:
    - cron: '0 6 * * *'  # 6 AM UTC daily

jobs:
  backup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Create backup tag
        run: |
          DATE=$(date +%Y-%m-%d)
          git tag "backup-$DATE"
          git push origin "backup-$DATE"

      - name: Create release
        uses: softprops/action-gh-release@v2
        with:
          tag_name: backup-${{ github.run_id }}
          name: Vault Backup ${{ github.event.repository.updated_at }}
          generate_release_notes: true
```

### Link Validation

```yaml
name: Check Links

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly

jobs:
  check-links:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Check internal links
        run: |
          pip install markdown-link-check
          find . -name "*.md" -exec markdown-link-check {} \;
```

### Image Optimization

```yaml
name: Optimize Images

on:
  push:
    paths:
      - '**.png'
      - '**.jpg'
      - '**.jpeg'

jobs:
  optimize:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Optimize Images
        uses: calibreapp/image-actions@main
        with:
          githubToken: ${{ secrets.GITHUB_TOKEN }}
          compressOnly: true
```

---

## 4. Templater + DataviewJS Automation

### Templater

[Templater](https://github.com/SilentVoid13/Templater) enables dynamic templates with JavaScript execution.

#### Basic Syntax

```markdown
<%* // JavaScript execution block %>
<%= variable %> // Output expression
<%+ await tp.file.creation_date() %> // Async expression
```

#### Useful Template Functions

**File Operations:**
```javascript
<%*
// Create file from template
await tp.file.create_new(tp.file.find_tfile("Template"), "New Note", false)

// Move file
await tp.file.move("/new/path/" + tp.file.title)

// Rename file
await tp.file.rename("new-name")
%>
```

**Date Functions:**
```javascript
<% tp.date.now("YYYY-MM-DD") %>
<% tp.date.now("YYYY-MM-DD", 7) %> // 7 days from now
<% tp.date.weekday("dddd", 0) %> // Current weekday name
```

**User Input:**
```javascript
<%*
const title = await tp.system.prompt("Enter title:")
const type = await tp.system.suggester(
  ["Project", "Area", "Resource"],
  ["project", "area", "resource"]
)
%>
```

**Cursor Positioning:**
```markdown
# <% tp.file.title %>

<% tp.file.cursor() %>
```

#### Automation Triggers

**On File Creation:**
```javascript
// In template settings, enable "Trigger on file creation"
// Template runs automatically when new file created in folder
```

**On File Open:**
```javascript
// hooks/on-open.js
module.exports = async (tp) => {
  // Check if daily note needs updating
  const today = tp.date.now("YYYY-MM-DD")
  // Add automation logic
}
```

### DataviewJS

[Dataview](https://github.com/blacksmithgu/obsidian-dataview) enables SQL-like queries and JavaScript for dynamic content.

#### Query Examples

**List active projects:**
```dataview
TABLE status, deadline
FROM "1-Projects"
WHERE status = "active"
SORT deadline ASC
```

**Task aggregation:**
```dataview
TASK
FROM "Daily"
WHERE !completed
GROUP BY file.link
```

#### DataviewJS Examples

**Dynamic Dashboard:**
```dataviewjs
const projects = dv.pages('"1-Projects"')
  .where(p => p.status === "active")
  .sort(p => p.priority, 'asc')

dv.header(2, "Active Projects")
dv.table(
  ["Project", "Status", "Deadline", "Priority"],
  projects.map(p => [
    p.file.link,
    p.status,
    p.deadline,
    p.priority
  ])
)
```

**Inbox Counter:**
```dataviewjs
const inbox = dv.pages('"0-Inbox"').length
dv.paragraph(`📥 **Inbox:** ${inbox} items`)
```

**Weekly Review Generator:**
```dataviewjs
const lastWeek = dv.date("today") - dv.duration("7 days")
const completed = dv.pages()
  .where(p => p.completed && p.completed >= lastWeek)

dv.header(2, "Completed This Week")
dv.list(completed.map(p => p.file.link))
```

---

## 5. External Tool Integration

### Zapier

**Obsidian Integration Method:** Webhooks + Local REST API

**Example Zap: Email to Obsidian**
1. Trigger: New email in Gmail
2. Action: Webhooks by Zapier → POST
3. URL: Your exposed REST API endpoint
4. Body: Formatted markdown content

**Limitation:** Requires exposing REST API (security concern)

### Make (Integromat)

Similar to Zapier but with more complex scenario building.

**Example Scenario:**
1. Watch RSS feed
2. Filter by keywords
3. Format as markdown
4. POST to Obsidian REST API

### n8n (Self-Hosted)

Open-source automation platform you can self-host.

**Advantages:**
- No data leaves your network
- Unlimited executions
- Full control

**Example Workflow:**
```json
{
  "nodes": [
    {
      "name": "Schedule",
      "type": "n8n-nodes-base.scheduleTrigger",
      "parameters": { "rule": { "interval": [{ "field": "hours", "hoursInterval": 1 }] } }
    },
    {
      "name": "HTTP Request",
      "type": "n8n-nodes-base.httpRequest",
      "parameters": {
        "url": "https://127.0.0.1:27123/vault/Daily/",
        "authentication": "headerAuth",
        "headerAuth": { "key": "Authorization", "value": "Bearer API_KEY" }
      }
    }
  ]
}
```

### Home Assistant

**Use Cases:**
- Log sensor data to daily note
- Trigger automations from note content
- Voice-controlled note creation

**Example Automation:**
```yaml
automation:
  - alias: "Log Temperature to Obsidian"
    trigger:
      - platform: time
        at: "22:00:00"
    action:
      - service: rest_command.obsidian_append
        data:
          content: "Temperature: {{ states('sensor.temperature') }}°C"
```

---

## 6. AI Integration

### Smart Connections Plugin

[Smart Connections](https://github.com/brianpetro/obsidian-smart-connections) provides semantic search and AI chat with your vault.

**Features:**
- Embedding-based similarity search
- Chat with vault context
- Related note suggestions
- Local and API models supported

**Configuration:**
1. Install plugin
2. Choose embedding model (OpenAI, local)
3. Generate embeddings (one-time)
4. Configure chat model

### Obsidian Copilot

[Copilot](https://github.com/logancyang/obsidian-copilot) brings ChatGPT-style interface to Obsidian.

**Features:**
- Chat interface
- RAG on vault
- Multiple model support (OpenAI, Claude, Ollama)
- Context-aware responses

**Setup:**
1. Install plugin
2. Add API key (OpenAI, Anthropic, etc.)
3. Configure RAG settings
4. Start chatting

### Claude Integration via MCP

**Model Context Protocol (MCP)** enables Claude to interact with Obsidian:

1. Install MCP server for Obsidian
2. Configure Claude Desktop
3. Claude can now read/write notes

---

## 7. Mobile Automation

### iOS Shortcuts (Detailed)

#### Workflow 1: Quick Capture

```
Shortcut: "Capture to Obsidian"

1. Show Alert "What's on your mind?"
2. Get Text from Input
3. Set Variable "Capture" to Input
4. URL Encode "Capture"
5. Open URL:
   obsidian://adv-uri?vault=MyVault&filepath=0-Inbox/[Date].md&data=[Encoded]&mode=append
```

#### Workflow 2: Voice Memo to Daily Note

```
Shortcut: "Voice to Daily"

1. Dictate Text
2. Set Variable "Speech" to Dictated Text
3. Get Current Date
4. Format Date as "HH:mm"
5. Set Variable "Time" to Formatted Date
6. Combine: "- [Time] [Speech]"
7. URL Encode Combined
8. Open URL:
   obsidian://adv-uri?vault=MyVault&daily=true&data=[Encoded]&mode=append
```

#### Workflow 3: Share Sheet Handler

```
Shortcut: "Send to Obsidian" (accepts Text, URLs)

1. Receive Input from Share Sheet
2. If Input is URL:
   a. Get Title of Web Page
   b. Format as "- [Title](URL)"
3. Else:
   a. Use Input as-is
4. URL Encode
5. Append to Inbox
```

### Android Tasker (Detailed)

#### Task: Quick Add to Inbox

```
Task: Add to Inbox

A1: Variable Set [Name: %content, To: %CLIP]
A2: Browse URL [
    URL: obsidian://adv-uri?vault=MyVault&filepath=0-Inbox/quick.md&data=%content&mode=append
]
```

#### Task: Voice Capture

```
Task: Voice to Obsidian

A1: Get Voice [Title: "Speak your note"]
A2: Variable Set [Name: %note, To: %VOICE]
A3: Variable Set [Name: %date, To: %DATE]
A4: Variable Set [Name: %time, To: %TIME]
A5: Browse URL [
    URL: obsidian://adv-uri?vault=MyVault&daily=true&data=-%20%time%20%note&mode=append
]
```

#### Profile: Location-Based Logging

```
Profile: At Work
Context: Location (Office)
Entry Task: Log arrival
Exit Task: Log departure

Log Task:
A1: Browse URL [obsidian://adv-uri?vault=MyVault&daily=true&data=📍%20Arrived%20at%20work&mode=append]
```

---

## 8. Sync-Specific Automation

### Pre/Post Sync Hooks

#### Obsidian Git Hooks

`.obsidian/plugins/obsidian-git/` settings allow pre-commit hooks:

**pre-commit hook example:**
```bash
#!/bin/bash
# Validate frontmatter
for file in $(git diff --cached --name-only | grep '.md$'); do
    if ! head -1 "$file" | grep -q "^---$"; then
        echo "Error: $file missing frontmatter"
        exit 1
    fi
done
```

#### Backup Automation with rclone

**backup-vault.sh:**
```bash
#!/bin/bash
VAULT="/path/to/vault"
REMOTE="remote:obsidian-backup"
DATE=$(date +%Y-%m-%d)

# Sync to remote
rclone sync "$VAULT" "$REMOTE/current" --exclude ".obsidian/**"

# Create dated snapshot
rclone copy "$REMOTE/current" "$REMOTE/snapshots/$DATE"

# Keep only last 30 snapshots
rclone delete "$REMOTE/snapshots" --min-age 30d
```

**Cron schedule:**
```bash
0 */6 * * * /path/to/backup-vault.sh
```

### Conflict Notification

**For Obsidian Git - notify on conflict:**

```bash
#!/bin/bash
# post-merge hook

if git diff --name-only --diff-filter=U | grep -q .; then
    # Send notification
    curl -X POST "https://ntfy.sh/your-topic" \
        -d "Obsidian sync conflict detected!"
fi
```

### Automated Conflict Resolution

**resolve-conflicts.sh:**
```bash
#!/bin/bash
cd /path/to/vault

# List conflicts
CONFLICTS=$(git diff --name-only --diff-filter=U)

for file in $CONFLICTS; do
    # Create backup of both versions
    cp "$file" "${file}.local"
    git show :3:"$file" > "${file}.remote"

    # Keep local version (customize as needed)
    git checkout --ours "$file"
    git add "$file"
done

git commit -m "Auto-resolved conflicts (kept local)"
```

---

## 9. Sources

### Plugin Repositories
- [Local REST API](https://github.com/coddingtonbear/obsidian-local-rest-api)
- [Advanced URI](https://github.com/Vinzent03/obsidian-advanced-uri)
- [Actions URI](https://github.com/czottmann/obsidian-actions-uri)
- [Templater](https://github.com/SilentVoid13/Templater)
- [Dataview](https://github.com/blacksmithgu/obsidian-dataview)
- [Smart Connections](https://github.com/brianpetro/obsidian-smart-connections)
- [Obsidian Copilot](https://github.com/logancyang/obsidian-copilot)

### Documentation
- [Local REST API Docs](https://coddingtonbear.github.io/obsidian-local-rest-api/)
- [Advanced URI Docs](https://publish.obsidian.md/advanced-uri-doc)
- [Templater Docs](https://silentvoid13.github.io/Templater/)
- [Dataview Docs](https://blacksmithgu.github.io/obsidian-dataview/)

### Community Resources
- [iOS Shortcuts Forum Thread](https://forum.obsidian.md/t/using-advanced-uri-plugin-ios-shortcuts-voice-to-note/21818)
- [Android Shortcuts Guide](https://forum.obsidian.md/t/how-to-add-a-note-shortcut-to-the-homescreen-on-android/20889)
- [MacroDroid Tutorial](https://forum.obsidian.md/t/cool-useful-android-shortcuts-made-with-macrodroid-and-a-tutorial-on-using-uris-as-intents-on-android/26683)

### Plugin Statistics
- [ObsidianStats - Local REST API](https://www.obsidianstats.com/plugins/obsidian-local-rest-api)

---

*Research completed: 2025-12-25*
*Word count: ~4,000*
*Last verified: December 2025*
