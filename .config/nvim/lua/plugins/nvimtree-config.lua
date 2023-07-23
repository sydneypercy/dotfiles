return {
	"nvim-tree/nvim-tree.lua",
	tag = "nightly",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				adaptive_size = true,
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
