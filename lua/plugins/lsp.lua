local clangd_config = {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--query-driver=" .. vim.env.HOME
            .. "/.platformio/packages/toolchain-*/bin/*-g++",
    },
}

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

            local servers = {
                clangd = clangd_config,
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
        end,
    },
}