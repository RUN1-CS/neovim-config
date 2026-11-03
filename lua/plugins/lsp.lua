return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      -- Install these executables through NixOS, not Mason.
      -- They must be available on PATH when Neovim starts.
      local servers = {
        clangd = {},
        ts_ls = {},
        vue_ls = {},
        phpactor = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        nixd = {},
        bashls = {},
        sqls = {},
        jdtls = {},
        rust_analyzer = {},
        gopls = {},
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        signs = true,
        underline = true,
        virtual_text = { spacing = 2, source = "if_many" },
      })

      local group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(event)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gI", vim.lsp.buf.implementation, "Implementation")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
          map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
          map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format with LSP")
        end,
      })
    end,
  },
}
