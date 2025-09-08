return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		local macchiato = require("catppuccin.palettes").get_palette("macchiato")

		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get_theme({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "#000000" },
					},
					mocha = {
						background = { fg = macchiato.text },
					},
					latte = {
						background = { fg = "#000000" },
					},
				},
			}),
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
