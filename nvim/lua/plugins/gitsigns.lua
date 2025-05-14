return {
	"lewis6991/gitsigns.nvim",
	event = { "BufNewFile", "BufRead" },
	opts = {
		on_attach = function(bufnr)
			-- Setup keymaps
			local gitsigns = require("gitsigns")

			-- Navigation
			vim.keymap.set("n", "]h", function() gitsigns.nav_hunk("next") end, { desc = "Next hunk" })
			vim.keymap.set("n", "[h", function() gitsigns.nav_hunk("prev") end, { desc = "Next hunk" })

			-- Text Object
			vim.keymap.set({"o", "x"}, "ih", gitsigns.select_hunk, { desc = "hunk" })

		end,
	}
}
