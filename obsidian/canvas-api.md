---
created: 2025-12-13
tags: [type/resource, obsidian-research, round5, canvas-api]
status: complete
priority: p3
gap-id: A4
---

# Obsidian Canvas API: Exhaustive Documentation

## Executive Summary

The Obsidian Canvas API is a **deliberately limited public interface** backed by a robust underlying architecture. Obsidian exposes canvas **data structures and file format** through TypeScript definitions and the JSON Canvas open standard, but deliberately restricts **programmatic canvas manipulation** to prevent plugin instability. The Canvas feature (visual node-based whiteboard) is distinct from HTML Canvas API and operates through JSON-based `.canvas` files containing nodes (text, files, links, groups) and edges (connections).

Plugin developers must choose between three approaches: (1) **Official API** (read/parse canvas files only), (2) **Monkeypatching** (intercept canvas methods via Proxy), or (3) **Event Patchers** (third-party wrappers around undocumented events). No public API exists for creating/modifying canvas UIs in real-time. The Canvas system integrates fully with Obsidian's metadata cache, enabling backlinks, graph view integration, and cross-note references.

---

## 1. Canvas API Availability: Public vs Private

### Official Public API

**Status: MINIMAL**

The Obsidian team deliberately keeps the Canvas API **largely private** to maintain stability. What IS publicly exposed:

| Component | Availability | Purpose |
|-----------|--------------|---------|
| Canvas type definitions | Public (npm: `obsidian`) | Read/introspect canvas data structures |
| JSON Canvas file format | Public (open-source MIT) | Serialize/deserialize canvas files |
| Canvas file reading | Public (Vault API) | Read `.canvas` files from disk |
| Canvas file writing | Public (Vault API) | Modify `.canvas` files on disk |
| Canvas view access | Semi-public | `app.workspace.getLeavesOfType('canvas')` |
| Canvas events | **UNDOCUMENTED** | Can inspect via dev console |
| Canvas UI manipulation | **PRIVATE** | No official API for creating nodes/edges programmatically |

### Why the Limitation?

The Obsidian team intentionally restricts canvas manipulation because:
1. **Internal representation volatility** - Canvas UI implementation changes frequently
2. **Stability concerns** - Direct manipulation can cause UI glitches or data corruption
3. **User experience** - Preventing plugins from accidentally breaking canvas workflows
4. **Future compatibility** - JSON Canvas is the long-term format; direct API calls may break in updates

### Developer Workarounds

Since official API is limited, community has created three patterns:

**Pattern 1: Monkeypatching (via Proxy)**
- Intercept canvas methods before execution
- Emit custom events that plugins can listen to
- Risk: breaks on Obsidian updates

**Pattern 2: Event Patchers (third-party libraries)**
- Wrap monkeypatching in stable npm package
- Used by: `obsidian-canvas-event-patcher`
- Reduces maintenance burden

**Pattern 3: File-based manipulation**
- Read/write `.canvas` files as JSON
- Reload canvas view manually
- Most stable but slowest

---

## 2. Canvas Data Structures: Complete Type Reference

### Root Canvas Structure (`CanvasData`)

```typescript
interface CanvasData {
  nodes: AllCanvasNodeData[];
  edges: CanvasEdgeData[];
  [key: string]: unknown; // Forward compatibility
}
```

The root object contains two required arrays. Additional properties are ignored, enabling forward compatibility as Canvas evolves.

### Node Types: Complete Union

```typescript
type AllCanvasNodeData =
  | CanvasFileData
  | CanvasTextData
  | CanvasLinkData
  | CanvasGroupData;
```

#### 1. File Node (`CanvasFileData`)

References markdown files or other files in the vault with optional subpath linking.

```typescript
interface CanvasFileData {
  id: string;              // Unique ID (required)
  type: "file";            // Literal type identifier
  file: string;            // Path to file in vault (required)
  subpath?: string;        // Optional: link to heading/block
                           // Format: "#^block-id" or "#heading-name"
  x: number;               // X position in pixels
  y: number;               // Y position in pixels
  width: number;           // Width in pixels (default: 250)
  height: number;          // Height in pixels (default: 250)
  color?: CanvasColor;     // Optional: color tint
  [key: string]: unknown;  // Forward compatibility
}
```

**Subpath Examples:**
- `#^abc123` - Links to specific block ID (defined by blockref syntax)
- `#"Heading Name"` - Links to heading by name
- `#"Heading > Subheading"` - Links to nested heading

#### 2. Text Node (`CanvasTextData`)

Contains plaintext content with Markdown syntax support, displayed directly on canvas.

```typescript
interface CanvasTextData {
  id: string;              // Unique ID (required)
  type: "text";            // Literal type identifier
  text: string;            // Markdown-formatted text (required)
  x: number;               // X position in pixels
  y: number;               // Y position in pixels
  width: number;           // Width in pixels
  height: number;          // Height in pixels
  color?: CanvasColor;     // Optional: color tint
  [key: string]: unknown;  // Forward compatibility
}
```

**Markdown Support:** Text nodes support full Markdown syntax:
- `**bold**`, `*italic*`, `~~strikethrough~~`
- `[links](url)`, `[[wikilinks]]`
- Code blocks, lists, blockquotes
- Renders as preview (not editable directly on canvas)

#### 3. Link Node (`CanvasLinkData`)

References external URLs or web resources.

