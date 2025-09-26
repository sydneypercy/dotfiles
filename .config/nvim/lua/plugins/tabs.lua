return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = {

				indicator = {
					style = "underline",
				},
				show_buffer_close_icons = false,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
