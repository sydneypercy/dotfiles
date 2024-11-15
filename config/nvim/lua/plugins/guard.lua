local thing = {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("lsp"):append("stylua")
		ft("cpp"):fmt("clang-format")

		ft("typescript,javascript,html,css,scss,json,jsonc"):fmt({
			cmd = "npx",
			args = { "prettier", "--tab-width", "4", "--trailing-comma", "none", "--stdin-filepath" },
			fname = true,
			stdin = true,
		})

		vim.g.guard_config = {
			fmt_on_save = true,
			lsp_as_default_formatter = false,
		}
	end,
}

return thing
