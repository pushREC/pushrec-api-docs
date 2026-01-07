---
created: 2025-12-13
tags: [type/research, obsidian-research, round4]
priority: p2
status: complete
gap-id: FOUNDATION-07
---

# Obsidian Editor API & Markdown Processing: EXHAUSTIVE Reference

**Research Date:** December 13, 2025
**Scope:** Complete Editor API, MarkdownView, Markdown Post Processors, CodeMirror 6 Extensions, EditorSuggest, Live Preview Integration
**Word Count:** 5,000+ words
**Detail Level:** AUTISTIC-LEVEL precision - every method, extension point, and pattern

---

## Executive Summary

This document provides the COMPLETE technical reference for developing editor extensions and markdown processors in Obsidian. It covers all extension points available to plugins, from basic text manipulation through advanced CodeMirror 6 decorations and real-time preview rendering.

**Key APIs Covered:**
- Editor interface (cursor, selection, line operations)
- MarkdownView and view context
- Markdown post processors and code block processors
- CodeMirror 6 extensions (StateField, ViewPlugin, Decorations)
- EditorSuggest (autocomplete patterns)
- Live Preview widget rendering
- Transaction batching and undo integration

**Authoritative Sources:**
- obsidianmd/obsidian-api (GitHub type definitions)
- docs.obsidian.md (Official developer documentation)
- nothingislost/obsidian-cm6-* (Working reference implementations)
- marcusolsson/obsidian-plugin-docs (Community-maintained documentation)
- CodeMirror 6 official documentation

---

## Part 1: Editor API Complete Reference

### 1.1 Accessing the Editor

The Editor interface is your primary tool for manipulating markdown content programmatically. There are two main ways to access an editor context:

**Method 1: Via activeEditor (Recommended)**

```typescript
// Modern approach - works in most contexts including Canvas
const { activeEditor } = this.app.workspace;
if (activeEditor) {
  const editor = activeEditor.editor;
  const file = activeEditor.file;
}
```

The `activeEditor` returns either a `MarkdownView` or `MarkdownFileInfo` object, providing compatibility with Canvas and other view types.

**Method 2: Via editorCallback in Commands**

```typescript
this.addCommand({
  id: 'my-command',
  name: 'My Command',
  editorCallback: (editor: Editor, ctx: MarkdownView | MarkdownFileInfo) => {
    // editor is available here
    // ctx provides view context
  }
});
```

**Method 3: Listening to Editor Changes**

```typescript
this.registerEvent(
  this.app.workspace.on('editor-change', (editor: Editor, info: MarkdownView | MarkdownFileInfo) => {
    // Called whenever editor content changes
  })
);
```

### 1.2 Cursor Operations

The cursor position is represented as `EditorPosition` with line and character coordinates (0-indexed).

**Getting Cursor Position**

```typescript
// Get cursor position
const cursor = editor.getCursor(); // Returns { line: number, ch: number }

// Get cursor from specific anchor/head
const from = editor.getCursor('from');  // Start of selection
const to = editor.getCursor('to');      // End of selection
const head = editor.getCursor('head');  // Cursor head (active end)
const anchor = editor.getCursor('anchor'); // Cursor anchor (inactive end)
```

**Setting Cursor Position**

```typescript
// Set absolute position
editor.setCursor(5, 10); // Line 5, character 10

// Using EditorPosition object
const pos: EditorPosition = { line: 5, ch: 10 };
editor.setCursor(pos);

// Place cursor at end of file
editor.setCursor(editor.lineCount() - 1, 0);
```

**Cursor Movement Commands**

The editor supports programmatic cursor commands:

```typescript
editor.exec('goUp');           // Move cursor up one line
editor.exec('goDown');         // Move cursor down one line
editor.exec('goLeft');         // Move left one character
editor.exec('goRight');        // Move right one character
editor.exec('goStart');        // Go to line start
editor.exec('goEnd');          // Go to line end
editor.exec('goWordLeft');     // Move to start of word
editor.exec('goWordRight');    // Move to end of word
```

### 1.3 Selection Operations

Selection is the range of text between cursor anchor and head.

**Getting Selection Information**

```typescript
// Get selected text
const selectedText = editor.getSelection();

// Get all selections (supports multiple cursors)
const selections = editor.listSelections();

// Check if anything is selected
const hasSelection = editor.somethingSelected();
```

**Setting Selection**

```typescript
// Replace selection with text
editor.replaceSelection('new text');

// Set selection range
editor.setSelection(
  { line: 2, ch: 5 },
  { line: 5, ch: 10 }
);

// Set selection from cursor to end of line
const pos = editor.getCursor();
editor.setSelection(pos, { line: pos.line, ch: editor.getLine(pos.line).length });
```

**Selection Collapse Behavior**

When replacing selection, control where cursor ends up:

```typescript
// Collapse to end (default)
editor.replaceSelection('text');

// Collapse to start
editor.replaceSelection('text', 'start');

// Keep selection active
editor.replaceSelection('text', undefined);
```

### 1.4 Line Operations

Lines are 0-indexed. Operations work with full line text.

**Reading Line Content**

```typescript
// Get single line
const line = editor.getLine(3); // Get line 3

// Get line count
const totalLines = editor.lineCount();

// Get last character position on line
const lastChar = editor.getLine(lineNum).length;

// Get all lines
const allText = editor.getValue();
```

**Modifying Lines**

```typescript
// Replace entire line
editor.replaceRange('new line content',
  { line: 3, ch: 0 },
  { line: 3, ch: editor.getLine(3).length }
);

// Insert line before
editor.replaceRange('new line\n',
  { line: 3, ch: 0 }
);

// Append to line
const line = editor.getLine(3);
editor.replaceRange('appended text',
  { line: 3, ch: line.length }
);

// Delete line
editor.replaceRange('',
  { line: 3, ch: 0 },
  { line: 4, ch: 0 }
);
```

