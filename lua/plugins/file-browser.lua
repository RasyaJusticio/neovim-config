return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function ()
        local telescope = require("telescope")

        vim.keymap.set("n", "<space>pb", function ()
            telescope.extensions.file_browser.file_browser()
        end)
    end
}
