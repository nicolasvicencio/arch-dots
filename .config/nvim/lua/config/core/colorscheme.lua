local status, _ = pcall(vim.cmd, "colorscheme ayu-mirage")
if not status then
	print("Colorscheme not found")
	return
end
