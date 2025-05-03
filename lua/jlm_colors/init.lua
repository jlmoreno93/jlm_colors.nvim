local colors = require("jlm_colors.colors")
local config = require("jlm_colors.config")
local utils = require("jlm_colors.utils")
local bufferline = require("jlm_colors.integrations.bufferline")
local cmp = require("jlm_colors.integrations.cmp")
local telescope = require("jlm_colors.integrations.telescope")
local theme = {} -- teste

local function set_terminal_colors()
	vim.g.terminal_color_0 = colors.bg
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.ltBlue
	vim.g.terminal_color_3 = colors.yellowDark
	vim.g.terminal_color_4 = colors.white
	vim.g.terminal_color_5 = colors.tan
	vim.g.terminal_color_6 = colors.dkBlue
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.fgInactive
	vim.g.terminal_color_9 = colors.red
	vim.g.terminal_color_10 = colors.tan
	vim.g.terminal_color_11 = colors.tan
	vim.g.terminal_color_12 = colors.white
	vim.g.terminal_color_13 = colors.red
	vim.g.terminal_color_14 = colors.tan
	vim.g.terminal_color_15 = colors.comment
	vim.g.terminal_color_background = colors.bg
	vim.g.terminal_color_foreground = colors.fg
end

local function set_groups()
	for color, hex in pairs(config.palette_overrides) do
		colors[color] = hex
	end

	local bg = config.transparent and "NONE" or colors.bg

	local groups = {
		-- base
		Normal = { fg = colors.fg, bg = bg },
		LineNr = { fg = colors.fgLineNr },
		ColorColumn = { bg = utils.shade(colors.dkBlue, 0.5, colors.bg) },
		Conceal = {},
		Cursor = { fg = colors.bg, bg = colors.fg },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = colors.bgDark },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = colors.ltBlue },

		DiffAdd = { bg = "#181827" },
		DiffChange = { bg = "#2d251e" },
		DiffDelete = { bg = "#2c1313" },
		DiffText = { underline = true },

		EndOfBuffer = { fg = colors.fgLineNr },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = colors.error },
		VertSplit = { fg = colors.border, bg = bg },
		Winseparator = { link = "VertSplit" },
		SignColumn = { link = "Normal" },
		Folded = { fg = colors.fg, bg = colors.bgDark },
		FoldColumn = { link = "SignColumn" },
		IncSearch = { bg = utils.shade(colors.tan, 0.90, colors.bg), fg = colors.bgDark },
		Substitute = { link = "IncSearch" },
		CursorLineNr = { fg = colors.ltGray },
		MatchParen = { fg = colors.black, bg = colors.ltBlue },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		-- MsgSeparator = {},
		MoreMsg = { fg = colors.white },
		NonText = { fg = utils.shade(colors.bg, 0.30) },
		NormalFloat = { link = "Normal" },
		NormalNC = { link = "Normal" },
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { link = "CursorLine" },
		PmenuSbar = { bg = utils.shade(colors.white, 0.5, colors.bg) },
		PmenuThumb = { bg = utils.shade(colors.bg, 0.20) },
		Question = { fg = colors.white },
		QuickFixLine = { fg = colors.white },
		SpecialKey = { fg = colors.symbol },
		StatusLine = { fg = colors.fg, bg = bg },
		StatusLineNC = { fg = colors.fgInactive, bg = colors.bgDark },
		TabLine = { bg = colors.bgDark, fg = colors.fgInactive },
		TabLineFill = { link = "TabLine" },
		TabLineSel = { bg = colors.bg, fg = colors.fgAlt },
		Search = { link = "IncSearch" },
		SpellBad = { undercurl = true, sp = colors.dkBlue },
		SpellCap = { undercurl = true, sp = colors.white },
		SpellLocal = { undercurl = true, sp = colors.tan },
		SpellRare = { undercurl = true, sp = colors.tan },
		Title = { fg = colors.white },
		Visual = { bg = utils.shade(colors.bgDark, 0.90) },
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = colors.warn },
		Whitespace = { fg = colors.symbol },
		WildMenu = { bg = colors.bgDark },
		Comment = { fg = colors.comment, italic = config.italics.comments or true },

		Constant = { fg = colors.ltGray },
		String = { fg = colors.ltBlue, italic = config.italics.strings or false },
		Character = { fg = colors.ltBlue },
		Number = { fg = colors.ltGray, bold = true },
		Boolean = { fg = colors.dkBlue, italic = true },
		Float = { link = "Number" },

		Identifier = { fg = colors.fg },
		Function = { fg = colors.tan },
		Method = { fg = colors.tan },
		Property = { fg = colors.white },
		Field = { link = "Property" },
		Parameter = { fg = colors.fg },
		Statement = { fg = colors.dkBlue },
		Conditional = { fg = colors.dkBlue },
		-- Repeat = {},
		Label = { fg = colors.white },
		Operator = { fg = colors.red },
		Keyword = { link = "Statement", italic = config.italics.keywords or false },
		Exception = { fg = colors.tan },

		PreProc = { link = "Keyword" },
		-- Include = {},
		Define = { fg = colors.tan },
		Macro = { link = "Define" },
		PreCondit = { fg = colors.dkBlue },

		Type = { fg = colors.fg },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { fg = colors.dkBlue },
		Punctuation = { fg = colors.symbol },
		Special = { fg = colors.symbol },

		SpecialChar = { fg = colors.tan },
		Tag = { fg = colors.tan },
		Delimiter = { fg = colors.symbol },
		-- SpecialComment = {},
		Debug = { fg = colors.tan },

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = colors.bg },
		Error = { link = "ErrorMsg" },
		Todo = { fg = colors.tan, bold = true },

		-- LspReferenceText = {},
		-- LspReferenceRead = {},
		-- LspReferenceWrite = {},
		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "Error" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticErrorLn = { fg = colors.error, bg = utils.shade(colors.error, 0.5, colors.bg) },
		DiagnosticWarnLn = { fg = colors.warn, bg = utils.shade(colors.warn, 0.5, colors.bg) },
		DiagnosticInfoLn = { fg = colors.info, bg = utils.shade(colors.info, 0.5, colors.bg) },
		DiagnosticHintLn = { fg = colors.hint, bg = utils.shade(colors.hint, 0.5, colors.bg) },
		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warn },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },
		-- DiagnosticFloatingError = {},
		-- DiagnosticFloatingWarn = {},
		-- DiagnosticFloatingInfo = {},
		-- DiagnosticFloatingHint = {},
		-- DiagnosticSignError = {},
		-- DiagnosticSignWarn = {},
		-- DiagnosticSignInfo = {},
		-- DiagnosticSignHint = {},

		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		["@text"] = { fg = colors.fg },
		["@texcolors.literal"] = { link = "Property" },
		-- ["@texcolors.reference"] = {},
		["@texcolors.strong"] = { link = "Bold" },
		["@texcolors.italic"] = { link = "Italic" },
		["@texcolors.title"] = { link = "Keyword" },
		["@texcolors.uri"] = { fg = colors.ltBlue, sp = colors.ltBlue, underline = true },
		["@texcolors.underline"] = { link = "Underlined" },
		["@symbol"] = { fg = colors.symbol },
		["@texcolors.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = colors.ltGray },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.separator.keyvalue"] = { fg = colors.dkBlue },

		["@texcolors.diff.add"] = { fg = colors.ltBlue },
		["@texcolors.diff.delete"] = { fg = colors.redDark },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constancolors.builtin"] = { link = "Keyword" },
		-- ["@constancolors.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = utils.shade(colors.yellowDark, 0.45) },
		["@string.special"] = { fg = utils.shade(colors.yellowDark, 0.45) },
		["@string.special.url"] = { underline = true },
		-- ["@character"] = {},
		-- ["@character.special"] = {},
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		-- ["@float"] = {},
		["@function"] = { link = "Function", italic = config.italics.functions or false },
		["@function.call"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		-- ["@function.macro"] = {},
		["@parameter"] = { link = "Parameter" },
		["@method"] = { link = "Function" },
		["@field"] = { link = "Property" },
		["@property"] = { fg = colors.tan },
		["@constructor"] = { link = "@punctuation.bracket" },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = { fg = colors.ltGray, italic = config.italics.variables or false },
		["@variable.builtin"] = { fg = colors.ltGray, italic = config.italics.variables or false },
		["@type"] = { fg = colors.tan },
		["@type.definition"] = { fg = colors.fg },
		["@type.builtin"] = { fg = colors.tan },
		["@type.qualifier"] = { fg = colors.tan },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { fg = colors.tan },
		["@tag"] = { link = "Tag" },
		["@_tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.dkBlue },
		["@tag.attribute"] = { fg = colors.dkBlue },
		["@attribute"] = { link = "Attribute" },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { fg = colors.ltBlue },
		["@markup.link.label"] = { underline = false },
		["@none"] = { fg = colors.ltGray },

		-- Specific languages
		-- overrides
		["@label.json"] = { fg = colors.dkBlue }, -- For json
		["@label.help"] = { link = "@texcolors.uri" }, -- For help files
		["@texcolors.uri.html"] = { underline = true }, -- For html

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@text" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@label" },
		["@lsp.type.decorator"] = { link = "@label" },
		["@lsp.typemod.function.declaration"] = { link = "@function" },
		["@lsp.typemod.function.readonly"] = { link = "@function" },
	}

	-- integrations
	groups = vim.tbl_extend("force", groups, cmp.highlights())
	groups = vim.tbl_extend("force", groups, telescope.highlights())

	-- overrides
	groups =
		vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

function theme.setup(values)
	setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })

	theme.bufferline = { highlights = {} }
	theme.bufferline.highlights = bufferline.highlights(config)
end

function theme.colorscheme()
	if vim.version().minor < 8 then
		vim.notify("Neovim 0.8+ is required for jlm_colors colorscheme", vim.log.levels.ERROR, { title = "Min Theme" })
		return
	end

	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
	vim.o.termguicolors = true
	vim.g.colors_name = "jlm_colors"

	set_terminal_colors()
	set_groups()
end

return theme
