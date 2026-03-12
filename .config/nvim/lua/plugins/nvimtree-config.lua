return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
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
