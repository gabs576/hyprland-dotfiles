return {
	{
		"MeanderingProgrammer/dashboard.nvim",
		event = "VimEnter",
    dependencies = {
      { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
    },
		config = function()
			require("dashboard").setup({
				autokeys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				header = require('ascii').art.text.neovim.sharp,
				date_format = nil,
				directories = {
					"~/.config/nvim",
					"~/Golang",
					"~/.config/hypr",
					"~/.config/waybar",
				},
				footer = {},
				bo = {
					bufhidden = "wipe",
					buflisted = false,
					filetype = "dashboard",
					swapfile = false,
				},
				wo = {
					cursorcolumn = false,
					cursorline = false,
					number = false,
					relativenumber = false,
					spell = false,
					statuscolumn = "",
					wrap = false,
				},
				on_load = function(path) end,
				highlight_groups = {
					header = "Constant",
					icon = "Type",
					directory = "Delimiter",
					hotkey = "Statement",
				},
			})
		end,
	},
}
