vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

--Bare Essentials
require("lazy").setup("plugins")
require("config")
require("themes")
require("keymaps")
--Special to neovide
if vim.g.neovide then
	vim.o.guifont = "Iosevka NFM:h12"
end
