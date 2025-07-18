return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Add custom config here or in after/lsp
		-- NOTE: Config merging may be changed in the future: https://github.com/neovim/neovim/issues/33577
		vim.api.nvim_set_hl(0, "@lsp.type.comment.lua", {}) -- Disable comment semantic tokens for lua

		-- Enable LSP servers (see :h lspconfig-all)
		vim.lsp.enable({
			"lua_ls",
			"ruff",
			"pyright",
			"gopls",
			"terraformls",
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lspattach", {}),
			desc = "Configure LSP features",
			callback = function(args)
				local function buffer_map(lhs, rhs, opts, mode)
					opts = vim.tbl_extend("error", opts, { buffer = args.buf })
					vim.keymap.set(mode or "n", lhs, rhs, opts)
				end

				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				local buflocal_group = vim.api.nvim_create_augroup("lsp-buflocal", { clear = false })
				local methods = vim.lsp.protocol.Methods

				if client:supports_method(methods.textDocument_documentHighlight) then
					vim.api.nvim_create_autocmd({ "CursorHold" }, {
						buffer = args.buf,
						group = buflocal_group,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
						buffer = args.buf,
						group = buflocal_group,
						callback = vim.lsp.buf.clear_references,
					})
				end

				-- Default keybinds:
				-- - gra: code actions
				-- - grn: rename
				-- - CTRL-S: signature help
				if client:supports_method(methods.textDocument_declaration) then
					buffer_map("gD", Snacks.picker.lsp_declarations, { desc = "LSP: Declaration" })
				end
				if client:supports_method(methods.textDocument_definition) then
					buffer_map("gd", Snacks.picker.lsp_definitions, { desc = "LSP: Definition" })
				end
				if client:supports_method(methods.textDocument_documentSymbol) then
					buffer_map("gO", Snacks.picker.lsp_symbols, { desc = "LSP: Document Symbols" })
				end
				if client:supports_method(methods.textDocument_implementation) then
					buffer_map("gri", Snacks.picker.lsp_implementations, { desc = "LSP: Implementations" })
				end
				if client:supports_method(methods.textDocument_references) then
					buffer_map("grr", Snacks.picker.lsp_references, { desc = "LSP: References" })
				end
				if client:supports_method(methods.textDocument_typeDefinition) then
					buffer_map("gy", Snacks.picker.lsp_type_definitions, { desc = "LSP: Type Definitions" })
				end
				if client:supports_method(methods.workspace_symbol) then
					buffer_map("gW", Snacks.picker.lsp_workspace_symbols, { desc = "LSP: Workspace Symbols" })
				end

				if client:supports_method(methods.textDocument_inlayHint) then
					buffer_map("<leader>ci", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
							{ bufnr = args.buf }
						)
					end, { desc = "LSP: Toggle Inlay Hints" })
				end

				-- Clear any buffer autocommands on detach
				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("lspdetach", { clear = true }),
					callback = function(args2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "lsp-buflocal", buffer = args2.buf })
					end,
				})
			end,
		})
	end,
}
