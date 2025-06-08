return {
	"saghen/blink.cmp",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- Choose filetypes to disable on
		-- enabled = function() return not vim.tbl_contains({"markdown"}, vim.bo.filetype) end,

		keymap = {
			preset = "default",
			-- Add more keymaps here if neededed. See :h blink-cmp-config-keymap
			-- Make <C-n> work with ghost_text
			["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
		},

		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				auto_show = false,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = {
				enabled = true,
			},
		},

		-- fuzzy = {
		-- 	sorts = {
		-- 		-- Prioritise exact matches
		-- 		"exact",
		-- 		"score",
		-- 		"sort_text"
		-- 	}
		-- },

		-- This kinda acts weird, see how it feels in python
		-- signature = { enabled = true },

		sources = {
			-- might wanna add "omni" into here for ledger file?
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
