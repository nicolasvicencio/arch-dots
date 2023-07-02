local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- disabling backup
opt.backup = false

--tabs & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
opt.wrap = false
opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.fillchars:append({ eob = " " })

vim.api.nvim_create_autocmd("ColorScheme", {
	once = true,
	callback = vim.schedule_wrap(function()
		vim.cmd([[
            hi FloatBorder guibg=none
            hi NormalFloat guibg=none

            " telescope
            hi TelescopeBorder guibg=none
            hi TelescopeTitle guibg=none

            " tressitter
            hi TreesitterContext guibg=none
            hi TreesitterContextLineNumber guifg=orange

            " barbar - current buffer
            hi BufferCurrent guibg=none guifg=orange
            hi BufferCurrentADDED guibg=none
            hi BufferCurrentCHANGED guibg=none
            hi BufferCurrentDELETED guibg=none
            hi BufferCurrentERROR guibg=none
            hi BufferCurrentHINT guibg=none
            hi BufferCurrentIcon guibg=none
            hi BufferCurrentIndex guibg=none
            hi BufferCurrentINFO guibg=none
            hi BufferCurrentMod guibg=none
            hi BufferCurrentNumber guibg=none
            hi BufferCurrentSign guibg=none
            hi BufferCurrentSignRight guibg=none
            hi BufferCurrentTarget guibg=none
            hi BufferCurrentWARN guibg=none

            " barbar - inactive buffer
            hi BufferInactive guibg=none
            hi BufferInactiveADDED guibg=none
            hi BufferInactiveCHANGED guibg=none
            hi BufferInactiveDELETED guibg=none
            hi BufferInactiveERROR guibg=none
            hi BufferInactiveHINT guibg=none
            hi BufferInactiveIcon guibg=none
            hi BufferInactiveIndex guibg=none
            hi BufferInactiveINFO guibg=none
            hi BufferInactiveMod guibg=none
            hi BufferInactiveNumber guibg=none
            hi BufferInactiveSign guibg=none
            hi BufferInactiveSignRight guibg=none
            hi BufferInactiveTarget guibg=none
            hi BufferInactiveWARN guibg=none

            " barbar - tabline
            hi BufferTabpageFill ctermbg=none
        ]])
	end),
	group = vim.api.nvim_create_augroup("customcolorscheme", {}),
})
