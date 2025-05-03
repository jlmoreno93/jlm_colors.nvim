local colors = require("jlm_colors.colors")

local M = {}

function M.highlights()
	return {
		TelescopeTitle = { bold = true, fg = colors.red },
		TelescopeMatching = { fg = colors.dkBlue },
		TelescopeSelection = { fg = colors.comment, bold = true },
	}
end

return M