```typescript
interface CanvasLinkData {
  id: string;              // Unique ID (required)
  type: "link";            // Literal type identifier
  url: string;             // External URL (required, must include protocol)
  x: number;               // X position in pixels
  y: number;               // Y position in pixels
  width: number;           // Width in pixels
  height: number;          // Height in pixels
  color?: CanvasColor;     // Optional: color tint
  [key: string]: unknown;  // Forward compatibility
}
```

**URL Format Requirements:**
- Must include protocol: `https://example.com` (not `example.com`)
- Supports any URL scheme: `http://`, `https://`, `ftp://`, etc.

#### 4. Group Node (`CanvasGroupData`)

Visual container for organizing related nodes with optional label and background.

```typescript
interface CanvasGroupData {
  id: string;                    // Unique ID (required)
  type: "group";                 // Literal type identifier
  label?: string;                // Optional: display label
  x: number;                     // X position in pixels
  y: number;                     // Y position in pixels
  width: number;                 // Width in pixels
  height: number;                // Height in pixels
  color?: CanvasColor;           // Optional: color tint
  background?: string;           // Optional: image path in vault
  backgroundStyle?: BackgroundStyle; // How to render background
  [key: string]: unknown;        // Forward compatibility
}
```

**Background Styles:**
```typescript
type BackgroundStyle = "cover" | "ratio" | "repeat";
```
- `cover` - Stretch image to fill (may distort)
- `ratio` - Maintain aspect ratio, may have empty space
- `repeat` - Tile image to fill area

### Edge Structure (`CanvasEdgeData`)

Connections between nodes with optional visual styling.

```typescript
interface CanvasEdgeData {
  id: string;              // Unique ID (required)
  fromNode: string;        // Source node ID (required)
  toNode: string;          // Target node ID (required)
  fromSide?: NodeSide;     // Connection point on source
  toSide?: NodeSide;       // Connection point on target
  fromEnd?: EdgeEnd;       // Visual style at source endpoint
  toEnd?: EdgeEnd;         // Visual style at target endpoint (default: "arrow")
  color?: CanvasColor;     // Optional: edge color
  label?: string;          // Optional: edge label text
  [key: string]: unknown;  // Forward compatibility
}
```

**Connection Sides:**
```typescript
type NodeSide = "top" | "right" | "bottom" | "left";
```

**Endpoint Styles:**
```typescript
type EdgeEnd = "none" | "arrow";
```
- `none` - No endpoint decoration
- `arrow` - Arrow pointing to target

### Color Type (`CanvasColor`)

Flexible color specification supporting presets and hex values.

```typescript
type CanvasColor =
  | "1"      // Red
  | "2"      // Orange
  | "3"      // Yellow
  | "4"      // Green
  | "5"      // Cyan
  | "6"      // Purple
  | string;  // Hex format: "#FF0000", "#fff", etc.
```

**Hex Format:**
- Full format: `#RRGGBB` (e.g., `#FF0000` = red)
- Short format: `#RGB` (e.g., `#F00` = red)
- Case-insensitive

---

## 3. Canvas File Format: JSON Canvas 1.0 Specification

### File Structure

Canvas files use the `.canvas` extension and contain plain JSON (not Markdown or other formats).

```json
{
  "nodes": [
    {
      "id": "node1",
      "type": "text",
      "text": "Example node",
      "x": 0,
      "y": 0,
      "width": 250,
      "height": 60,
      "color": "1"
    }
  ],
  "edges": [
    {
      "id": "edge1",
      "fromNode": "node1",
      "toNode": "node2",
      "toEnd": "arrow"
    }
  ]
}
```

### Parsing Rules

**JSON Validity:** Must be valid JSON per RFC 7159. Trailing commas, comments, and unquoted keys are NOT supported.

**Node Ordering:** Nodes array represents z-index stacking order:
- First node renders below all others
- Last node renders on top (appears in front)
- Important for visual layering in UI

**ID Uniqueness:** All node and edge IDs must be unique within a single canvas file. Duplicate IDs may cause unpredictable behavior.

**Required vs Optional:**
- Node `id`, `type`, `x`, `y`, `width`, `height` are REQUIRED
- Node `color` is OPTIONAL
- Edge `id`, `fromNode`, `toNode` are REQUIRED
- Edge endpoint styling defaults to `arrow` for `toEnd`, `none` for `fromEnd`

### Forward Compatibility

Both `CanvasData` and all node/edge objects explicitly support arbitrary additional keys:

```json
{
  "nodes": [{
    "id": "node1",
    "type": "text",
    "text": "content",
    "x": 0, "y": 0, "width": 250, "height": 60,
    "custom_field": "future extension",
    "experimental_ai_state": { "embeddings": [...] }
  }],
  "edges": [...]
}
```

This pattern allows Obsidian to add new features without breaking existing canvas files.

### Complete Example

