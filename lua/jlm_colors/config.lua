local config = {
	defaults = {
		transparent = false,
		italics = {
			comments = true,
			keywords = true,
			functions = true,
			strings = false,
			variables = false,
			bufferline = false,
		},
		overrides = {},
		palette_overrides = {},
	},
}

setmetatable(config, { __index = config.defaults })

return config
