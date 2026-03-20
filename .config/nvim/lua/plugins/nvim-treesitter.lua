return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.install({ "python", "rust", "cpp", "lua", "javascript", "typescript", "html" })
		--treesitter.setup({
		--	highlight = { enable = true },
		--	indent = { enable = true },
		--	autotag = {
		--		enable = true,
		--	},
		--	ensure_installed = { "python", "rust", "cpp", "latex", "lua", "javascript", "typescript" },
		--})
	end,
}
