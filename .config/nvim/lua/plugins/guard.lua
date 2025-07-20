local thing = {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("lsp"):append("stylua")
		ft("c,cpp"):fmt({
			cmd = "clang-format",
			args = { "-style={BasedOnStyle: LLVM,IndentWidth: 4}" },
			stdin = true,
		})

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