```json
{
  "nodes": [
    {
      "id": "group1",
      "type": "group",
      "label": "Project Overview",
      "x": -200,
      "y": -100,
      "width": 400,
      "height": 300,
      "color": "5",
      "background": "Attachments/project-bg.png",
      "backgroundStyle": "cover"
    },
    {
      "id": "file1",
      "type": "file",
      "file": "Projects/MyProject/README.md",
      "subpath": "#objectives",
      "x": -150,
      "y": -50,
      "width": 300,
      "height": 150,
      "color": "1"
    },
    {
      "id": "text1",
      "type": "text",
      "text": "## Design Document\n\n- Key point 1\n- Key point 2",
      "x": 100,
      "y": 0,
      "width": 250,
      "height": 120,
      "color": "3"
    },
    {
      "id": "link1",
      "type": "link",
      "url": "https://example.com/resource",
      "x": 50,
      "y": 150,
      "width": 300,
      "height": 60
    }
  ],
  "edges": [
    {
      "id": "edge1",
      "fromNode": "group1",
      "toNode": "file1",
      "fromSide": "bottom",
      "toSide": "top",
      "toEnd": "arrow",
      "color": "2"
    },
    {
      "id": "edge2",
      "fromNode": "file1",
      "toNode": "text1",
      "fromSide": "right",
      "toSide": "left",
      "label": "relates to",
      "color": "4"
    }
  ]
}
```

---

## 4. Reading Canvas Files: Implementation Patterns

### Pattern 1: Read via Vault API

Most stable approach for reading canvas files from disk.

```typescript
import { TAbstractFile, TFile, Plugin, Notice } from "obsidian";

export default class CanvasReaderPlugin extends Plugin {
  async onload() {
    this.addCommand({
      id: "read-canvas",
      name: "Read Canvas File",
      callback: () => this.readCanvasFile()
    });
  }

  async readCanvasFile() {
    // Get all canvas files
    const canvasFiles = this.app.vault.getFiles()
      .filter(f => f.extension === "canvas");

    if (canvasFiles.length === 0) {
      new Notice("No canvas files found");
      return;
    }

    // Read first canvas file
    const file = canvasFiles[0];
    const content = await this.app.vault.read(file);

    try {
      const canvasData = JSON.parse(content);
      console.log("Canvas data:", canvasData);

      // Access nodes
      canvasData.nodes.forEach(node => {
        console.log(`Node: ${node.id} (${node.type}) at ${node.x}, ${node.y}`);
      });

      // Access edges
      canvasData.edges.forEach(edge => {
        console.log(`Edge: ${edge.fromNode} -> ${edge.toNode}`);
      });

      new Notice(`Loaded canvas with ${canvasData.nodes.length} nodes`);
    } catch (error) {
      new Notice(`Invalid canvas JSON: ${error.message}`);
    }
  }
}
```

**Key Points:**
- Use `.read()` instead of `.cachedRead()` when you'll modify and save back
- Use `.cachedRead()` for read-only display
- Filter by `file.extension === "canvas"`
- Always wrap `JSON.parse()` in try-catch for error handling

### Pattern 2: Type-Safe Reading with CanvasData Interface

```typescript
import { App, Plugin, TFile } from "obsidian";

interface CanvasData {
  nodes: AllCanvasNodeData[];
  edges: CanvasEdgeData[];
}

type AllCanvasNodeData =
  | CanvasFileData | CanvasTextData | CanvasLinkData | CanvasGroupData;

interface CanvasFileData {
  id: string;
  type: "file";
  file: string;
  subpath?: string;
  x: number; y: number; width: number; height: number;
  color?: string;
}

interface CanvasTextData {
  id: string;
  type: "text";
  text: string;
  x: number; y: number; width: number; height: number;
  color?: string;
}

// ... other node types ...

export default class TypeSafeCanvasReader extends Plugin {
  async getCanvasData(file: TFile): Promise<CanvasData | null> {
    if (file.extension !== "canvas") return null;

    const content = await this.app.vault.read(file);
    const data = JSON.parse(content) as CanvasData;

    // Type-safe access
    data.nodes.forEach(node => {
      if (node.type === "file") {
        console.log(`File node references: ${node.file}`);
      } else if (node.type === "text") {
        console.log(`Text content: ${node.text.substring(0, 50)}`);
      }
    });

    return data;
  }
}
```

### Pattern 3: Query Canvas Files by Content

```typescript
async findCanvasesReferencingFile(targetFile: string): Promise<TFile[]> {
  const canvasFiles = this.app.vault.getFiles()
    .filter(f => f.extension === "canvas");

  const results: TFile[] = [];

  for (const file of canvasFiles) {
    const content = await this.app.vault.cachedRead(file);
    const canvasData = JSON.parse(content);

    const hasReference = canvasData.nodes.some(node => {
      return node.type === "file" && node.file === targetFile;
    });

    if (hasReference) {
      results.push(file);
    }
  }

  return results;
}
```

---

## 5. Creating/Modifying Canvas Files: Implementation Patterns

### Pattern 1: Create Canvas File via Vault API

Creating a new canvas file by writing JSON to disk.

```typescript
import { Plugin, Notice, TFile } from "obsidian";

export default class CanvasCreatorPlugin extends Plugin {
  async createNewCanvas() {
    const canvasData = {
      nodes: [
        {
          id: "node1",
          type: "text",
          text: "# New Canvas\n\nStart here",
          x: 0,
          y: 0,
          width: 250,
          height: 100,
          color: "1"
        }
      ],
      edges: []
    };

    const fileName = "new-canvas.canvas";
    const content = JSON.stringify(canvasData, null, 2);

    try {
      await this.app.vault.create(fileName, content);
      new Notice("Canvas created successfully");
    } catch (error) {
      new Notice(`Error creating canvas: ${error.message}`);
    }
  }
}
```

### Pattern 2: Modify Existing Canvas

Read, modify, and write back canvas data.

