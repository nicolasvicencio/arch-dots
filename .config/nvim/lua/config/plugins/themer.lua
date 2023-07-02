local setup, themer = pcall(require, "themer")
if not setup then
	return
end

themer.setup({ enable_installer = true })