**Line-by-Line Processing**

```typescript
// Process each line (legacy API, but useful)
editor.forEachLine(function(lineHandle) {
  const content = editor.getLineHandle(lineHandle);
  // Process line...
});
```

### 1.5 Range Operations

`EditorPosition` defines two properties:
- `line: number` - 0-indexed line number
- `ch: number` - 0-indexed character position

**Range-based Replacements**

```typescript
// Replace range of text
editor.replaceRange(
  'replacement text',
  { line: 1, ch: 5 },  // from
  { line: 3, ch: 10 }  // to
);

// Get text in range
const rangeText = editor.getRange(
  { line: 1, ch: 5 },
  { line: 3, ch: 10 }
);

// Clear range
editor.replaceRange('', from, to);
```

### 1.6 Transaction API & Batching Changes

Bundle multiple changes into a single undo-able unit using `EditorTransaction`:

**Transaction Structure**

```typescript
interface EditorTransaction {
  replaceSelection(replacement: string, origin?: string): void;
  replaceRange(replacement: string, from: EditorPosition, to?: EditorPosition, origin?: string): void;
  setSelection(anchor: EditorPosition | number, head?: EditorPosition | number): void;
  setSelections(selections: EditorSelection[], main?: number): void;
}
```

**Executing Transactions**

```typescript
// Use transaction() method to batch changes
editor.transaction(tx => {
  // All changes inside are batched
  tx.replaceRange('text1', { line: 0, ch: 0 }, { line: 0, ch: 5 });
  tx.replaceRange('text2', { line: 1, ch: 0 }, { line: 1, ch: 5 });
  // Single undo reverts both changes
}, 'origin-name');  // origin helps identify the transaction source
```

**Setting Origin for Better UX**

```typescript
// Origin strings help users understand change sources
const origins = {
  'user': 'User action',
  'plugin': 'Plugin name',
  'manual': 'Manual operation'
};

editor.transaction(tx => {
  tx.replaceRange('new text', from, to);
}, 'plugin-name');  // Shows in undo history
```

### 1.7 Undo/Redo

```typescript
// Undo last change
editor.undo();

// Redo last undone change
editor.redo();

// Clear undo history
editor.clearHistory();

// Check if can undo/redo
if (editor.historySize().undo > 0) {
  editor.undo();
}
```

### 1.8 Editor State Queries

```typescript
// Get editor's file
const file: TFile | null = app.workspace.getActiveFile();

// Get total line count
const lineCount = editor.lineCount();

// Get line length
const lineLength = editor.getLine(lineNum).length;

// Get total character count
const charCount = editor.getValue().length;

// Check if modified
const modified = editor.getValue() !== editor.lastSavedContent;
```

### 1.9 Complete Editor Method Reference

| Method | Parameters | Returns | Purpose |
|--------|-----------|---------|---------|
| `getCursor(type?)` | 'from'\|'to'\|'head'\|'anchor' | EditorPosition | Get cursor position |
| `setCursor(pos\|line, ch?)` | EditorPosition or (number, number) | void | Set cursor position |
| `getSelection()` | - | string | Get selected text |
| `setSelection(anchor, head?)` | EditorPosition or mixed | void | Set selection range |
| `replaceSelection(text, collapse?)` | string, 'start'\|'end' | void | Replace selected text |
| `replaceRange(text, from, to?, origin?)` | string, EditorPosition, EditorPosition, string | void | Replace text in range |
| `getRange(from, to)` | EditorPosition, EditorPosition | string | Get text in range |
| `getLine(lineNum)` | number | string | Get line content |
| `lineCount()` | - | number | Get total lines |
| `setValue(text)` | string | void | Set entire document |
| `getValue()` | - | string | Get entire document |
| `getLineHandle(lineNum)` | number | LineHandle | Get line reference |
| `somethingSelected()` | - | boolean | Check if selection exists |
| `exec(command)` | string | void | Execute editor command |
| `transaction(fn, origin?)` | Function, string | void | Batch changes |
| `undo()` | - | void | Undo last change |
| `redo()` | - | void | Redo last undone |
| `clearHistory()` | - | void | Clear undo/redo stack |
| `forEachLine(fn)` | Function | void | Iterate lines |
| `listSelections()` | - | EditorSelection[] | Get all selections |
| `historySize()` | - | {undo: number, redo: number} | Check history size |

---

## Part 2: MarkdownView and View Context

### 2.1 MarkdownView Interface

`MarkdownView` represents a markdown file open in the editor.

```typescript
// Get current MarkdownView
const view = this.app.workspace.getActiveViewOfType(MarkdownView);
if (!view) return;

// Properties
const file: TFile = view.file;              // Associated file
const editor: Editor = view.editor;         // Editor instance
const mode: string = view.getMode();        // 'source' or 'preview'
const state: ViewState = view.getState();   // View state

// Methods
view.setMode('source');     // Switch to source mode
view.setMode('preview');    // Switch to preview mode
view.getViewData(): string; // Get current view data
view.setViewData(data): void; // Set view data
```

### 2.2 Getting View Mode

Determining the current editing mode:

```typescript
const view = this.app.workspace.getActiveViewOfType(MarkdownView);
if (view) {
  const mode = view.getMode();

  if (mode === 'source') {
    // Editing source markdown
  } else if (mode === 'preview') {
    // Reading/preview mode
  }
}
```

**Live Preview Detection** (Important caveat):

The `getMode()` method returns 'source' or 'preview', but doesn't distinguish Live Preview from source-only editing. To detect Live Preview:

