local utils = require("utils")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = {
			indent = {
				enabled = true,
				char = "▏", -- ▏,▎,│
			},
			scope = {
				enabled = true,
				char = "▎",
			},
			animate = {
				enabled = false,
			},
		},
		input = { enabled = true },
		picker = {
			sources = {
				files = {
					hidden = true,
				},
				grep = {
					hidden = true,
				},
				commands = {
					layout = {
						preset = "vscode",
					},
				},
				help = {
					confirm = {
						action = "help",
						cmd = "vsplit",
					},
				},
				pickers = {
					layout = {
						preset = "select",
					},
				},
			},
		},
	},
	keys = {
		-- Pickers
		{
			"<leader><space>",
			function()
				Snacks.picker.files({ dirs = utils.unique(vim.lsp.buf.list_workspace_folders()) })
			end,
			desc = "Find all files (workspace)",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep({ dirs = utils.unique(vim.lsp.buf.list_workspace_folders()) })
			end,
			desc = "Grep all files (workspace)",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},

		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},

		{
			"<leader>pF",
			function()
				Snacks.picker.files()
			end,
			desc = "Find all files (cwd)",
		},
		{
			"<leader>pG",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep all files (cwd)",
		},
		{
			"<leader>pc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>pp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>pH",
			function()
				Snacks.picker.help()
			end,
			desc = "Help pages",
		},
		{
			"<leader>pr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent files",
		},
		{
			"<leader>pR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume last picker",
		},
		{
			"<leader>pa",
			function()
				Snacks.picker()
			end,
			desc = "All pickers",
		},

		-- Git
		{
			"<leader>gr",
			function()
				Snacks.gitbrowse.open({ what = "repo" })
			end,
			desc = "Open remote repo",
		},
		{
			"<leader>gf",
			function()
				Snacks.gitbrowse.open({ what = "file" })
			end,
			mode = { "n", "v" },
			desc = "Open remote file",
		},
		-- TODO: Open commit of current line blame
	},
}
