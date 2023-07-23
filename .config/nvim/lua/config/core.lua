--Window Customizations
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cul = true

-- Buffer Customizations
vim.opt.autoindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamed"

--Global Customization
vim.opt.lazyredraw = true

-- Shell Customization
vim.opt.shell = "zsh"

--nvim notify
local status, notify = pcall(require, "notify")
if not status then
	print("Nvim Notify is not installed")
else
	vim.notify = require("notify")
end

notify.setup({
	fps = 60,
	stages = "slide",
	timeout = 2500,
})