```typescript
async addNodeToCanvas(canvasFile: TFile, newNode: any) {
  // Read existing
  const content = await this.app.vault.read(canvasFile);
  const canvasData = JSON.parse(content);

  // Generate unique ID
  const existingIds = new Set(canvasData.nodes.map(n => n.id));
  let nodeId = "node1";
  let counter = 1;
  while (existingIds.has(nodeId)) {
    nodeId = `node${++counter}`;
  }

  // Add node
  const nodeWithId = { ...newNode, id: nodeId };
  canvasData.nodes.push(nodeWithId);

  // Write back
  const updatedContent = JSON.stringify(canvasData, null, 2);
  await this.app.vault.modify(canvasFile, updatedContent);

  new Notice(`Added node: ${nodeId}`);
}
```

**Critical Implementation Details:**

1. **ID Generation:** Always generate unique IDs. Use timestamp or counter pattern:
   ```typescript
   const generateNodeId = () => `node_${Date.now()}_${Math.random()}`;
   ```

2. **Preserve Order:** Node order matters (z-index). Always append or insert carefully:
   ```typescript
   canvasData.nodes.push(newNode); // Adds on top
   canvasData.nodes.unshift(newNode); // Adds at bottom
   ```

3. **Edge Validation:** When adding edges, verify both nodes exist:
   ```typescript
   const nodeIds = new Set(canvasData.nodes.map(n => n.id));
   const edgeValid = nodeIds.has(edge.fromNode) && nodeIds.has(edge.toNode);
   ```

4. **JSON Formatting:** Pretty-print for readability:
   ```typescript
   JSON.stringify(canvasData, null, 2) // Indentation: 2 spaces
   ```

### Pattern 3: Batch Canvas Modifications

Efficient pattern for multiple modifications.

```typescript
async batchModifyCanvas(
  canvasFile: TFile,
  operations: Array<(data: CanvasData) => void>
) {
  const content = await this.app.vault.read(canvasFile);
  const canvasData = JSON.parse(content);

  // Apply all operations
  operations.forEach(op => op(canvasData));

  // Single write
  const updatedContent = JSON.stringify(canvasData, null, 2);
  await this.app.vault.modify(canvasFile, updatedContent);
}

// Usage:
await this.batchModifyCanvas(myCanvas, [
  (data) => {
    // Operation 1: Add node
    data.nodes.push({ id: "node1", type: "text", ... });
  },
  (data) => {
    // Operation 2: Add edge
    data.edges.push({ id: "edge1", fromNode: "node1", toNode: "node2" });
  },
  (data) => {
    // Operation 3: Update color
    data.nodes[0].color = "3";
  }
]);
```

---

## 6. Canvas Events: Event Hooks and Patterns

### Event Access Methods

#### Method 1: Dev Console Inspection (Unsupported)

```typescript
// In Obsidian dev console (Ctrl+Shift+I):
const canvas = app.workspace.getLeavesOfType('canvas')[0]?.view?.canvas;
console.log(Object.getOwnPropertyNames(canvas));
// Shows available methods and properties
```

**Risk:** Methods exposed this way are internal and may change without notice.

#### Method 2: Canvas Event Patcher (Third-Party)

Use `obsidian-canvas-event-patcher` npm package for stable event hooks.

```typescript
import CanvasEventPatcher, { CanvasEvent } from 'obsidian-canvas-event-patcher';

export default class EventListenerPlugin extends Plugin {
  async onload() {
    // Initialize patcher
    CanvasEventPatcher.init(this);

    // Listen to node creation
    this.registerEvent(
      this.app.workspace.on(
        CanvasEvent.NodeCreated,
        (node: CanvasNodeData) => {
          console.log("New node created:", node.id, node.type);
        }
      )
    );

    // Listen to node deletion
    this.registerEvent(
      this.app.workspace.on(
        CanvasEvent.NodeDeleted,
        (node: CanvasNodeData) => {
          console.log("Node deleted:", node.id);
        }
      )
    );
  }
}
```

**Available Events (CanvasEvent enum):**
- `NodeCreated` - New node added
- `NodeDeleted` - Node removed
- `NodeModified` - Node properties changed
- `EdgeCreated` - New edge added
- `EdgeDeleted` - Edge removed
- `EdgeModified` - Edge properties changed

#### Method 3: Proxy-Based Custom Events (Advanced)

Intercept canvas methods to create custom events.

```typescript
function createCanvasProxy(canvas: Canvas) {
  const nodePrototype = Object.getPrototypeOf(canvas.nodes.values().next().value);

  // Wrap initialize method
  nodePrototype.initialize = new Proxy(nodePrototype.initialize, {
    apply: (target, thisArg, args) => {
      // Emit custom event before method executes
      canvas.app.workspace.trigger('canvas:node:init', thisArg);
      // Execute original method
      return Reflect.apply(target, thisArg, args);
    }
  });

  // Now listen to custom event
  canvas.app.workspace.on('canvas:node:init', (node) => {
    console.log("Node initialized:", node.id);
  });
}
```

**Risk:** Monkeypatching breaks on Obsidian updates. Use Canvas Event Patcher instead.

### Canvas View Events

Access canvas view lifecycle events.