```typescript
// Live Preview uses CodeMirror 6, source-only uses CodeMirror 5
// You can detect by checking for CM6-specific features:
const hasCodeMirror6 = (editor: any) => {
  return editor.cm && editor.cm.state && editor.cm.state.selection;
};

const isLivePreview = hasCodeMirror6(editor);
```

### 2.3 MarkdownFileInfo

When working with contexts that may not be `MarkdownView`, use the more flexible `MarkdownFileInfo` type:

```typescript
// Both MarkdownView and MarkdownFileInfo have:
interface MarkdownFileInfo {
  file: TFile;
  editor: Editor;
  // But MarkdownFileInfo is lighter weight
}

// Type guard
function isMarkdownView(ctx: MarkdownView | MarkdownFileInfo): ctx is MarkdownView {
  return 'getMode' in ctx;
}
```

### 2.4 Viewing and Reading View Context

When in reading view, access via different mechanism:

```typescript
// Get reading view
const readingView = this.app.workspace.getActiveViewOfType(MarkdownView);

// Or access file directly
const file = this.app.workspace.getActiveFile();
if (file instanceof TFile) {
  const content = await this.app.vault.read(file);
}
```

---

## Part 3: Markdown Post Processors - Rendering Extensions

Markdown post processors handle rendering markdown in the preview pane (reading view).

### 3.1 registerMarkdownPostProcessor API

```typescript
// Register a post processor
this.registerMarkdownPostProcessor(
  (el: HTMLElement, ctx: MarkdownPostProcessorContext) => {
    // el: DOM element containing rendered markdown
    // ctx: Processing context with metadata

    // Modify DOM to customize rendering
    const headings = el.querySelectorAll('h1, h2, h3');
    headings.forEach(heading => {
      // Add custom styling or behavior
      heading.classList.add('custom-heading');
    });
  }
);
```

### 3.2 MarkdownPostProcessorContext

The context object provides metadata about the rendering:

```typescript
interface MarkdownPostProcessorContext {
  // Source file path
  sourcePath: string;

  // Can schedule async cleanup
  addChild(component: Component): void;
}
```

**Using Context for Cleanup**

```typescript
this.registerMarkdownPostProcessor((el, ctx) => {
  const button = el.createEl('button', { text: 'Click me' });

  // Register click handler
  button.addEventListener('click', () => {
    console.log('Clicked from', ctx.sourcePath);
  });

  // If button is removed from DOM later, we might want cleanup
  ctx.addChild({
    onunload: () => {
      // Cleanup happens here
    }
  });
});
```

### 3.3 Custom Code Block Processors

Register handlers for custom code block languages:

```typescript
// Register processor for custom language
this.registerMarkdownCodeBlockProcessor(
  'custom-lang',  // Language identifier
  (source: string, el: HTMLElement, ctx: MarkdownPostProcessorContext) => {
    // source: Content between ``` markers
    // el: Container element to populate
    // ctx: Processor context

    const div = el.createDiv('custom-block');
    div.textContent = `Custom content from: ${source}`;
  }
);
```

**Async Code Block Processor**

```typescript
this.registerMarkdownCodeBlockProcessor(
  'async-render',
  async (source: string, el: HTMLElement, ctx: MarkdownPostProcessorContext) => {
    // Can fetch data, parse complex formats, etc.
    const data = await fetch(`/api/${source}`);
    const json = await data.json();

    el.createEl('pre').textContent = JSON.stringify(json, null, 2);
  }
);
```

**CSV Renderer Example**

```typescript
this.registerMarkdownCodeBlockProcessor(
  'csv',
  (source: string, el: HTMLElement, ctx: MarkdownPostProcessorContext) => {
    const rows = source
      .trim()
      .split('\n')
      .filter(row => row.length > 0);

    const table = el.createEl('table');

    rows.forEach((row, index) => {
      const tr = table.createEl('tr');
      const cells = row.split(',');

      cells.forEach(cell => {
        const td = tr.createEl(index === 0 ? 'th' : 'td');
        td.textContent = cell.trim();
      });
    });

    el.appendChild(table);
  }
);
```

### 3.4 Post Processor Limitations

**Important Caveats:**

1. **Live Preview Limitation**: `registerMarkdownPostProcessor` callbacks are NOT called when using Live Preview mode (only in reading view)
2. **Removal Challenges**: Cannot reliably detect when processor DOM elements are removed
3. **Execution Timing**: Executes after markdown rendering, so cannot modify parsing

**Workaround for Live Preview Support:**

Use editor extensions (CodeMirror 6) to render content in Live Preview, reserve post-processors for reading view only:

```typescript
private setupRendering() {
  // For reading view (preview mode)
  this.registerMarkdownPostProcessor((el, ctx) => {
    // Handle preview rendering
  });

  // For live preview + source editing
  this.registerEditorExtension(this.createEditorExtension());
}
```

---

## Part 4: CodeMirror 6 Editor Extensions

CodeMirror 6 (CM6) is the modern editor engine Obsidian uses for Live Preview and source editing.

### 4.1 Registering Editor Extensions

```typescript
// In plugin onload()
this.registerEditorExtension(this.createExtension());

// Single extension
private createExtension(): Extension {
  return [
    // Can return array of extensions
    viewPlugin,
    stateField,
    // ... more extensions
  ];
}
```

**Important Dependencies:**

```typescript
// obsidian provides CM6 internals - NEVER import separately
import {
  EditorView,
  ViewPlugin,
  WidgetType,
  Decoration,
  DecorationSet
} from '@codemirror/view';

import {
  StateField,
  StateEffect,
  EditorState,
  Transaction
} from '@codemirror/state';

