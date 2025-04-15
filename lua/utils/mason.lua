local M = {}

function M.bin_path()
	return vim.fn.stdpath('data') .. '/mason/bin/'
end

return M
