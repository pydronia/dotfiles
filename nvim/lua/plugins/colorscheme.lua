return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local hslutil = require("solarized-osaka.hsl")
		local hsl = hslutil.hslToHex

		require("solarized-osaka").setup({
			transparent = false,
			on_colors = function(colors)
				colors.base04 = hsl(192, 100, 3)
			end,
		})

		vim.cmd.colorscheme("solarized-osaka")
	end,
}
