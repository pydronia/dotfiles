return {
	"echasnovski/mini.files",
	lazy = false,
	version = false,
	keys = {
		{ "<leader>e", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end, desc = "File Explorer" },
	},
	opts = {
		windows = {
			preview = true
		}
	},
}
