NORMAL = "n"
INSERT = "i"
VISUAL = "v"
COMMAND = "c"

local function keymaps(tbl)
	for i, val in pairs(tbl) do
		local mode = {}
		for _, mv in pairs(val.mode) do
			table.insert(mode, mv)
		end
		local key = i
		local gay = val[1]
		local opt = val[2] or {}
		vim.keymap.set(mode, key, gay, opt)
	end
end

local n = { noremap = true }
local s = { silent = true }
local ns = {
	noremap = true,
	silent = true,
}

vim.keymap.set("n", "<S-Up>", ":resize +3 <CR>", s)
vim.keymap.set("n", "<S-Down>", ":resize -3 <CR>", s)
vim.keymap.set("n", "<S-Right>", ":vertical resize -3 <CR>", s)
vim.keymap.set("n", "<S-Left>", ":vertical resize +3 <CR>", s)

--Bufferline keymaps
vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", ns)
vim.keymap.set("n", "<S-C-Tab>", "<cmd>BufferLineCyclePrev<CR>", ns)

keymaps({
	["<leader>fn"] = { mode = { NORMAL }, "<cmd>enew<cr>", { desc = "New File" } },
	["<leader>bp"] = { mode = { NORMAL }, "<cmd>BufferLinePick<cr>", { desc = "Pick a buffer to choose" } },
	["<leader>bd"] = { mode = { NORMAL }, "<cmd>BufferLinePickClose<cr>", { desc = "Pick a buffer to close" } },
	["<leader>E"] = { mode = { NORMAL }, "<cmd>NvimTreeToggle<cr>", { desc = "Open explorer" } },
	["<leader>db"] = { mode = { NORMAL }, "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
	["<leader>dt"] = { mode = { NORMAL }, "<cmd>DapTerminate<cr>", { desc = "Terminate Debuggin Session" } },
	["<leader>dc"] = { mode = { NORMAL }, "<cmd>DapContinue<cr>", { desc = "Start Debugging / Continue Breakpoint" } },
	["<C-d>"] = { mode = { NORMAL }, "<C-d>zz" },
	["<C-u>"] = { mode = { NORMAL }, "<C-u>zz" },
	["n"] = { mode = { NORMAL }, "nzzzv" },
	["N"] = { mode = { NORMAL }, "Nzzzv" },
})
