return {
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local tsc = require("telescope")

			tsc.setup({
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
					},
				},
			})

			tsc.load_extension("file_browser")
		end,
	},
}
