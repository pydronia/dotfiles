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

			-- Keybinds
			vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
			vim.keymap.set("n", "<leader>hB", gitsigns.blame, { desc = "Blame file" })
			-- TODO: Reset hunk keybind (+ confirm dialogue)
		end,
	}
}
