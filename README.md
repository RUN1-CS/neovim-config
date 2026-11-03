# NixOS Neovim IDE configuration

A modular Neovim configuration using lazy.nvim, native Neovim 0.11+ LSP APIs,
Blink completion, Telescope, Treesitter, Conform, Git tools, ToggleTerm, Oil,
and Ollama-backed AI via `gen.nvim`.

## Compatibility

- Target: Neovim 0.11.x (use Neovim 0.11.3 or newer for current nvim-lspconfig).
- `nvim-treesitter` is pinned to its legacy `master` branch for Neovim 0.11.x.
  Its newer `main` branch has a substantially different setup/API.
- `blink.cmp` uses the `1.*` release line.
- Plugins are fetched by lazy.nvim; language servers and formatters are supplied by Nix.

## Install

1. Back up your current configuration:
   `mv ~/.config/nvim ~/.config/nvim.backup`
2. Copy this directory's `nvim/` contents into `~/.config/nvim/`.
3. Import `nixos/neovim-tools.nix` from your NixOS configuration, or copy its
   `environment.systemPackages` list into your existing configuration.
4. Rebuild:
   `sudo nixos-rebuild switch`
5. Start `nvim`. lazy.nvim bootstraps itself and installs plugins.
6. Run `:Lazy sync`, then restart Neovim.
7. Run `:checkhealth` and `:checkhealth vim.lsp`.

If `vue-language-server` or another package attribute is unavailable in your
nixpkgs revision, search the package set (`nix search nixpkgs <name>`) and
adjust that one attribute. Keep the corresponding executable on PATH.

## Language server mapping

| Language | Server | Nix package |
|---|---|---|
| C / C++ | `clangd` | `clang-tools` |
| JavaScript / TypeScript | `ts_ls` | `typescript-language-server` |
| Vue | `vue_ls` | `vue-language-server` |
| PHP | `phpactor` | `phpactor` |
| Lua | `lua_ls` | `lua-language-server` |
| Nix | `nixd` | `nixd` |
| Bash | `bashls` | `bash-language-server` |
| SQL | `sqls` | `sqls` |
| Java | `jdtls` | `jdt-language-server` |
| Rust | `rust_analyzer` | `rust-analyzer` |
| Go | `gopls` | `gopls` |

Vue/TypeScript integration can require additional `@vue/typescript-plugin`
configuration depending on the project and versions. This baseline enables
both servers; if Vue cross-file type intelligence is incomplete, configure
the Vue TypeScript plugin for your installed TS server.

## Ollama AI

The AI plugin talks to Ollama at `127.0.0.1:11434`. It does not install models.
Change `model = "qwen3:14b"` in `lua/plugins/ai.lua` to a model shown by
`ollama list`. Start Ollama before using `<leader>aa` or `<leader>ae`.

`gen.nvim` opens its prompt interface with `:Gen`; select the desired built-in
prompt and provide the text/selection. AI requests are sent to your local
Ollama service.

## Keybindings

Leader is Space.

- `<leader>ff`: find files
- `<leader>fg`: live grep
- `<leader>fb`: buffers
- `<leader>e`: Oil file explorer
- `<leader>gs`: Fugitive Git status
- `<leader>gg`: LazyGit
- `<leader>fm`: format buffer
- `<leader>tt`: floating terminal
- `<leader>aa`: local AI prompt
- `<leader>ae`: local AI prompt (normal/visual selection)
- `gd`: definition
- `gr`: references
- `K`: hover documentation
- `<leader>rn`: rename symbol
- `<leader>ca`: code action
- `<leader>xx`: diagnostics list

## Troubleshooting

- `:checkhealth vim.lsp` shows enabled/attached servers and executable errors.
- `:ConformInfo` shows configured formatters and whether they are executable.
- `:Lazy` shows plugin state and errors.
- If Treesitter parsers fail to compile, confirm `tree-sitter`, `gcc`, `gnumake`,
  and network access are available.
- On NixOS, avoid assuming Mason-installed binaries will run correctly; prefer
  Nix-provided executables on PATH.
- For a missing package attribute, use `nix search nixpkgs <package-name>`.
