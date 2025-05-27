vim.opt.signcolumn = "yes"

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"vimls",
				"phpactor",
                "intelephense",
				"stimulus_ls",
                "eslint",
				"ts_ls",
				"cssls",
				"emmet_ls",
				"jsonls",
				"vue_ls",
                "cssmodules_ls"
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local masonPath = vim.fn.expand("$MASON")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
							-- library = vim.api.nvim_get_runtime_file("", true)
						},
					})
				end,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.phpactor.setup({
				capabilities = capabilities,
				filetypes = { "php", "tpl" },
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = { "php", "tpl" },
			})
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.vimls.setup({
				capabilities = capabilities,
				vimls = {
					initializationOptions = {
						isNeovim = true,
					},
				},
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = masonPath .. "/packages/vue-language-server/node_modules/@vue/language-server",
							languages = { "vue" },
						},
					},
				},
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
				init_options = {
					vue = {
						hybridMode = true,
					},
					typescript = {
						tsdk = masonPath .. "/packages/vue-language-server/node_modules/typescript/lib/",
					},
				},
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssmodules_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
