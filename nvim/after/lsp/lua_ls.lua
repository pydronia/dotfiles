-- add lua/ to root markers

---@type vim.lsp.Config
return {
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		"lua/",
		".git",
	},
}