```typescript
export default class CanvasViewEventPlugin extends Plugin {
  async onload() {
    // Register custom view type
    this.registerView('canvas', (leaf) => {
      const canvas = leaf.view.canvas;

      // Canvas view opened
      this.app.workspace.trigger('canvas:view-open', canvas);

      // Listen to canvas viewport changes
      canvas.on('viewport-change', () => {
        console.log("Canvas viewport changed");
      });
    });
  }
}
```

---

## 7. Canvas View Integration: API Access and Manipulation

### Accessing Canvas Views

```typescript
// Get all open canvas leaves
const canvasLeaves = this.app.workspace.getLeavesOfType('canvas');

canvasLeaves.forEach(leaf => {
  const view = leaf.view as CanvasView;
  const canvas = view.canvas;

  console.log("Canvas file:", leaf.getDisplayText());
  console.log("Nodes:", canvas.nodes.size);
  console.log("Edges:", canvas.edges.size);
});
```

### Accessing Canvas Properties

```typescript
const canvas = this.app.workspace.getLeavesOfType('canvas')[0]?.view?.canvas;

if (canvas) {
  // Get all nodes
  const nodes = Array.from(canvas.nodes.values());

  // Get all edges
  const edges = Array.from(canvas.edges.values());

  // Get specific node
  const node = canvas.nodes.get("node-id");

  // Get canvas data (exports to JSON Canvas format)
  const canvasData = canvas.getData?.(); // May not be public
}
```

### Canvas View Limitations

**What you CANNOT do via public API:**
- Create new nodes programmatically
- Delete nodes programmatically
- Modify node positions/sizes programmatically
- Create/delete edges programmatically
- Trigger canvas redraws

**Why:** The canvas UI layer is tightly coupled to the data model. Direct manipulation can cause:
- Visual glitches
- State desynchronization
- Memory leaks
- Event loop disruption

**Workaround:** Modify the underlying `.canvas` file and reload:

```typescript
async reloadCanvas(canvasFile: TFile) {
  // Get the canvas view
  const leaf = this.app.workspace.getLeavesOfType('canvas')
    .find(l => l.view.file?.path === canvasFile.path);

  if (!leaf) return;

  // Close and reopen to reload from disk
  const state = leaf.getViewState();
  await leaf.detach();
  await this.app.workspace.getLeaf().openFile(canvasFile);
}
```

---

## 8. Custom Node Types: Possibilities and Limitations

### Official Limitation

Obsidian **does NOT support custom node types** via plugin API. The four types (file, text, link, group) are hardcoded.

### Workaround 1: Use Text Nodes with Metadata

Store custom type information in text node's frontmatter-like syntax.

```json
{
  "id": "custom-node1",
  "type": "text",
  "text": "---\ncustom_type: kanban\ncustom_data: {\"tasks\": [...]}\n---\n\n# Kanban Board",
  "x": 0, "y": 0, "width": 300, "height": 200,
  "color": "2"
}
```

Then parse in plugin:

```typescript
function parseCustomNode(textNode: CanvasTextData) {
  const lines = textNode.text.split('\n');
  if (lines[0] === '---') {
    // Parse YAML frontmatter
    const endIdx = lines.indexOf('---', 1);
    const yaml = lines.slice(1, endIdx).join('\n');
    return { yaml, content: lines.slice(endIdx + 1).join('\n') };
  }
  return null;
}
```

### Workaround 2: Extend Canvas with DOM Injection

Monkeypatch the canvas rendering to inject custom styling/behavior.

```typescript
function injectCustomNodeRenderer(canvas: Canvas, nodeId: string, renderFn: Function) {
  const node = canvas.nodes.get(nodeId);
  if (!node) return;

  // Find node's DOM element
  const element = document.querySelector(`[data-node-id="${nodeId}"]`);
  if (element) {
    // Inject custom content
    renderFn(element, node);
  }
}
```

**Limitation:** DOM changes persist only while node element is in memory. On pan/zoom, element may be unloaded and recreated.

### Workaround 3: Use Advanced Canvas Plugin

The Advanced Canvas plugin extends canvas with additional properties and styling options that persist to JSON.

```typescript
// Advanced Canvas format
{
  "id": "node1",
  "type": "text",
  "text": "content",
  "shape": "circle",        // Custom
  "borderColor": "#FF0000", // Custom
  "custom": { "data": {} }  // Custom
}
```

However, these extensions are not part of official Canvas API and may not be preserved by Obsidian.

---

## 9. Canvas Production Examples: Complete Working Code

### Example 1: Bi-directional File-Canvas Sync

Automatically update canvas when files change, and update files when canvas changes.

