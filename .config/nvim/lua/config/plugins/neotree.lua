return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
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
	end,
}
