return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local hslutil = require("solarized-osaka.hsl")
		local hsl = hslutil.hslToHex

		require("solarized-osaka").setup({
			transparent = true,

			-- Color overrides
			on_colors = function(colors)
				-- Fix dark colors
				local darker = hsl(192, 100, 3)
				colors.base04 = darker
				colors.bg_popup = darker
				colors.bg_sidebar = darker
				colors.bg_float = darker
			end,

			-- Highlight overrides
			on_highlights = function(hl, c)
				hl.CursorLine = { bg = hsl(192, 100, 8), sp = c.base1 }

				hl.Visual = { bg = c.base02 }
				hl.VisualNOS = { bg = c.base02 }

				hl.MatchParen = { fg = c.red100, bg = c.base02, bold = true }

				hl.LspInlayHint = { fg = "#354246" }

				-- IBL
				hl.IblScope = { fg = c.violet700, nocombine = true }
			end
		})

		vim.cmd.colorscheme("solarized-osaka")
	end,
}
