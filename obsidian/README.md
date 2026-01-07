# Obsidian API Documentation

> **Status:** Consolidated from vault research
> **Last Updated:** 2026-01-07
> **Source:** obsidian-para-research/ vault files

## Contents

| File | Description | Size |
|------|-------------|------|
| `typescript-api.md` | Core TypeScript API reference | 67KB |
| `editor-markdown-api.md` | Editor and Markdown manipulation | 46KB |
| `canvas-api.md` | Canvas API for visual notes | 42KB |
| `embed-api.md` | Embed and preview APIs | 43KB |
| `menu-api.md` | Menu and command APIs | 49KB |
| `mobile-apis.md` | Mobile-specific APIs | 55KB |
| `rest-api-plugin.md` | Local REST API plugin integration | 19KB |
| `automation-api.md` | Automation and scripting | 23KB |

## API Categories

### Core APIs
- **App** - Main application instance
- **Vault** - File system operations
- **Workspace** - Layout and views
- **MetadataCache** - Frontmatter and links

### Editor APIs
- **Editor** - Text manipulation
- **MarkdownView** - Markdown editing
- **MarkdownRenderer** - Rendering markdown

### UI APIs
- **Menu** - Context menus
- **Modal** - Dialog windows
- **Setting** - Plugin settings
- **Notice** - Notifications

### Advanced
- **Canvas** - Visual note graphs
- **Embed** - Embedded content
- **Mobile** - Mobile-specific features

## Notes

1. **No official OpenAPI spec** - Obsidian uses TypeScript definitions
2. **Plugin-based** - Most APIs accessed through plugin development
3. **REST API** - Available via community plugin (Local REST API)

## Resources

- [Official TypeScript API](https://docs.obsidian.md/Reference/TypeScript+API)
- [Plugin Developer Docs](https://docs.obsidian.md/Plugins/Getting+started/Build+a+plugin)
- [Sample Plugin](https://github.com/obsidianmd/obsidian-sample-plugin)
