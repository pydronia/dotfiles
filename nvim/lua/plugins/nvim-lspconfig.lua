return {
	"neovim/nvim-lspconfig",
	config = function()
		-- TODO: Diagnostic setup (but some could be in options?)

		-- Add custom config here or in after/lsp
		-- NOTE: Merging may be changed in the future: https://github.com/neovim/neovim/issues/33577
		vim.api.nvim_set_hl(0, "@lsp.type.comment.lua", {}) -- Disable comment semantic tokens for lua


		-- Enable LSP servers (see :h lspconfig-all)
		vim.lsp.enable({
			"lua_ls",
			"ruff",
			"pyright",
			"gopls",
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lspattach", {}),
			desc = "Configure LSP features",
			callback = function(args)
			end,
		})
	end
}
