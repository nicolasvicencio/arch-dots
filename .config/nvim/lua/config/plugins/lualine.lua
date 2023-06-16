local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local ayu = require("lualine.themes.ayu_mirage")

lualine.setup({
	options = {
		theme = ayu,
	},
})
