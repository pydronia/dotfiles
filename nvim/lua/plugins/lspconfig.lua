return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Completion Capability setup (TODO: Possibly remove with 0.11)
		-- Remember to add this to every LSP you setup
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		---------------------------------
		-- Language Server Specific Setup
		---------------------------------

		-- lua_ls
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					hint = {
						enable = true
					}
				}
			}
		})

		-- pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		--------------------
		-- General LSP setup
		--------------------

		-- Some defaults are set by nvim, see :h lsp-defaults
		-- LspAttach Setup
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then return end

				-- Can modify handlers to adjust float visuals, close events, etc.
				-- See https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
				-- and :h lsp-handlers

				-- LSP Method setups
				-- Keymap convenience function
				local function define_keymap_if_capable(method, description, modes, keymap, command)
					if client.supports_method(method) then
						vim.keymap.set(modes, keymap, command, { buffer = args.buf, silent = true, desc = description })
					end
				end

				-- TODO: codeLens, documentHighlight, other util functions (:h lsp-util)
				define_keymap_if_capable(
					"textDocument/codeAction",
					"LSP: Code Action",
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action)
				define_keymap_if_capable(
					"textDocument/declaration",
					"LSP: Goto Declaration",
					"n",
					"gD",
					vim.lsp.buf.declaration)
				define_keymap_if_capable(
					"textDocument/definition",
					"LSP: Goto Definition",
					"n",
					"gd", vim.lsp.buf.definition)
				define_keymap_if_capable(
					"textDocument/implementation",
					"LSP: Goto Implementation",
					"n",
					"gI",
					vim.lsp.buf.implementation)
				define_keymap_if_capable(
					"textDocument/inlayHint",
					"LSP: Toggle Inlay Hints",
					"n",
					"<leader>ih",
					function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }),
							{ bufnr = 0 })
					end)
				define_keymap_if_capable(
					"textDocument/references",
					"LSP: References",
					"n",
					"gr",
					vim.lsp.buf.references)
				define_keymap_if_capable(
					"textDocument/remane",
					"LSP: Rename",
					"n",
					"<leader>rn",
					vim.lsp.buf.rename)
				define_keymap_if_capable(
					"textDocument/signatureHelp",
					"LSP: Signature Help",
					"n",
					"gK",
					vim.lsp.buf.signature_help)
				define_keymap_if_capable(
					"textDocument/signatureHelp",
					"LSP: Signature Help (Insert)",
					"i",
					"<C-h>",
					vim.lsp.buf.signature_help)
				define_keymap_if_capable(
					"textDocument/typeDefinition",
					"LSP: Type Definition",
					"n",
					"gy",
					vim.lsp.buf.type_definition)

				-- Format command and format on save (note, gq uses LSP formatting
				-- if supported by default. TODO: once ruff is setup, do some
				-- testing and potially delete this )
				if client.supports_method("textDocument/formatting") then
					if client.supports_method("textDocument/rangeFormatting") then
						-- :Format with visual mode support
						vim.api.nvim_buf_create_user_command(args.buf, "Format",
							function(cargs)
								vim.lsp.buf.format(cargs.range == 0 and { id = args.data.client_id } or {
									id = args.data.client_id,
									range = {
										["start"] = { cargs.line1, 0 },
										["end"] = { cargs.line2, 0 },
									}
								})
							end,
							{ desc = "LSP: Format", range = true })
					else
						-- :Format without visual mode support
						vim.api.nvim_buf_create_user_command(args.buf, "Format",
							function(_)
								vim.lsp.buf.format({ id = args.data.client_id })
							end,
							{ desc = "LSP: Format" })
					end

					-- Setup format on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							if vim.g.format_on_save then
								vim.notify("Formatting file...", vim.log.levels.INFO)
								vim.lsp.buf.format({
									async = false,
									id = args.data.client_id
								})
							end
						end
					})
				end
			end
		})
	end
}
