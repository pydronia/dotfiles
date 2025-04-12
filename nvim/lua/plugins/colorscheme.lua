return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local hslutil = require("solarized-osaka.hsl")
		local hsl = hslutil.hslToHex

		require("solarized-osaka").setup({
			transperant = false,

			-- Color overrides
			on_colors = function(colors)
				-- Fix dark colors
				local darker = hsl(192, 100, 3)
				colors.base04 = darker
				colors.bg_popup = darker
				colors.bg_sidebar = darker
				colors.bg_float = darker
			end,
		})

		vim.cmd.colorscheme("solarized-osaka")
	end,
}
