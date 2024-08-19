return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"python",
			"c",
			"lua",
			"comment",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline"
		},
		auto_install = true,
		highlight = {
			enable = true
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<M-i>", -- set to `false` to disable one of the mappings
				node_incremental = "<M-i>",
				scope_incremental = false,
				node_decremental = "<M-I>",
			}
		}
	}
}
