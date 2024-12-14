return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "clangd",
                    "clang-format",
                    "jdtls",
                    "kotlin-language-server",
                    "bash-language-server",
                    "beautysh",
                    "lua-language-server",
                    "stylua",
                    "typescript-language-server",
                    "eslint-lsp",
                    "prettier",
                    "hyprls",
                },
                auto_update = true,
                run_on_start = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.filetype.add({
  extension = {
    rasi = "css", -- Set .rasi files to use the css filetype
  },
})

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.bashls.setup({
                capabiliites = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabiliites = capabilities,
                settings = {
                    Lua = {
                        format = {
                            enable = false, -- Disable formatting in lua_ls
                        },
                    },
                },

            })
            lspconfig.ts_ls.setup({
                capabiliites = capabilities,
            })
            lspconfig.eslint.setup({
                capabiliites = capabilities,
            })
            lspconfig.clangd.setup({
                capabiliites = capabilities,
            })
            lspconfig.hyprls.setup({
                capabiliites = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
