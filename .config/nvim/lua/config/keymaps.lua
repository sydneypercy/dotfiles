NORMAL = "n"
INSERT = "i"
VISUAL = "v"
COMMAND = "c"

vim.g.mapleader = " "

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
	["<leader>/"] = { mode = { NORMAL }, "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find" } },
	["<leader>ff"] = { mode = { NORMAL }, "<cmd> Telescope fd<cr>", { desc = "Find files" } },
	["<leader>fr"] = { mode = { NORMAL }, "<cmd> Telescope oldfiles<cr>", { desc = "Find recent files" } },
	["<leader>fn"] = { mode = { NORMAL }, "<cmd>enew<cr>", { desc = "New File" } },
	["<leader>bf"] = { mode = { NORMAL }, "<cmd>Telescope buffers<cr>", { desc = "Find buffer" } },
	["<leader>bp"] = { mode = { NORMAL }, "<cmd>BufferLinePick<cr>", { desc = "Pick a buffer to choose" } },
	["<leader>bd"] = { mode = { NORMAL }, "<cmd>BufferLinePickClose<cr>", { desc = "Pick a buffer to close" } },
	["<leader>E"] = { mode = { NORMAL }, "<cmd>NvimTreeToggle<cr>", { desc = "Open explorer" } },
	["<leader>ht"] = { mode = { NORMAL }, "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" } },
	["<leader>CRp"] = { mode = { NORMAL }, "<cmd>CompetiTest receive problem<cr>", { desc = "Recieve problem" } },
	["<leader>CRc"] = { mode = { NORMAL }, "<cmd>CompetiTest receive contest<cr>", { desc = "Recieve contest" } },
	["<leader>CRt"] = { mode = { NORMAL }, "<cmd>CompetiTest receive testcases<cr>", { desc = "Recieve testcases" } },
	["<leader>Cr"] = { mode = { NORMAL }, "<cmd>CompetiTest run<cr>", { desc = "Run testcases" } },
	["<leader>Ca"] = { mode = { NORMAL }, "<cmd>CompetiTest add_testcase<cr>", { desc = "Add Testcases" } },
	["<leader>th"] = { mode = { NORMAL }, "<cmd>Telescope colorscheme<cr>", { desc = "Change colorscheme" } },
	["<leader>db"] = { mode = { NORMAL }, "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
	["<leader>dt"] = { mode = { NORMAL }, "<cmd>DapTerminate<cr>", { desc = "Terminate Debuggin Session" } },
	["<leader>dc"] = { mode = { NORMAL }, "<cmd>DapContinue<cr>", { desc = "Start Debugging / Continue Breakpoint" } },
})
