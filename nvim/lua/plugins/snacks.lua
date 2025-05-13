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
		{ "<leader>sa", function() Snacks.picker() end, desc = "Find files" }
	}
}
