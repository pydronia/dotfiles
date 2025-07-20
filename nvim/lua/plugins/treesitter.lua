return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {
			ensure_installed = {
				"python",
				"go",
				"hcl",
				"bash",
				"comment",
				"c",
				"ledger",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"regex",
			},
			auto_install = true,
			highlight = {
				enable = true,
				disable = {
					"tmux", -- https://github.com/Freed-Wu/tree-sitter-tmux/issues/20
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
			indent = {
				enable = true,
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]p"] = "@parameter.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]P"] = "@parameter.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[p"] = "@parameter.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[P"] = "@parameter.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 3,
			min_window_height = 25,
			multiline_threshold = 1,
		},
	},
}
