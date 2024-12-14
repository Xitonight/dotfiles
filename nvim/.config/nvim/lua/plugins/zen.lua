return {
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
					width = 90,
					height = 0.8,
					options = {
						number = false,
						relativenumber = false,
					},
				},
				plugins = {
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
						-- statusline will be shown only if 'laststatus' == 3
						laststatus = 3, -- turn off the statusline in zen mode
					},
					twilight = { enabled = true },
					tmux = { enabled = true },
					-- - allow_remote_control socket-only
					-- - listen_on unix:/tmp/kitty
					kitty = {
						enabled = true,
						font = "+4", -- font size increment
					},
				},
			})
			vim.keymap.set("n", "<leader>zm", function()
				vim.cmd("NvimTreeToggle")
				require("zen-mode").toggle()
			end, {})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
