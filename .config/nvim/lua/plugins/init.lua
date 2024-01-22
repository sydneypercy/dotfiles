return {
	-- ggame
	"ThePrimeagen/vim-be-good",

	--themes
	"navarasu/onedark.nvim",
	"marko-cerovac/material.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		dependencies = "akinsho/bufferline.nvim",
	},

	--Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Trouble.nvim
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},

	--gitsigns
	{
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To  the latest release (do not  this if you run Neovim nightly or dev builds!)
		config = function()
			require("gitsigns").setup()
		end,
	},

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
		"folke/zen-mode.nvim",
		"folke/twilight.nvim",
		opts = {},
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
			require("colorizer").setup()
		end,
	},
}