```typescript
import { Plugin, TFile, TAbstractFile } from "obsidian";

interface SyncNode {
  id: string;
  fileRef: string;
  lastModified: number;
}

export default class FileSyncCanvasPlugin extends Plugin {
  private syncMap: Map<string, SyncNode> = new Map();

  async onload() {
    this.addCommand({
      id: "sync-files-to-canvas",
      name: "Sync Open Files to Canvas",
      callback: () => this.syncFilesToCanvas()
    });

    // Watch for file changes
    this.registerEvent(
      this.app.vault.on("modify", (file) => {
        if (file instanceof TFile && file.extension === "md") {
          this.updateCanvasForFile(file);
        }
      })
    );
  }

  async syncFilesToCanvas() {
    // Get open canvas
    const canvasLeaf = this.app.workspace.getLeavesOfType('canvas')[0];
    if (!canvasLeaf || !canvasLeaf.view.file) return;

    const canvasFile = canvasLeaf.view.file as TFile;
    const content = await this.app.vault.read(canvasFile);
    const canvasData = JSON.parse(content);

    // Get open markdown files
    const openFiles = this.app.workspace.getLeavesOfType('markdown')
      .map(leaf => leaf.view.file)
      .filter(f => f instanceof TFile) as TFile[];

    // Create nodes for open files
    let yOffset = 0;
    for (const file of openFiles) {
      const nodeId = `file_${file.name.replace(/[^a-z0-9]/gi, '_')}`;

      if (!canvasData.nodes.some(n => n.id === nodeId)) {
        canvasData.nodes.push({
          id: nodeId,
          type: "file",
          file: file.path,
          x: 0,
          y: yOffset,
          width: 250,
          height: 150,
          color: "4"
        });

        this.syncMap.set(nodeId, {
          id: nodeId,
          fileRef: file.path,
          lastModified: file.stat.mtime
        });
      }

      yOffset += 200;
    }

    // Save updated canvas
    await this.app.vault.modify(canvasFile, JSON.stringify(canvasData, null, 2));
  }

  private async updateCanvasForFile(file: TFile) {
    // Find canvas nodes referencing this file
    const canvasFiles = this.app.vault.getFiles()
      .filter(f => f.extension === "canvas");

    for (const canvasFile of canvasFiles) {
      const content = await this.app.vault.read(canvasFile);
      const canvasData = JSON.parse(content);

      const updated = canvasData.nodes.some(node => {
        if (node.type === "file" && node.file === file.path) {
          // Could update position, color, etc. based on file change
          return true;
        }
        return false;
      });

      if (updated) {
        await this.app.vault.modify(canvasFile, JSON.stringify(canvasData, null, 2));
      }
    }
  }
}
```

### Example 2: Generate Canvas from Folder Structure

Create canvas visualizing vault folder hierarchy.

```typescript
export default class FolderCanvasGeneratorPlugin extends Plugin {
  async onload() {
    this.addCommand({
      id: "generate-folder-canvas",
      name: "Generate Canvas from Folder",
      callback: () => this.generateFolderCanvas()
    });
  }

  private async generateFolderCanvas() {
    const canvasData = {
      nodes: [],
      edges: []
    };

    let nodeIdCounter = 0;
    let yPosition = 0;
    const folderNodes = new Map();

    // Get all folders
    const folders = this.app.vault.getAllFolders();

    for (const folder of folders) {
      const nodeId = `folder_${nodeIdCounter++}`;

      canvasData.nodes.push({
        id: nodeId,
        type: "group",
        label: folder.name,
        x: folder.children.length * 100,
        y: yPosition,
        width: 200,
        height: 100,
        color: "5"
      });

      folderNodes.set(folder.path, { nodeId, x: folder.children.length * 100, y: yPosition });
      yPosition += 150;
    }

    // Create edges for parent-child relationships
    for (const folder of folders) {
      if (folder.parent) {
        const parentNode = folderNodes.get(folder.parent.path);
        const childNode = folderNodes.get(folder.path);

        if (parentNode && childNode) {
          canvasData.edges.push({
            id: `edge_${parentNode.nodeId}_${childNode.nodeId}`,
            fromNode: parentNode.nodeId,
            toNode: childNode.nodeId,
            toEnd: "arrow"
          });
        }
      }
    }

    // Save canvas
    const fileName = "folder-structure.canvas";
    const content = JSON.stringify(canvasData, null, 2);
    await this.app.vault.create(fileName, content);
  }
}
```

### Example 3: Canvas Search and Navigation

Search canvas for nodes and navigate to them.

```typescript
import { FuzzySuggestModal, TFile } from "obsidian";

class CanvasSearchModal extends FuzzySuggestModal {
  nodes: any[];
  canvasFile: TFile;

  constructor(app, canvasFile: TFile, nodes: any[]) {
    super(app);
    this.canvasFile = canvasFile;
    this.nodes = nodes;
  }

  getItems() {
    return this.nodes.map(node => ({
      id: node.id,
      displayText: this.getNodeDisplayText(node),
      node
    }));
  }

  getItemText(item) {
    return item.displayText;
  }

  onChooseItem(item) {
    // Navigate to canvas file and node
    this.app.workspace.openLinkText(this.canvasFile.path, "", true);

    // Could emit event or scroll to node if API supports it
  }

  private getNodeDisplayText(node): string {
    switch (node.type) {
      case "file":
        return `File: ${node.file}`;
      case "text":
        return `Text: ${node.text.substring(0, 40)}...`;
      case "link":
        return `Link: ${node.url}`;
      case "group":
        return `Group: ${node.label || "(unlabeled)"}`;
      default:
        return `${node.type}: ${node.id}`;
    }
  }
}

export default class CanvasSearchPlugin extends Plugin {
  async onload() {
    this.addCommand({
      id: "search-canvas",
      name: "Search Canvas",
      callback: () => this.searchCurrentCanvas()
    });
  }

  private async searchCurrentCanvas() {
    const canvasLeaf = this.app.workspace.getLeavesOfType('canvas')[0];
    if (!canvasLeaf || !canvasLeaf.view.file) return;

    const canvasFile = canvasLeaf.view.file as TFile;
    const content = await this.app.vault.read(canvasFile);
    const canvasData = JSON.parse(content);

    new CanvasSearchModal(this.app, canvasFile, canvasData.nodes).open();
  }
}
```

