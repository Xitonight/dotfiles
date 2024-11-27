return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                -- Sh
                require("none-ls.formatting.beautysh"),
                -- Lua
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--config-path", "~/.config/nvim/stylua.toml" },
                }),
                -- Javascript / Typescript
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--print-width", "80", "--prose-wrap", "always" },
                }),
                require("none-ls.diagnostics.eslint"),
                require("none-ls.code_actions.eslint"),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
