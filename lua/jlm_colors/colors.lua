local config = require("jlm_colors.config")
local mix = require("jlm_colors.utils").mix

-- bg = "#000000", -- black
-- fg = "#e0e0e0", -- white
-- symbol = "#e0e0e0", -- white
-- primary = "#4b7ba7", -- dkBlue
-- secondary = "#adb3b9", -- ltGray
-- white = "#adb3b9", -- ltGray
-- green = "#99bad9", -- ltBlue
-- greenLight = "#e0e0e0", -- white
-- orangeLight = "#e0c5ab", -- tan
-- orange = "#e0c5ab", -- tan
-- purple = "#e0c5ab", -- tan
-- warn = "#ffd589", -- dkTan

local colors = {

	-- background colors
	white = "#e0e0e0", --*
	black = "#000000", --*
	bg = "#000000", --*
	bgDark = "#232323",
	bgDarker = "#161616",
	bgFloat = "#000000",

	fg = "#e0e0e0", --*
	fgAlt = "#FEFEFE",
	fgCommand = "#FEFEFE",
	fgInactive = "#65737E",
	fgDisabled = "#505050",
	fgLineNr = "#505050",
	fgSelection = "#343434",
	fgSelectionInactive = "#505050",

	-- border colors
	border = "#505050",
	borderFocus = "#65737E",
	borderDarker = "#A0A0A0",

	-- ui colors
	red = "#b56060",
	comment = mix("#8b8b8b", "#000000", math.abs(0.90)),
	yellowDark = "#FFC799",
	purpleDark = mix("#65737E", "#000000", math.abs(0.80)),
	terminalbrightblack = "#343434",
	symbol = "#e0e0e0",

	dkBlue = "#4b7ba7",
	ltGray = "#adb3b9",
	ltBlue = "#99bad9",
	tan = "#e0c5ab",

	-- diagnostic colors
	error = "#FF8080",
	warn = "#ffd589",
	info = "#99FFE4",
	hint = "#65737E",
}

return colors
