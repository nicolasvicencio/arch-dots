local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- disabling backup
opt.backup = false
opt.cmdheight = 0

--tabs & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false
opt.swapfile = false
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.fillchars:append({ eob = " " })
