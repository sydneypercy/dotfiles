local thing = {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()

		local ft  = require("guard.filetype")
		ft("lua"):fmt("lsp"):append("stylua"):lint("selene")
		ft("cpp"):fmt("clang-format")
	end,
}

return thing
