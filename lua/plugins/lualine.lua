return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		icons_enabled = true,
		theme = "ayu_dark",
		sections = {
			-- other sections ...
			lualine_c = {
				-- other components ...
				function()
					return require("screenkey").get_keys()
				end,
			},
		},
	},
}
