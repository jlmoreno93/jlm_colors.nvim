local colors = require("jlm_colors.colors")

local M = {}

function M.highlights()
	return {
		TelescopeTitle = { bold = true, link = "Normal" },
		TelescopeSelection = { bold = true, fg = colors.white, bg = colors.bgDark },
		TelescopeResultsNormal = { bold = true, fg = colors.ltGray },
		TelescopeMatching = { fg = colors.red },
		TelescopeNormal = { link = "Normal" },
	}
end

return M
