-- Diagnostic setup (settings)

-- Enable all lsp servers in nvim/lsp
local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true)):map(function(file)
	return file:match("/lsp/(.+)%.lua")
end):totable()
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my_lspattach", {}),
	desc = "Configure LSP",
	callback = function(args)
	end,
})