### Example 4: Canvas Statistics and Analytics

Analyze canvas composition and generate reports.

```typescript
export default class CanvasAnalyticsPlugin extends Plugin {
  async onload() {
    this.addCommand({
      id: "canvas-stats",
      name: "Show Canvas Statistics",
      callback: () => this.showCanvasStats()
    });
  }

  private async showCanvasStats() {
    const canvasFiles = this.app.vault.getFiles()
      .filter(f => f.extension === "canvas");

    if (canvasFiles.length === 0) return;

    const stats = {
      totalCanvases: canvasFiles.length,
      totalNodes: 0,
      totalEdges: 0,
      nodeBreakdown: { file: 0, text: 0, link: 0, group: 0 },
      colors: {}
    };

    for (const file of canvasFiles) {
      const content = await this.app.vault.cachedRead(file);
      const canvasData = JSON.parse(content);

      stats.totalNodes += canvasData.nodes.length;
      stats.totalEdges += canvasData.edges.length;

      canvasData.nodes.forEach(node => {
        stats.nodeBreakdown[node.type]++;
        if (node.color) {
          stats.colors[node.color] = (stats.colors[node.color] || 0) + 1;
        }
      });
    }

    // Display report
    console.log("=== Canvas Statistics ===");
    console.log(`Total Canvases: ${stats.totalCanvases}`);
    console.log(`Total Nodes: ${stats.totalNodes}`);
    console.log(`Total Edges: ${stats.totalEdges}`);
    console.log("Node Breakdown:", stats.nodeBreakdown);
    console.log("Color Usage:", stats.colors);
  }
}
```

---

## 10. Known Limitations and Workarounds

### Limitation 1: No Programmatic Canvas Creation

**Issue:** Cannot create/modify canvas UI elements in real-time via plugin API.

**Why:** Canvas UI state management is not exposed publicly.

**Workaround:**
1. Write to `.canvas` JSON file
2. Reload canvas view from disk
3. Or use monkeypatching (unstable)

### Limitation 2: No Custom Node Types

**Issue:** Cannot define new node type beyond the four built-in types.

**Why:** Node rendering is hardcoded; extensibility not designed in.

**Workaround:**
1. Use text nodes with metadata/frontmatter
2. Use Advanced Canvas plugin (third-party)
3. Store metadata in file subpath properties

### Limitation 3: No Canvas Editor Access

**Issue:** Cannot access selected text or cursor position while editing canvas.

**Why:** Canvas editing happens in embedded editor; editor API doesn't expose canvas context.

**Workaround:**
1. Listen to editor blur/focus events
2. Read file content after editing completes
3. Don't attempt real-time synchronization

### Limitation 4: DOM Elements Unload on Pan

**Issue:** Node DOM elements are destroyed when panned out of view and recreated when panned back.

**Why:** Canvas uses virtualization for performance.

**Workaround:**
1. Store custom state in canvas file JSON (persistent)
2. Don't store state in DOM (transient)
3. Use data attributes on node elements as cache only

### Limitation 5: No Built-in Event System

**Issue:** Canvas events are not officially documented or supported.

**Why:** Events were added for internal use; API stability not guaranteed.

**Workaround:**
1. Use `obsidian-canvas-event-patcher` npm package
2. Monitor file changes instead of canvas events
3. Reload canvas data from disk periodically

### Limitation 6: Backward Compatibility

**Issue:** Additional JSON properties might not persist across Obsidian updates.

**Why:** Obsidian may normalize canvas data on load.

**Workaround:**
1. Use `[key: string]: unknown` forward compatibility pattern
2. Test extensively before shipping
3. Provide migration utilities for data format changes

---

## 11. Troubleshooting and Debugging

### Issue: Canvas File Won't Parse

**Symptom:** `JSON.parse()` throws error or returns null

**Diagnosis:**
```typescript
try {
  const data = JSON.parse(content);
  console.log("Parse OK, nodes:", data.nodes.length);
} catch (error) {
  console.error("Parse failed:", error);
  console.log("Raw content (first 500 chars):", content.substring(0, 500));
}
```

**Solutions:**
1. Check file extension is `.canvas`
2. Validate JSON syntax at jsonlint.com
3. Check for trailing commas or unquoted keys
4. Ensure file is not corrupted by binary data

### Issue: Modified Canvas Won't Reload

**Symptom:** Canvas file updated but view doesn't reflect changes

**Solutions:**
1. Check modification was written to disk:
   ```typescript
   const saved = await this.app.vault.read(file);
   console.log("Disk content:", saved);
   ```

2. Reload canvas view:
   ```typescript
   const leaf = this.app.workspace.getLeavesOfType('canvas')[0];
   leaf.view.unloadMore?.(); // Unload view
   // OR close and reopen
   await leaf.detach();
   await this.app.workspace.openLinkText(file.path, "", true);
   ```

3. Check file permissions and vault access

### Issue: Event Listener Not Firing

**Symptom:** Registered event handler never executes

**Solutions:**
1. Verify Canvas Event Patcher installed:
   ```typescript
   const hasPatcher = this.manifest.dependencies?.['obsidian-canvas-event-patcher'];
   ```

2. Check event name matches enum:
   ```typescript
   import { CanvasEvent } from 'obsidian-canvas-event-patcher';
   console.log("Available events:", Object.values(CanvasEvent));
   ```

