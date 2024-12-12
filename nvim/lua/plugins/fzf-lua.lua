return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Fzf Resume"},
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fzf Files"},
		{ "<leader>fg", "<cmd>FzfLua live_grep_glob<cr>", desc = "Fzf Live Grep (Glob)"},
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Fzf cword"},
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Fzf buffers"},
	}
}
