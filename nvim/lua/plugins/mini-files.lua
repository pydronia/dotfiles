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
	config = function(_, opts)
		local minifiles = require("mini.files")
		minifiles.setup(opts)

		vim.api.nvim_create_autocmd("User", {
			desc = "Add rounded corners",
			pattern = "MiniFilesWindowOpen",
			callback = function(args)
				vim.api.nvim_win_set_config(args.data.win_id, { border = "rounded" })
			end,
		})
	end
}
