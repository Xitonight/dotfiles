return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "cpp",
                    "lua",
                    "query",
                    "javascript",
                    "html",
                    "css",
                    "typescript",
                    "python",
                    "kotlin",
                    "java",
                    "hyprlang",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
