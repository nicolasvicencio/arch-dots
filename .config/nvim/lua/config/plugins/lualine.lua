local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local M = {}
M.theme = function()
	local colors = {
		darkgray = "#16161d",
		gray = "#727169",
		innerbg = nil,
		outerbg = "#494d64",
		normal = "#8aadf4",
		insert = "#a6da95",
		visual = "#c6a0f6",
		replace = "#ed8796",
		command = "#e6c384",
	}
	return {
		inactive = {
			a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
			b = { fg = colors.gray, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
		visual = {
			a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
			b = { fg = colors.visual, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
		replace = {
			a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
			b = { fg = colors.replace, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
		normal = {
			a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
			b = { fg = colors.normal, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
		insert = {
			a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
			b = { fg = colors.insert, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
		command = {
			a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
			b = { fg = colors.command, bg = colors.outerbg },
			c = { fg = colors.gray, bg = colors.innerbg },
		},
	}
end

local ayu = require("lualine.themes.ayu_mirage")
local cattpuccin = require("lualine.themes.catppuccin-macchiato")
local custom = M.theme() -- This is macchiato with transparencies

lualine.setup({
	options = {
		theme = custom,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
