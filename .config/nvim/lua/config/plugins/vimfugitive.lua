local setup, vimfugitive = pcall(require, "vim-fugitive")
if not setup then
	return
end

vimfugitive.setup()
