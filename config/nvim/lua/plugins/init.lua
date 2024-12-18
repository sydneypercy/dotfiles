return {
	-- ggame
	"ThePrimeagen/vim-be-good",
	--themes
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "deep",
			})
		end,
	},
	{
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "palenight"
			require("material").setup({
				contrast = {
					terminal = true, -- Enable contrast for the built-in terminal
					sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
					floating_windows = true, -- Enable contrast for floating windows
					cursor_line = false, -- Enable darker background for the cursor line
					non_current_windows = false, -- Enable darker background for non-current windows
					filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
				},
				styles = { -- Give comments style such as bold, italic, underline etc.
					comments = { --[[ italic = true ]]
					},
					strings = { --[[ bold = true ]]
					},
					keywords = { italic = true },
					functions = { --[[ bold = true, undercurl = true ]]
					},
					variables = {},
					operators = {},
					types = {},
				},

				plugins = { -- Uncomment the plugins that you use to highlight them
					-- Available plugins:
					"dap",
					"dashboard",
					-- "gitsigns",
					-- "hop",
					"indent-blankline",
					-- "lspsaga",
					-- "mini",
					-- "neogit",
					"nvim-cmp",
					"nvim-navic",
					"nvim-tree",
					"nvim-web-devicons", -- "sneak", "telescope",
					-- "trouble",
					"which-key",
				},

				disable = {
					colored_cursor = false, -- Disable the colored cursor
					borders = true, -- Disable borders between verticaly split windows
					background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
					term_colors = false, -- Prevent the theme from setting terminal colors
					eob_lines = true, -- Hide the end-of-buffer lines
				},

				high_visibility = {
					lighter = false, -- Enable higher contrast text for lighter style
					darker = true, -- Enable higher contrast text for darker style
				},

				lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

				async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

				custom_colors = nil, -- If you want to everride the default colors, set this to a function

				custom_highlights = {}, -- Overwrite highlights with your own
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		dependencies = "akinsho/bufferline.nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "macchiato",
				},
				compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
				transparent_background = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = { "italic" },
					functions = {},
					keywords = { "bold" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = { "italic" },
					operators = { "bold" },
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
					treesitter = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					notify = true,
					dashboard = true,
					mason = true,
					which_key = true,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
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
	{
		"rcarriga/nvim-notify",
		config = function()
			notify = require("notify")
			vim.notify = notify
			notify.setup({
				fps = 60,
				stages = "slide",
				timeout = 2500,
			})
		end,
	},
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
		opts = {
			plugins = {
				options = {
					laststatus = 0,
				},
			},
		},
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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
}