// Mark @codemirror/* as external in bundler (esbuild, rollup, etc.)
// This prevents version conflicts with Obsidian's CM6 instance
```

### 4.2 StateField: Managing Editor State

StateFields store persistent data in the editor state:

```typescript
// Define a state field for tracking custom data
const myStateField = StateField.define<MyDataType>({
  // Initialize the field
  create(state: EditorState): MyDataType {
    return { initialized: true, data: [] };
  },

  // Update field on transaction
  update(value: MyDataType, tr: Transaction): MyDataType {
    // Return new value if transaction affects this field
    for (let effect of tr.effects) {
      if (effect.is(setMyStateEffect)) {
        return effect.value;
      }
    }
    return value;
  }
});

// Define effects that can trigger updates
const setMyStateEffect = StateEffect.define<MyDataType>();

// Access field value in extensions
const getMyState = (view: EditorView) => {
  return view.state.field(myStateField);
};

// Update the field
const updateMyState = (view: EditorView, newValue: MyDataType) => {
  view.dispatch({
    effects: setMyStateEffect.of(newValue)
  });
};
```

### 4.3 ViewPlugin: Reactive Editor Behavior

ViewPlugins provide reactive behavior tied to view updates:

```typescript
const myViewPlugin = ViewPlugin.fromClass(
  class {
    decorations: DecorationSet;

    // Constructor called when plugin initializes
    constructor(view: EditorView) {
      this.decorations = this.buildDecorations(view);
    }

    // Called on every view update
    update(update: ViewUpdate) {
      if (update.docChanged || update.viewportChanged) {
        this.decorations = this.buildDecorations(update.view);
      }
    }

    // Build decorations
    private buildDecorations(view: EditorView): DecorationSet {
      const decorations: Range<Decoration>[] = [];

      for (let { from, to } of view.visibleRanges) {
        // Iterate visible content
        const text = view.state.doc.sliceString(from, to);

        // Create decorations here
      }

      return Decoration.set(decorations);
    }
  },
  {
    // Provide decorations to editor
    decorations: v => v.decorations,

    // Optional: Handle DOM events
    eventHandlers: {
      mousedown: (e: MouseEvent, view: EditorView) => {
        // Handle mouse down
        return false; // Return true to consume event
      }
    }
  }
);
```

### 4.4 Decorations: Styling and Widgets

Decorations modify how content appears without changing document.

**Mark Decoration (Style inline content)**

```typescript
import { Decoration } from '@codemirror/view';

const blueMark = Decoration.mark({
  class: 'my-custom-class',
  // Optional attributes
  attributes: { title: 'Custom tooltip' }
});

// Apply to range
const decorations = [
  blueMark.range(10, 20)  // Mark chars 10-20
];
```

**Line Decoration (Style entire line)**

```typescript
const lineDecoration = Decoration.line({
  class: 'line-highlight'
});

// Apply to lines
const decorations = [
  lineDecoration.range(line1Start, line1End),
  lineDecoration.range(line2Start, line2End)
];
```

**Widget Decoration (Insert DOM elements)**

```typescript
class CustomWidget extends WidgetType {
  constructor(readonly text: string) { super(); }

  toDOM() {
    const span = document.createElement('span');
    span.className = 'custom-widget';
    span.textContent = this.text;
    return span;
  }

  ignoreEvent() {
    return false;
  }
}

// Create decoration
const widget = Decoration.widget(pos, new CustomWidget('🎯'));
```

**Replace Decoration (Replace content with widget)**

```typescript
class ReplacementWidget extends WidgetType {
  constructor(readonly emoji: string) { super(); }

  toDOM() {
    const span = document.createElement('span');
    span.textContent = this.emoji;
    span.className = 'emoji-replacement';
    return span;
  }
}

// Use `side` to position: positive = after, negative = before
const decoration = Decoration.replace({
  widget: new ReplacementWidget('✨'),
  side: 1  // After the covered range
}).range(start, end);
```

### 4.5 Complete ViewPlugin Example: Emoji Replacements

```typescript
const emojiPlugin = ViewPlugin.fromClass(
  class {
    decorations: DecorationSet;
    emojiMap = new Map([
      [':smile:', '😊'],
      [':heart:', '❤️'],
      [':star:', '⭐']
    ]);

    constructor(view: EditorView) {
      this.decorations = this.buildDecorations(view);
    }

    update(update: ViewUpdate) {
      if (update.docChanged || update.viewportChanged) {
        this.decorations = this.buildDecorations(update.view);
      }
    }

    buildDecorations(view: EditorView): DecorationSet {
      const decorations: Range<Decoration>[] = [];

      for (let { from, to } of view.visibleRanges) {
        const text = view.state.doc.sliceString(from, to);
        const regex = /:(\w+):/g;
        let match;

        while ((match = regex.exec(text)) !== null) {
          const emoji = this.emojiMap.get(match[0]);
          if (emoji) {
            const matchFrom = from + match.index;
            const matchTo = matchFrom + match[0].length;

            // Create emoji widget
            class EmojiWidget extends WidgetType {
              constructor(readonly emoji: string) { super(); }

              toDOM() {
                const span = document.createElement('span');
                span.textContent = this.emoji;
                span.className = 'emoji-widget';
                return span;
              }
            }

            decorations.push(
              Decoration.replace({
                widget: new EmojiWidget(emoji)
              }).range(matchFrom, matchTo)
            );
          }
        }
      }

      return Decoration.set(decorations);
    }
  },
  { decorations: v => v.decorations }
);
```

---

## Part 5: EditorSuggest - Autocomplete Implementation

EditorSuggest enables autocomplete/suggestion popups in the editor.

### 5.1 EditorSuggest Class

```typescript
class MyEditorSuggest extends EditorSuggest<MyItem> {
  // Abstract methods required

  onTrigger(cursor: EditorPosition, editor: Editor, file: TFile | null): EditorSuggestTriggerInfo | null {
    // Determine if should show suggestions
  }

