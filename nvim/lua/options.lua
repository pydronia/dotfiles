-- Prepend mise shims to nvim's PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

---------------
-- Base Options
---------------
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes"

opt.cursorline = true

opt.tabstop = 3
opt.shiftwidth = 3

opt.list = true
opt.listchars = { tab = "> ", trail = "·", extends = "❭", precedes = "❬", nbsp = "+" }

opt.breakindent = true

opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.spelllang = { "en_au", "cjk" }
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.wildmode = "longest:full,full"
opt.confirm = true

opt.updatetime = 350
opt.timeoutlen = 500

opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.diagnostic.config({
	underline = true,
	virtual_text = { -- try out virtual text on current line
		current_line = true,
		source = "if_many",
		virt_text_pos = "eol_right_align",
	},
	virtual_lines = false,
	signs = false,
	float = {
		source = "if_many",
		border = "rounded",
	},
	update_in_insert = false,
	severity_sort = true,
	jump = {},
})

-------------------
-- General Mapings
-------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights on Esc
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>")

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

---------------
-- Autocommands
---------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("yankHighlight", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
