----------------
-- Basic Options
----------------
local opt = vim.opt

opt.spelllang = { "en_au", "cjk" }

opt.termguicolors = true

opt.number = true

opt.cursorline = true

opt.list = true
opt.listchars = { tab = "▏ ", trail = "·", extends = "❭", precedes = "❬", nbsp = "+" }

opt.wrap = false

opt.tabstop = 3
opt.shiftwidth = 3

opt.clipboard = "unnamedplus"

opt.sidescrolloff = 8
opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.wildmode = "longest:full,full"

-- Filetype Config
vim.treesitter.language.register("bash", "zsh")

-- Netrw Config
vim.g.netrw_liststyle = 3

-- Diagnostic config (:h vim.diagnostic.Opts)
opt.signcolumn = "number"
vim.diagnostic.config({
	underline = true, -- Can also set severity levels
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.ERROR] = " ",
		}
	},
	severity_sort = true
})

-------------------
-- Custom Variables
-------------------
-- Toggle if files should format on save (if there's an LSP with formatting support)
vim.g.format_on_save = true

-----------
-- Global Mappings
-----------
vim.g.mapleader = " "

-- Refresh, clear highlight and diff (like default CTRL-L)
vim.keymap.set('n', '<F5>', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>')

-- Accept completion and close wildmenu
vim.keymap.set("c", "<CR>", function()
	return vim.fn.wildmenumode() == 1 and "<Down>" or "<CR>"
end, { expr = true })
-- Reverse arrow keys in command-line tab completion
vim.keymap.set("c", "<Left>", function()
	return vim.fn.wildmenumode() == 1 and "<Up>" or "<Left>"
end, { expr = true })
vim.keymap.set("c", "<Right>", function()
	return vim.fn.wildmenumode() == 1 and "<Down>" or "<Right>"
end, { expr = true })
vim.keymap.set("c", "<Up>", function()
	return vim.fn.wildmenumode() == 1 and "<Left>" or "<Up>"
end, { expr = true })
vim.keymap.set("c", "<Down>", function()
	return vim.fn.wildmenumode() == 1 and "<Right>" or "<Down>"
end, { expr = true })
