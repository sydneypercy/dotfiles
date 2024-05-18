local thing = {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("lsp"):append("stylua")
		ft("cpp"):fmt("clang-format")

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_formatter = false,
		})
	end,
}

return thing
