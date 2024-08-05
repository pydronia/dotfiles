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
		}
	}
}
