return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Find text in project > ") })
		end)
		vim.keymap.set("n", "<leader>pr", function()
			require("telescope.builtin").live_grep({
				additional_args = function()
					return { "--pcre2" }
				end,
			})
		end, { desc = "Live grep with PCRE2" })
	end,
}
