local setup, lspsignature = pcall(require, "lsp-signature")
if not setup then
	return
end

lspsignature.setup()
