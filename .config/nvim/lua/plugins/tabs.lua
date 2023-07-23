return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	version = "v3.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		Opt = nil

		if vim.cmd([[colorscheme]]) == "catppuccin" then
			Opt = require("catppuccin.groups.integrations.bufferline").get()
		end

		vim.opt.termguicolors = true

		require("bufferline").setup({
			options = {
				highlights = Opt,
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
