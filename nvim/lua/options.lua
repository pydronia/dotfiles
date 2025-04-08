---------------
-- Base Options
---------------
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.tabstop = 3
opt.shiftwidth = 3

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.spelllang = { "en_au", "cjk" }
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.wildmode = "longest:full,full"

-------------------
-- General Mappings
-------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
