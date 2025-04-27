-- Diagnostic setup

-- Enable all lsp servers in nvim/lsp
local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true)):map(function(file)
	return file:match("/lsp/(.+)%.lua")
end):totable()
vim.lsp.enable(servers)
