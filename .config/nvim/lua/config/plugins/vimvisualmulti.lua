local setup, vimvisualmulti = pcall(require, "vim-visual-multi")
if not setup then
	return
end

vimvisualmulti.setup()