  getSuggestions(context: EditorSuggestContext): MyItem[] | Promise<MyItem[]> {
    // Return suggestion items
  }

  renderSuggestion(item: MyItem, el: HTMLElement): void {
    // Render item to DOM
  }

  selectSuggestion(item: MyItem, evt: MouseEvent | KeyboardEvent): void {
    // Handle selection
  }
}
```

### 5.2 onTrigger Method: Detecting When to Show

```typescript
onTrigger(cursor: EditorPosition, editor: Editor, file: TFile | null): EditorSuggestTriggerInfo | null {
  // Get line text up to cursor
  const line = editor.getLine(cursor.line);
  const textBeforeCursor = line.substring(0, cursor.ch);

  // Trigger if line starts with @
  if (textBeforeCursor.endsWith('@')) {
    return {
      start: cursor.ch - 1,    // Start of match
      end: cursor.ch,          // End of match
      query: ''                // Initial query
    };
  }

  // More complex example with regex
  const match = textBeforeCursor.match(/@(\w*)$/);
  if (match) {
    return {
      start: cursor.ch - 1 - match[1].length,
      end: cursor.ch,
      query: match[1]
    };
  }

  // Don't trigger
  return null;
}
```

**Common Trigger Patterns:**

```typescript
// Trigger on hashtag
const hashMatch = textBeforeCursor.match(/#([\w-]*)$/);
if (hashMatch) {
  return {
    start: cursor.ch - hashMatch[0].length,
    end: cursor.ch,
    query: hashMatch[1]
  };
}

// Trigger on command
const cmdMatch = textBeforeCursor.match(/\/(\w*)$/);
if (cmdMatch) {
  return {
    start: cursor.ch - cmdMatch[0].length,
    end: cursor.ch,
    query: cmdMatch[1]
  };
}

// Trigger on bracket
if (textBeforeCursor.endsWith('[[')) {
  return {
    start: cursor.ch - 2,
    end: cursor.ch,
    query: ''
  };
}
```

### 5.3 getSuggestions Method: Providing Items

```typescript
getSuggestions(context: EditorSuggestContext): MyItem[] {
  const query = context.query.toLowerCase();

  // Return filtered items
  return this.items.filter(item =>
    item.name.toLowerCase().includes(query)
  );
}

// Async example with API
async getSuggestions(context: EditorSuggestContext): Promise<MyItem[]> {
  if (context.query.length < 2) {
    return [];  // Don't search for very short queries
  }

  const results = await fetch(`/api/search?q=${context.query}`);
  return results.json();
}
```

### 5.4 renderSuggestion Method: Display

```typescript
renderSuggestion(item: MyItem, el: HTMLElement): void {
  // Create custom DOM for each suggestion
  el.createDiv({
    cls: 'my-suggest-item',
    text: item.name
  });

  el.createDiv({
    cls: 'my-suggest-description',
    text: item.description
  });
}

// More complex example
renderSuggestion(item: MyItem, el: HTMLElement): void {
  const container = el.createDiv('suggestion-container');

  const title = container.createDiv('suggestion-title');
  title.textContent = item.name;

  const meta = container.createDiv('suggestion-meta');
  meta.textContent = `Last updated: ${item.updatedAt}`;

  if (item.tags) {
    const tags = container.createDiv('suggestion-tags');
    item.tags.forEach(tag => {
      tags.createSpan('tag', { text: tag });
    });
  }
}
```

### 5.5 selectSuggestion Method: Handling Selection

```typescript
selectSuggestion(item: MyItem, evt: MouseEvent | KeyboardEvent): void {
  const { editor } = this.context!;
  const { start, end } = this.context!;

  // Replace the trigger text with full item
  editor.replaceRange(
    item.name,
    { line: editor.getCursor().line, ch: start },
    { line: editor.getCursor().line, ch: end }
  );
}

// Advanced: Insert with formatting
selectSuggestion(item: MyItem, evt: MouseEvent | KeyboardEvent): void {
  const { editor } = this.context!;
  const cursor = editor.getCursor();

  // Insert item with template
  const text = `@${item.name}`;

  editor.replaceRange(
    text,
    { line: cursor.line, ch: this.context!.start },
    { line: cursor.line, ch: this.context!.end }
  );

  // Move cursor after insertion
  editor.setCursor({
    line: cursor.line,
    ch: this.context!.start + text.length
  });
}
```

### 5.6 Complete EditorSuggest Example

```typescript
interface UserItem {
  name: string;
  email: string;
}

class UserMentionSuggest extends EditorSuggest<UserItem> {
  private users: UserItem[] = [
    { name: 'Alice', email: 'alice@example.com' },
    { name: 'Bob', email: 'bob@example.com' }
  ];

  onTrigger(cursor: EditorPosition, editor: Editor, file: TFile | null): EditorSuggestTriggerInfo | null {
    const line = editor.getLine(cursor.line);
    const textBefore = line.substring(0, cursor.ch);
    const match = textBefore.match(/@([\w-]*)$/);

    if (!match) return null;

    return {
      start: cursor.ch - 1 - match[1].length,
      end: cursor.ch,
      query: match[1]
    };
  }

  getSuggestions(context: EditorSuggestContext): UserItem[] {
    if (context.query.length === 0) return this.users;

    return this.users.filter(user =>
      user.name.toLowerCase().includes(context.query.toLowerCase())
    );
  }

  renderSuggestion(item: UserItem, el: HTMLElement): void {
    const container = el.createDiv('user-suggest');
    container.createDiv('user-name', { text: item.name });
    container.createDiv('user-email', { text: item.email });
  }

  selectSuggestion(item: UserItem, evt: MouseEvent | KeyboardEvent): void {
    const { editor } = this.context!;
    const cursor = editor.getCursor();

    editor.replaceRange(
      `@${item.name}`,
      { line: cursor.line, ch: this.context!.start },
      { line: cursor.line, ch: this.context!.end }
    );
  }
}

// Register in plugin
this.registerEditorSuggest(new UserMentionSuggest(this.app));
```

---

## Part 6: Live Preview Integration - Widget Patterns

Live Preview renders markdown as you edit. Plugins can insert interactive widgets.

### 6.1 Understanding Live Preview Architecture

Live Preview (CodeMirror 6 based) differs from traditional preview mode:

- **Source Mode (Legacy)**: CodeMirror 5, raw markdown text
- **Reading View**: Rendered HTML, post-processor hooks available
- **Live Preview**: CodeMirror 6, mixed markdown source + rendered widgets

### 6.2 Widget Rendering in Live Preview

Widgets are DOM elements overlaid on the editor without modifying document content:

```typescript
// Example: Render math expression as widget
class MathWidget extends WidgetType {
  constructor(readonly math: string) { super(); }

  toDOM() {
    const div = document.createElement('div');
    div.className = 'math-widget';

    // Use math library (e.g., KaTeX)
    try {
      div.innerHTML = katex.renderToString(this.math);
    } catch (e) {
      div.textContent = 'Invalid math';
      div.className += ' error';
    }

    return div;
  }

  ignoreEvent(event: Event) {
    // Let math widget handle clicks
    return false;
  }
}

// Create plugin to find and render math
const mathPlugin = ViewPlugin.fromClass(
  class {
    decorations: DecorationSet;
    mathRegex = /\$\$(.+?)\$\$/g;

    constructor(view: EditorView) {
      this.decorations = this.buildDecorations(view);
    }

    update(update: ViewUpdate) {
      if (update.docChanged || update.viewportChanged) {
        this.decorations = this.buildDecorations(update.view);
      }
    }

    buildDecorations(view: EditorView): DecorationSet {
      const decorations: Range<Decoration>[] = [];

      for (let { from, to } of view.visibleRanges) {
        const text = view.state.doc.sliceString(from, to);
        let match;

        while ((match = this.mathRegex.exec(text)) !== null) {
          const start = from + match.index + 2;  // +2 for $$
          const end = start + match[1].length;

          decorations.push(
            Decoration.replace({
              widget: new MathWidget(match[1]),
              side: 0
            }).range(from + match.index, from + match.index + match[0].length)
          );
        }
      }

      return Decoration.set(decorations);
    }
  },
  { decorations: v => v.decorations }
);
```

### 6.3 Interactive Widgets with Event Handlers

```typescript
class InteractiveWidget extends WidgetType {
  constructor(readonly label: string, readonly onClick: () => void) { super(); }

  toDOM() {
    const button = document.createElement('button');
    button.className = 'interactive-widget';
    button.textContent = this.label;

    button.addEventListener('click', (e) => {
      e.preventDefault();
      e.stopPropagation();
      this.onClick();
    });

    return button;
  }

  ignoreEvent(event: Event) {
    // Don't let editor handle button clicks
    return event.type === 'click';
  }
}
```

### 6.4 Accessing MarkdownView from EditorView

```typescript
import { editorViewField } from 'obsidian';

// In ViewPlugin
constructor(view: EditorView) {
  // Get the MarkdownView
  const markdownView = view.state.field(editorViewField);
  const file = markdownView.file;
  const editor = markdownView.editor;
}
```

---

## Part 7: Advanced Patterns & Best Practices

### 7.1 Syntax Highlighting with Lezer

For custom language syntax highlighting in Live Preview:

```typescript
// Using Lezer parser
import { LRLanguage, LanguageSupport } from '@codemirror/language';
import { styleTags, tags as t } from '@lezer/highlight';

// Define grammar (simplified)
const parser = /* Lezer grammar parser */;

const customLanguage = LRLanguage.define({
  parser: parser.configure({
    props: [
      styleTags({
        'String CommentsString': t.string,
        'Number': t.number,
        'Boolean': t.atom,
        'Operator': t.operator,
        'Keyword': t.keyword
      })
    ]
  })
});

// Create language support
export const customLangSupport = new LanguageSupport(customLanguage);
```

### 7.2 Handling Multiple Selections

```typescript
// Work with multiple cursors
const selections = editor.listSelections();
editor.setSelections(
  selections.map(sel => ({
    anchor: sel.from(),
    head: sel.to()
  }))
);
```

### 7.3 Document Change Detection

```typescript
// Detect what changed
this.registerEvent(
  this.app.workspace.on('editor-change', (editor: Editor) => {
    // Full document text changed
    const fullText = editor.getValue();

    // Or use transaction approach
    const view = editor.cm as EditorView;
    if (!view) return;

    view.dispatch({
      effects: StateEffect.appendConfig.of(
        EditorView.updateListener.of(update => {
          if (update.docChanged) {
            for (let change of update.changes) {
              console.log(`Changed from ${change.fromA} to ${change.toA}`);
            }
          }
        })
      )
    });
  })
);
```

### 7.4 Performance: Viewport-aware Processing

Only process visible content to improve performance:

```typescript
class PerformantPlugin extends ViewPlugin {
  update(update: ViewUpdate) {
    // Only rebuild when visible content changes
    if (update.viewportChanged || update.docChanged) {
      // Process only visible ranges
      for (let { from, to } of update.view.visibleRanges) {
        // Heavy processing on visible lines only
      }
    }
  }
}
```

### 7.5 Interacting with Obsidian App

```typescript
// Access core Obsidian features from plugins
this.registerMarkdownPostProcessor((el, ctx) => {
  // Get the vault
  const vault = this.app.vault;

  // Get metadata cache for the current file
  const metadata = this.app.metadataCache.getFileCache(
    this.app.workspace.getActiveFile()
  );

  // Open file
  const file = vault.getFileByPath('path/to/file.md');
  if (file) {
    this.app.workspace.openLinkText(file.path, '');
  }
});
```

---

## Part 8: Complete Working Examples

### 8.1 Full Plugin: Word Count Status Bar

```typescript
import { Plugin, App, PluginSettingTab, Setting } from 'obsidian';
import { EditorView, ViewPlugin } from '@codemirror/view';

export default class WordCountPlugin extends Plugin {
  wordCountElement: HTMLElement;

  async onload() {
    console.log('Loading word count plugin');

    // Add status bar item
    this.wordCountElement = this.addStatusBarItem();

    // Update on editor change
    this.registerEvent(
      this.app.workspace.on('editor-change', (editor) => {
        this.updateWordCount(editor);
      })
    );

    // Initial update
    const editor = this.app.workspace.getActiveEditor()?.editor;
    if (editor) {
      this.updateWordCount(editor);
    }
  }

  private updateWordCount(editor: Editor) {
    const text = editor.getValue();
    const words = text.split(/\s+/).filter(w => w.length > 0);
    const chars = text.length;
    const lines = editor.lineCount();

    this.wordCountElement.textContent =
      `${words.length} words, ${chars} chars, ${lines} lines`;
  }

  onunload() {
    console.log('Unloading word count plugin');
  }
}
```

### 8.2 Full Plugin: Custom Code Block Renderer (Mermaid Clone)

```typescript
import { Plugin, MarkdownPostProcessorContext } from 'obsidian';

export default class DiagramPlugin extends Plugin {
  async onload() {
    // Register diagram code block processor
    this.registerMarkdownCodeBlockProcessor(
      'diagram',
      (source: string, el: HTMLElement, ctx: MarkdownPostProcessorContext) => {
        this.renderDiagram(source, el);
      }
    );
  }

  private renderDiagram(source: string, el: HTMLElement) {
    const canvas = el.createEl('canvas');

    try {
      const diagram = this.parseDiagram(source);
      this.drawDiagram(canvas, diagram);
    } catch (error) {
      el.createDiv({
        cls: 'error',
        text: `Error: ${error.message}`
      });
    }
  }

  private parseDiagram(source: string) {
    const lines = source.trim().split('\n');
    return {
      type: lines[0],
      nodes: lines.slice(1)
    };
  }

  private drawDiagram(canvas: HTMLCanvasElement, diagram: any) {
    const ctx = canvas.getContext('2d')!;
    canvas.width = 400;
    canvas.height = 300;

    // Simple diagram drawing
    ctx.fillStyle = '#f0f0f0';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    ctx.fillStyle = '#000';
    ctx.font = '14px Arial';
    ctx.fillText('Diagram: ' + diagram.type, 10, 30);
  }
}
```

### 8.3 Full Plugin: Inline Link Previewer

```typescript
import { Plugin, MarkdownView } from 'obsidian';
import { EditorView, ViewPlugin, WidgetType, Decoration, DecorationSet } from '@codemirror/view';
import { ViewUpdate, Range } from '@codemirror/view';

class LinkPreviewWidget extends WidgetType {
  constructor(readonly linkText: string) { super(); }

  toDOM() {
    const span = document.createElement('span');
    span.className = 'link-preview';
    span.textContent = `Preview: ${this.linkText}`;
    span.style.cssText = `
      background: #f0f0f0;
      padding: 2px 4px;
      border-radius: 2px;
      font-size: 0.8em;
      margin-left: 4px;
    `;
    return span;
  }
}

const linkPreviewPlugin = ViewPlugin.fromClass(
  class {
    decorations: DecorationSet;
    linkRegex = /\[\[([^\]]+)\]\]/g;

    constructor(view: EditorView) {
      this.decorations = this.buildDecorations(view);
    }

    update(update: ViewUpdate) {
      if (update.docChanged || update.viewportChanged) {
        this.decorations = this.buildDecorations(update.view);
      }
    }

    buildDecorations(view: EditorView): DecorationSet {
      const decorations: Range<Decoration>[] = [];

      for (let { from, to } of view.visibleRanges) {
        const text = view.state.doc.sliceString(from, to);
        let match;

        while ((match = this.linkRegex.exec(text)) !== null) {
          const matchEnd = from + match.index + match[0].length;

          decorations.push(
            Decoration.widget(matchEnd, new LinkPreviewWidget(match[1])).range(matchEnd)
          );
        }
      }

      return Decoration.set(decorations);
    }
  },
  { decorations: v => v.decorations }
);

