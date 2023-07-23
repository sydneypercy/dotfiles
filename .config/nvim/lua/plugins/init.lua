return {
	-- ggame
	"ThePrimeagen/vim-be-good",

	--Faster load times
	"lewis6991/impatient.nvim",

	--themes
	"navarasu/onedark.nvim",
	"marko-cerovac/material.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		dependencies =
		"akinsho/bufferline.nvim"
	},

	--Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	--Statuslines and winbar
	{ "SmiteshP/nvim-navic",             dependencies = { "neovim/nvim-lspconfig" } },

	--LspConfig and Lspinstaller, and also the following configs beca why not

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},

	--null-ls
	"jose-elias-alvarez/null-ls.nvim",

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- startup

	--gitsigns
	{
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To  the latest release (do not  this if you run Neovim nightly or dev builds!)
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Code Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	-- luasnip
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	-- snippets
	"rafamadriz/friendly-snippets",

	-- lspkind
	"onsails/lspkind.nvim",

	-- telescope and its plugins
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-file-browser.nvim",

	-- xml-lua.vim
	"XeroOl/xml-lua.vim",

	--nvim-notify
	"rcarriga/nvim-notify",

	--surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to  `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	--lazygit
	"kdheepak/lazygit.nvim",

	--True zen
	{
		"loqusion/true-zen.nvim",
		config = function()
			require("true-zen").setup({
				mode = {},
			})
		end,
	},

	{
		"jakewvincent/texmagic.nvim",
		config = function()
			require("texmagic").setup({
				-- Config goes here; leave blank for defaults
			})
		end,
	},

	{
		"CRAG666/code_runner.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("code_runner").setup({
				filetype = {
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},
					python = "python3 -u",
					typescript = "deno run",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir$fileNameWithoutExt",
					},
				},
			})
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup()
		end,
	}
}
