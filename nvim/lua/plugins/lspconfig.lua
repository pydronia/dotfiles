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
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					-- disableOrganizeImports = true,
				},
			}
		})

		-- ruff
		lspconfig.ruff.setup({
			capabilities = capabilities,
		})

		-- gopls
		lspconfig.gopls.setup({
			capabilities = capabilities
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
				if client == nil then
					return
				elseif client.name == "ruff" then
					client.server_capabilities.hoverProvider = false
				end

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
				-- TODO: Many of these keybinds will be set by default in 0.11
				define_keymap_if_capable(
					"textDocument/codeAction",
					"LSP: Code Action",
					{ "n", "v" },
					"gra",
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
					"grr",
					vim.lsp.buf.references)
				define_keymap_if_capable(
					"textDocument/remane",
					"LSP: Rename",
					"n",
					"grn",
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
					"<C-s>",
					vim.lsp.buf.signature_help)
				define_keymap_if_capable(
					"textDocument/typeDefinition",
					"LSP: Type Definition",
					"n",
					"gy",
					vim.lsp.buf.type_definition)

				-- Format on save
				if client.supports_method("textDocument/formatting") then
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
