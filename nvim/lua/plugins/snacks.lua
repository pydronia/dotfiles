return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
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
	},
	keys = {
		-- Pickers
		{ "<leader><space>", function()
			Snacks.picker.files({
				hidden = true,
				dirs = vim.lsp.buf.list_workspace_folders()
			})
		end, desc = "Find all files" },
		{ "<leader>/", function()
			Snacks.picker.grep({
				hidden = true,
				dirs = vim.lsp.buf.list_workspace_folders()
			})
		end, desc = "Grep all files" },
		{ "<leader>pa", function() Snacks.picker() end, desc = "All pickers" }
	}
}