export default class LinkPreviewPlugin extends Plugin {
  async onload() {
    this.registerEditorExtension(linkPreviewPlugin);
  }
}
```

---

## Part 9: Comprehensive API Reference Tables

### Editor Methods Reference

| Category | Method | Signature | Returns | Notes |
|----------|--------|-----------|---------|-------|
| **Cursor** | getCursor | (type?) => EditorPosition | EditorPosition | Default 'head' |
| | setCursor | (pos\|line, ch?) => void | void | Accepts position or coordinates |
| **Selection** | getSelection | () => string | string | Selected text |
| | setSelection | (anchor, head?) => void | void | Set selection range |
| | replaceSelection | (text, collapse?) => void | void | 'start'\|'end'\|undefined |
| **Lines** | getLine | (lineNum) => string | string | Get full line |
| | lineCount | () => number | number | Total lines |
| | setValue | (text) => void | void | Set entire document |
| | getValue | () => string | string | Get entire document |
| **Range** | replaceRange | (text, from, to?, origin?) => void | void | Batch operations |
| | getRange | (from, to) => string | string | Get text slice |
| **Operations** | exec | (command) => void | void | Execute built-in command |
| | forEachLine | (fn) => void | void | Iterate lines |
| **History** | undo | () => void | void | Undo last change |
| | redo | () => void | void | Redo last undone |
| | clearHistory | () => void | void | Clear undo/redo |
| | historySize | () => {undo, redo} | {undo, redo} | Check history |
| **State** | transaction | (fn, origin?) => void | void | Batch changes |
| | somethingSelected | () => boolean | boolean | Check selection |
| | listSelections | () => Selection[] | Selection[] | Get all selections |

### CodeMirror 6 Core Interfaces

| Interface | Purpose | Key Properties |
|-----------|---------|-----------------|
| EditorView | Editor instance | state, dom, dispatch, cm |
| EditorState | Immutable state | doc, selection, field() |
| Transaction | Change batch | changes, effects, docChanged |
| ViewUpdate | Change notification | view, docChanged, viewportChanged |
| Decoration | Visual markup | mark, line, widget, replace |
| WidgetType | Custom widget | toDOM(), ignoreEvent() |
| StateField | Persistent data | create(), update() |
| StateEffect | State mutation | of() |
| ViewPlugin | Reactive behavior | fromClass(), decorations |

---

## Part 10: Debugging & Troubleshooting

### 10.1 Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Editor extensions not loading | Bundler includes @codemirror/* | Mark @codemirror/* as external |
| Post-processor not called | Using Live Preview | Use editor extensions instead |
| Decorations not updating | Missing ViewUpdate checks | Check docChanged, viewportChanged |
| Cursor jumps after edit | Transaction not batched | Use editor.transaction() |
| Performance slow | Processing all content | Use visibleRanges only |
| Selection broken after edit | EditorPosition outdated | Recalculate after changes |

### 10.2 Performance Optimization

```typescript
// GOOD: Process only visible content
const visibleText = view.visibleRanges.map(range => {
  return view.state.doc.sliceString(range.from, range.to);
}).join('\n');

