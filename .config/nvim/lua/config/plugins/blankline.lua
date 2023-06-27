local setup, blankline = pcall(require, "indent_blankline")
if not setup then
	return
end

blankline.setup({
	char = ".",
	show_current_context = true,
	show_trailing_blankline_indent = false,
})
