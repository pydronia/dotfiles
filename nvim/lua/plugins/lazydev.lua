return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			{ path = "snacks.nvim", words = { "Snacks", "snacks" } },
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
