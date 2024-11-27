return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        "BufReadPre /home/xitonight/Shared/obsidian/main vault/*.md",
        "BufNewFile /home/xitonight/Shared/obsidian/main vault/*.md",
    },
    opts = {
        workspaces = {
            {
                name = "main",
                path = "~/Shared/obsidian/main vault",
            },
        },
        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 0,
        },
    },
}
