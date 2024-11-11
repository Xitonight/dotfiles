return {
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                -- Optional: any Catppuccin settings
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    }
}
