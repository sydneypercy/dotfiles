return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = { "python", "rust", "cpp", "latex", "lua", "javascript", "typescript" },
		})
	end,
}
