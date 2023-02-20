local status_ok trouble = pcall(require, "trouble")
if not status_ok then
	vim.notify("Error requiring trouble")
	return
end

trouble.setup {
	height = 15
}