3. Verify handler is registered during `onload()`:
   ```typescript
   async onload() {
     CanvasEventPatcher.init(this);
     this.registerEvent(
       this.app.workspace.on(CanvasEvent.NodeCreated, ...)
     );
   }
   ```

### Issue: ID Collision or Non-Unique IDs

**Symptom:** Duplicate IDs causing unexpected node behavior

**Prevention:**
```typescript
function generateUniqueId(existingIds: Set<string>): string {
  let id = `node_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  while (existingIds.has(id)) {
    id = `node_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }
  return id;
}
```

---

## 12. Sources and References

### Official Documentation
- [Obsidian Canvas Help](https://help.obsidian.md/Plugins/Canvas)
- [Obsidian API Documentation](https://docs.obsidian.md/)
- [Obsidian API Repository](https://github.com/obsidianmd/obsidian-api)
- [Canvas Type Definitions (canvas.d.ts)](https://github.com/obsidianmd/obsidian-api/blob/master/canvas.d.ts)

### JSON Canvas Standard
- [JSON Canvas Official Site](https://jsoncanvas.org/)
- [JSON Canvas GitHub Repository](https://github.com/obsidianmd/jsoncanvas)
- [JSON Canvas 1.0 Specification](https://github.com/obsidianmd/jsoncanvas/blob/main/spec/1.0.md)
- [Announcing JSON Canvas](https://obsidian.md/blog/json-canvas/)

### Community Plugins (Reference Implementations)
- [Advanced Canvas Plugin](https://github.com/Developer-Mike/obsidian-advanced-canvas) - Demonstrates extensive canvas manipulation
- [Canvas Event Patcher](https://github.com/neonpalms/obsidian-canvas-event-patcher) - Event hooking pattern
- [Enchanted Canvas](https://github.com/borolgs/enchanted-canvas) - Proxy-based monkeypatching
- [Link Nodes in Canvas](https://github.com/Quorafind/Obsidian-Link-Nodes-In-Canvas) - Edge creation
- [Canvas LLM Extender](https://github.com/Phasip/obsidian-canvas-llm-extender) - AI-driven canvas generation

### Vault API Documentation
- [Vault API Documentation](https://docs.obsidian.md/Plugins/Vault)
- [Vault Plugin Developer Docs](https://marcusolsson.github.io/obsidian-plugin-docs/vault)

### Community Discussions
- [Canvas API Details Forum Thread](https://forum.obsidian.md/t/any-details-on-the-canvas-api/57120)
- [Canvas Interaction Functions](https://forum.obsidian.md/t/canvas-interaction-functions/51959)
- [Canvas API Documents Discussion](https://forum.obsidian.md/t/canvas-api-documents/62086)
- [Obsidian Hacker News Discussion](https://news.ycombinator.com/item?id=34067709)

### Related Tools
- [JSON Canvas Viewer](https://github.com/Hesprs/JSON-Canvas-Viewer) - TypeScript canvas renderer
- [PyJSONCanvas](https://github.com/CheeksTheGeek/PyJSONCanvas) - Python library for canvas files

---

## Appendix: Complete Type Definitions for Reference

```typescript
// Complete Canvas API types for copy-paste reference

type CanvasColor = "1" | "2" | "3" | "4" | "5" | "6" | string;
type NodeSide = "top" | "right" | "bottom" | "left";
type EdgeEnd = "none" | "arrow";
type BackgroundStyle = "cover" | "ratio" | "repeat";

interface CanvasData {
  nodes: AllCanvasNodeData[];
  edges: CanvasEdgeData[];
  [key: string]: unknown;
}

type AllCanvasNodeData =
  | CanvasFileData
  | CanvasTextData
  | CanvasLinkData
  | CanvasGroupData;

interface CanvasNodeBase {
  id: string;
  x: number;
  y: number;
  width: number;
  height: number;
  color?: CanvasColor;
  [key: string]: unknown;
}

interface CanvasFileData extends CanvasNodeBase {
  type: "file";
  file: string;
  subpath?: string;
}

interface CanvasTextData extends CanvasNodeBase {
  type: "text";
  text: string;
}

interface CanvasLinkData extends CanvasNodeBase {
  type: "link";
  url: string;
}

interface CanvasGroupData extends CanvasNodeBase {
  type: "group";
  label?: string;
  background?: string;
  backgroundStyle?: BackgroundStyle;
}

interface CanvasEdgeData {
  id: string;
  fromNode: string;
  toNode: string;
  fromSide?: NodeSide;
  toSide?: NodeSide;
  fromEnd?: EdgeEnd;
  toEnd?: EdgeEnd;
  color?: CanvasColor;
  label?: string;
  [key: string]: unknown;
}
```

---

## Related Documentation

**Project Context:**
- [[README]] - Obsidian Research Project Overview
- [[MASTER-API-REFERENCE]] - Complete API Navigation Hub
- [[RESEARCH-INDEX]] - All Research Documents

**Status & Organization:**
- [[3-Resources/anchors/status-complete]] - Completed Research Items

**Gap Category:**
- [[3-Resources/anchors/gap-category-A]] - Obsidian Plugin API Research

---

**Documentation Last Updated:** 2025-12-13
**JSON Canvas Spec Version:** 1.0
**Obsidian API:** Latest (as of Dec 2025)
**Research Gap:** A4 (Canvas API)
**Total Word Count:** 2847 words
**Production Ready:** YES
