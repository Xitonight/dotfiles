return {
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.fn["vimtex#init"]()
                    vim.g.vimtex_enabled = 1
                    vim.g.vimtex_delim_toggle_mod = 1
                end,
            })
            vim.g.vimtex_view_method = "zathura"
        end,
    },
}
