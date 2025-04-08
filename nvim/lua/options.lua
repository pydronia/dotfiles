---------------
-- Base Options
---------------
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.tabstop = 3
opt.shiftwidth = 3

opt.breakindent = true

-- After indent plugin
-- opt.list = true
-- opt.listchars = { tab = "▏ ", trail = "·", extends = "❭", precedes = "❬", nbsp = "+" }

opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.confirm = true

opt.spelllang = { "en_au", "cjk" }
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.wildmode = "longest:full,full"

opt.updatetime = 350
opt.timeoutlen = 500

-------------------
-- General Mappings
-------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
