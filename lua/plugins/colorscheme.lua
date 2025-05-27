return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").load("wave")

        vim.cmd [[
          highlight Normal guibg=NONE ctermbg=NONE
          highlight NormalNC guibg=NONE ctermbg=NONE
          highlight EndOfBuffer guibg=NONE ctermbg=NONE
          highlight VertSplit guibg=NONE ctermbg=NONE
          highlight SignColumn guibg=NONE ctermbg=NONE
          highlight LineNr guibg=NONE ctermbg=NONE
          highlight FoldColumn guibg=NONE ctermbg=NONE
        ]]
	end,
}
