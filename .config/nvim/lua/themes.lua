--THEMEEEEEEEEEEEEE ily iris <3
vim.g.material_style = "palenight"

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
		telescope = true,
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
		"nvim-web-devicons",
		-- "sneak",
		"telescope",
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

require("onedark").setup({
	style = "deep",
})

vim.cmd.colorscheme("catppuccin-macchiato")
