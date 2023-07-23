local tsc = require("telescope")

tsc.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
})

tsc.load_extension("file_browser")
