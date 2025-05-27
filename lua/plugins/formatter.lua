return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					php = { "phpcbf" },
                    tpl = { "phpcbf" },
					blade = { "blade-formatter" },
				},
			})

			vim.keymap.set("n", "<leader>f", function()
				conform.format()
			end)
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup()
		end,
	},
}
