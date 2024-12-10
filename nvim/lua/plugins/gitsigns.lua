return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(l, r, desc)
				vim.keymap.set("n", l, r, { desc = desc, buffer = bufnr })
			end

			map("<leader>hp", gitsigns.preview_hunk, "Preview hunk")
			map("<leader>hb", function() gitsigns.blame_line{full=true} end, "Blame line")
		end
	}
}
