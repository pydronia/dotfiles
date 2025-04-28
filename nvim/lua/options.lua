---------------
-- Base Options
---------------
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.tabstop = 3
opt.shiftwidth = 3

-- After indent plugin
-- opt.list = true
-- opt.listchars = { tab = "▏ ", trail = "·", extends = "❭", precedes = "❬", nbsp = "+" }

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

-- After LSP Setup
-- opt.signcolumn = <something>
-- vim.diagnostic.config....

-------------------
-- General Mappings
-------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>")

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
