local setup, hologramnvim = pcall(require, "hologram")
if not setup then
	return
end

hologramnvim.setup({
	auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
})
