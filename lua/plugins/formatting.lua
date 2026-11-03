return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- C/C++ formatting is manual to avoid unexpectedly reformatting projects.
        local manual_only = { c = true, cpp = true }
        if manual_only[vim.bo[bufnr].filetype] then
          return
        end
        return { timeout_ms = 1500, lsp_format = "fallback" }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixfmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        bash = { "shfmt" },
        go = { "gofmt" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
}
