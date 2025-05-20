local M = {}

function M.unique(arr)
	local result = {}
	local seen = {}
	for _, val in ipairs(arr) do
		if not seen[val] then
			table.insert(result, val)
			seen[val] = true
		end
	end
	return result
end

return M
