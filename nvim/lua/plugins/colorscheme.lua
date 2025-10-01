return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local hslutil = require("solarized-osaka.hsl")
			local hsl = hslutil.hslToHex

			require("solarized-osaka").setup({
				transparent = false,

				-- Color overrides
				on_colors = function(colors)
					-- Fix dark colors
					local darker = hsl(192, 100, 3)
					colors.base04 = darker
					colors.bg_popup = darker
					colors.bg_sidebar = darker
					colors.bg_float = darker
				end,

				-- Custom Highlights
				---@param hl table
				on_highlights = function(hl, c)
					hl.MatchParen = { fg = c.red100, bold = true }

					-- LSP Highlights
					hl.LspReferenceText = { bg = c.cyan900 }
					hl.LspReferenceRead = { bg = c.cyan900 }
					hl.LspReferenceWrite = { bg = c.cyan900 }
					hl.LspReferenceTarget = { bg = c.cyan900 }

					-- Tresitter overrides
					hl["@module"] = { link = "Directory" }
					hl["@comment.todo"] = { fg = c.todo, bold = true }

					-- Treesitter Context
					hl.TreesitterContext = { bg = c.base03 }
					hl.TreesitterContextBottom = { sp = c.base01, underline = true }

					-- Indent guides
					hl.SnacksIndent = { fg = c.base02, nocombine = true }

					-- mini.files
					hl.MiniFilesNormal = { fg = c.base0, bg = c.bg }
					hl.MiniFilesBorder = { fg = c.yellow700, bg = c.bg }
				end,
			})

			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"catppuccin/nvim", name = "catppuccin"
	}
}
