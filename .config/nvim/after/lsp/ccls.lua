return {
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
}
