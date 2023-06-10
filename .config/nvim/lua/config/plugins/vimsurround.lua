local setup, vimsurround = pcall(require, "vim-surround")
if not setup then
	return
end

vimsurround.setup()
