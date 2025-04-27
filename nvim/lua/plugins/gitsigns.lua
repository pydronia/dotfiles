return {
	"lewis6991/gitsigns.nvim",
	event = { "BufNewFile", "BufRead" },
	opts = {
		attach_to_untracked = true,
		on_attach = function(bufnr)
			-- Setup keymaps
		end,
	}
}
