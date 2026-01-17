# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **LazyVim-based Neovim configuration** built on the LazyVim starter template. LazyVim provides opinionated defaults and a modular plugin system powered by lazy.nvim.

## Repository Structure

```
~/.config/nvim/
├── init.lua                    # Entry point (bootstraps config.lazy)
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager setup & LazyVim configuration
│   │   ├── keymaps.lua        # Custom keybindings
│   │   ├── options.lua        # Vim options (mostly relies on LazyVim defaults)
│   │   └── autocmds.lua       # Autocommands (mostly relies on LazyVim defaults)
│   └── plugins/               # Plugin specifications (auto-loaded by lazy.nvim)
│       ├── hex2ascii.lua      # Local plugin registration
│       └── claude.lua         # Claude Code integration (untracked)
├── myplugs/                   # Local plugin development directory
│   └── hex2ascii/             # Custom hex/ASCII conversion utility
│       ├── lua/hex2ascii/init.lua
│       └── plugin/hex2ascii.lua
├── lazy-lock.json             # Plugin version lock file (59 plugins)
├── lazyvim.json               # LazyVim extras configuration
├── .neoconf.json              # Lua LSP configuration for plugin development
└── stylua.toml                # Lua formatter settings (2-space indent, 120 col)
```

## Key Commands

### Plugin Management (lazy.nvim)
- `:Lazy` - Open lazy.nvim plugin manager UI
- `:Lazy sync` - Install/update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for plugin updates
- `:Lazy restore` - Restore plugins from lazy-lock.json
- `:Lazy reload <plugin>` - Reload a specific plugin after changes

### LSP & Tooling
- `:Mason` - Manage LSP servers, formatters, linters, DAP adapters
- `:LspInfo` - Show LSP server status for current buffer
- `:LazyHealth` - Check LazyVim health/diagnostics
- `:checkhealth` - Full Neovim health check

### Custom Keybindings
- `<Tab>` - Next buffer (`:bnext`)
- `<S-Tab>` - Next window/split (`:wincmd w`)
- `<leader>P` - Open current file in macOS Preview.app
- `:OpenInPreview` - User command for Preview.app integration

### Hex2Ascii Plugin (Custom)
Located in `myplugs/hex2ascii/`, provides hex/ASCII conversion utilities:
- `<leader>hs` - Show hex text under cursor as ASCII (prints to message area)
- `<leader>ht` - Test command (prints "Hello from hex2ascii")
- `<leader>ha` - Replace hex word under cursor with ASCII equivalent
- `<leader>hh` - Replace ASCII text (in quotes) with hex encoding

### Terminal Mode
- `<Esc>` in terminal mode - Exit to normal mode (configured in lazy.lua via autocmd)

## Architecture & Patterns

### Plugin System
This configuration uses **lazy.nvim** with LazyVim as the base distribution:
- LazyVim provides sensible defaults and curated plugin configurations
- Custom plugins are defined in `lua/plugins/*.lua` files
- Each plugin file returns a table/array specification
- Plugins are **not lazy-loaded by default** (`lazy = false` in config)
- Auto-update checking is enabled

### Adding New Plugins
Create a new file in `lua/plugins/<name>.lua`:
```lua
return {
  "username/plugin-name",
  dependencies = { ... },
  opts = { ... },
  config = function()
    require("plugin-name").setup()
  end,
}
```

### Local Plugin Development
For custom plugins, use the `myplugs/` directory:
1. Create plugin directory: `myplugs/<plugin-name>/`
2. Structure: `lua/<plugin-name>/init.lua` (core logic), `plugin/<plugin-name>.lua` (setup)
3. Register in `lua/plugins/<plugin-name>.lua`:
```lua
return {
  "<plugin-name>",
  dir = "~/.config/nvim/myplugs/<plugin-name>/",
}
```

### LazyVim Extras
Enabled via `lazyvim.json` (23 modules):
- **AI**: copilot
- **Languages**: clangd, cmake, git, json, markdown, nix, python, rust, toml
- **Debugging**: DAP core
- **Editor**: dial, inc-rename, snacks_explorer, snacks_picker
- **Coding**: mini-surround, yanky
- **UI**: mini-animate
- **Utils**: dot, mini-hipatterns, startuptime
- **Testing**: core

### Configuration Loading Order
1. `init.lua` - Bootstraps lazy.nvim
2. `lua/config/lazy.lua` - Initializes plugin manager and LazyVim
3. LazyVim core plugins loaded
4. `lua/plugins/*.lua` - Custom plugins imported
5. `lua/config/keymaps.lua`, `options.lua`, `autocmds.lua` - User config applied

## Development Workflow

### Making Configuration Changes
1. Edit files in `lua/config/` or `lua/plugins/`
2. Restart Neovim (`:qa` then reopen) or use `:Lazy reload <plugin>`
3. Use `:checkhealth` to diagnose any issues
4. Commit changes with Git (repository is version controlled)

### Modifying Custom Keymaps
Edit `lua/config/keymaps.lua` directly. LazyVim's default keymaps are documented at:
https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

### Working with Local Plugins (myplugs/)
The `hex2ascii` plugin demonstrates the pattern:
- Core logic in `lua/hex2ascii/init.lua` with a `setup()` function
- Keymaps registered inside `setup()` function
- Plugin registered via `lua/plugins/hex2ascii.lua` using `dir` parameter
- After changes, reload with `:Lazy reload hex2ascii` or restart Neovim

### Lua Formatting
StyLua is configured via `stylua.toml`:
- 2-space indentation
- 120 character column width
- Likely integrated via conform.nvim formatter

## Environment-Specific Notes

- **Platform**: macOS (Darwin)
- **macOS Integration**: Preview.app keybindings for opening current file
- **Leader Key**: Default LazyVim leader is `<Space>`
- **Terminal**: Terminal escape mapping (`<Esc>` exits terminal mode)

## Important Conventions

1. **Prefer editing over creating**: LazyVim provides most functionality through extras and defaults
2. **Plugin specs**: Each file in `lua/plugins/` should return a table or array of tables
3. **Don't reinvent**: Check LazyVim extras before adding custom plugins
4. **Version locking**: `lazy-lock.json` tracks exact plugin versions for reproducibility
5. **No compilation**: This is pure Lua configuration - no build step required

## Dependencies in lazy.lua

The `lua/config/lazy.lua` file includes a dependency block (lines 57-103) with build instructions for external integrations like Avante, CodeCompanion, and image support. These are structured for AI coding assistant features but may not all be actively used.
