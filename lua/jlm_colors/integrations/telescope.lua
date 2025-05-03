local colors = require("jlm_colors.colors")

local M = {}

function M.highlights()
	return {
		TelescopeTitle = { bold = true, link = "Normal" },
		TelescopeSelection = { bold = true, link = "Normal" },
		TelescopeMatching = { fg = colors.dkBlue },
		TelescopeNormal = { link = "Comment" },
	}
end

return M
