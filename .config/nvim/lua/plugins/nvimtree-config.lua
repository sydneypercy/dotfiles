return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				adaptive_size = true,
			},
			renderer = {
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						folder = {
							arrow_closed = "→",
							arrow_open = "↘",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
					},
				},
				group_empty = false,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
