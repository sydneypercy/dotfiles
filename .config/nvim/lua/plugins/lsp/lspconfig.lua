return {
	"neovim/nvim-lspconfig",
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.config("*", { capabilities = capabilities })
	end,
}
