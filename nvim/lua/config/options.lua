----------------
-- Basic Options
----------------
local opt = vim.opt

opt.termguicolors = true

opt.number = true

opt.cursorline = true

opt.list = true
opt.listchars = {tab = "  ", trail = "·", extends = "❭", precedes = "❬", nbsp = "+"}

opt.wrap = false

opt.tabstop = 3
opt.shiftwidth = 3

opt.clipboard = "unnamedplus"

opt.sidescrolloff = 8
opt.scrolloff = 4

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

-- Filetype Config
vim.treesitter.language.register("bash", "zsh")

-- Netrw Config
vim.g.netrw_liststyle = 3
