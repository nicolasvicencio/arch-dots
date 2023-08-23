local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"wbthomason/packer.nvim",
	"bluz71/vim-nightfly-guicolors",
	"Shatur/neovim-ayu",
	"EdenEast/nightfox.nvim",
	"sainnhe/sonokai",
	"sainnhe/everforest",
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	"rose-pine/neovim",
	"rmehri01/onenord.nvim",
	"xiyaowong/transparent.nvim", -- :TransparentEnable to activate
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	"kdheepak/lazygit.nvim", -- gui for git thingsseu
	"mbbill/undotree", -- branch your changes in the current file
	"mg979/vim-visual-multi", -- multicursors
	"RRethy/vim-illuminate", -- iluminate words and references in the current file <a-p> <a-n> to move
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"norcalli/nvim-colorizer.lua", -- colorize the... colors
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"ThePrimeagen/harpoon", -- move between file blazingly fast
	"szw/vim-maximizer", -- maximizes and restores current window
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"numToStr/Comment.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"simrat39/rust-tools.nvim",
	"voldikss/vim-floaterm",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"ray-x/lsp_signature.nvim", -- show all kind of info for function a classes
	"Exafunction/codeium.vim", -- copilot for poor people
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	"christoomey/vim-tmux-navigator",
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}, -- enhanced lsp uis
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},
	{
		"laytan/tailwind-sorter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
		build = "cd formatter && npm i && npm run build",
		config = true,
	},
}

require("lazy").setup(plugins, {})