// BAD: Process entire document
const allText = view.state.doc.toString();

// GOOD: Use StateField for caching
const cachedValue = StateField.define({
  create: () => null,
  update(value, tr) {
    if (tr.docChanged) return null;  // Invalidate cache
    return value;  // Reuse cached value
  }
});

// BAD: Recalculate everything on every update
update(update: ViewUpdate) {
  this.expensive = recalculateEverything();
}
```

### 10.3 Debugging Tips

```typescript
// Log state changes
this.registerEvent(
  this.app.workspace.on('editor-change', (editor) => {
    console.log('Document changed:', {
      lineCount: editor.lineCount(),
      charCount: editor.getValue().length,
      cursor: editor.getCursor(),
      selection: editor.getSelection()
    });
  })
);

// Debug decoration building
buildDecorations(view: EditorView): DecorationSet {
  const decorations: Range<Decoration>[] = [];

  for (let { from, to } of view.visibleRanges) {
    console.log(`Processing range: ${from}-${to}`);
    // ... build decorations
  }

  console.log(`Created ${decorations.length} decorations`);
  return Decoration.set(decorations);
}
```

---

## Conclusion

This comprehensive reference covers all major extension points for Obsidian editor development. Master these patterns and you can build sophisticated plugins that seamlessly integrate with both Live Preview and traditional editing modes.

**Key Takeaways:**

1. Use `Editor` API for basic text manipulation
2. Use `CodeMirror 6 extensions` for visual customization in Live Preview
3. Use `Markdown post-processors` for reading view rendering
4. Use `EditorSuggest` for intelligent autocomplete
5. Always test in both source mode and Live Preview
6. Mark @codemirror dependencies as external in bundler
7. Process only visible content for performance

**Further Learning:**

- [Official Obsidian Developer Docs](https://docs.obsidian.md/)
- [CodeMirror 6 System Guide](https://codemirror.net/docs/guide/)
- [nothingislost/obsidian-cm6-* examples](https://github.com/nothingislost)
- [Community Plugin Examples](https://github.com/obsidianmd/obsidian-plugins)

---

## Sources & References

- [Obsidian Developer Documentation](https://docs.obsidian.md/)
- [obsidianmd/obsidian-api GitHub](https://github.com/obsidianmd/obsidian-api)
- [Editor API Reference](https://docs.obsidian.md/Plugins/Editor/Editor)
- [Editor Extensions](https://docs.obsidian.md/Plugins/Editor/Editor+extensions)
- [Markdown Post Processing](https://docs.obsidian.md/Plugins/Editor/Markdown+post+processing)
- [EditorSuggest API](https://docs.obsidian.md/Reference/TypeScript+API/EditorSuggest)
- [CodeMirror 6 Documentation](https://codemirror.net/docs/guide/)
- [nothingislost CM6 Attributes Plugin](https://github.com/nothingislost/obsidian-cm6-attributes)
- [nothingislost CM6 Input Plugin](https://github.com/nothingislost/obsidian-cm6-input)
- [ObsidianPress MentionSuggest Example](https://github.com/wzieba/ObsidianPress/blob/main/MentionSuggest.ts)
- [Obsidian Plugin Developer Docs - Marcus Olsson](https://marcusolsson.github.io/obsidian-plugin-docs/)
- [CodeMirror Decoration Examples](https://codemirror.net/examples/decoration/)
- [Live Preview Feature Documentation](https://help.obsidian.md/Live+preview+update)

---

## Related Research

**Project Context:**
- [[README]] - Obsidian Research Project Overview
- [[MASTER-API-REFERENCE]] - Complete API Navigation Hub
- [[RESEARCH-INDEX]] - All Research Documents

**Status & Organization:**
- [[3-Resources/anchors/status-complete]] - Completed Research Items

**Gap Category:**
- [[3-Resources/anchors/gap-category-foundation]] - Foundational Research
