local M = {}

function M.get_table_size(tb)
	local const = 0

	for key, value in pairs(tb) do
		const = const + 1
	end

	return const
end

return M
