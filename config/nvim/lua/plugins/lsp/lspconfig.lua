return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Mappings. See `:help vim.diagnostic.*` for documentation on any of the below functions local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<space>q", "<cmd>Trouble diagnostics<cr>", opts)

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					---@diagnostic disable-next-line: redefined-local
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})

			--if client == "ccls" then
			--	client.server_capabilities.documentFormattingProvider = false
			--	client.server_capabilities.documentRangeFormattingProvider = false
			--end

			if client.server_capabilities.documentSymbolProvider then
				require("nvim-navic").attach(client, bufnr)
			end
		end

		--diagnostics
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Setup lspconfig.
		--
		local lspconfig = require("lspconfig")

		local servers = {
			"ccls",
			"lua_ls",
			"pyright",
			"marksman",
			"rust_analyzer",
			"denols",
			"texlab",
			"cssls",
			"jsonls",
		}
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		for _, lsp in pairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
					capabilities = capabilities,
				},
			})
		end

		lspconfig["ccls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				highlight = {
					isRanges = true,
				},
				compilationDatabaseDirectory = "build",
				index = {
					threads = 12,
				},
				clang = {
					excludeArgs = { "-frounding-math" },
				},
				client = {
					snippetSupport = true,
				},
			},
		})

		lspconfig["lua_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						global = { "vim" },
						disable = { "undefined-global" },
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = { enable = false },
			},
		})

		lspconfig["ts_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("package.json"),
		})

		lspconfig["denols"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		lspconfig["texlab"].setup({
			cmd = { "texlab" },
			filetypes = { "tex", "bib" },
			settings = {
				texlab = {
					rootDirectory = nil,
					forwardSearch = {
						executable = "evince",
						args = { "%p" },
					},
				},
			},
		})
	end,
}
