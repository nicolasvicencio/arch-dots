local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

neotree.setup({
	enable_git_status = false,
	close_if_last_window = true,
	window = {
		position = "right",
		width = 30,
	},
	default_component_configs = {
		indent = {
			indent_size = 2,
			with_markers = false,
		},
		icon = {
			folder_open = "▼",
			folder_closed = "►",
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
		},
	},
})
