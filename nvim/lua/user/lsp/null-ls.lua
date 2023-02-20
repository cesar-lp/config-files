local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Error requiring null-ls")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		extra_filetypes = {"toml"},
		-- Remove extra_args in case of local prettierrc
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	},
	-- formatting.black.with { extra_args = { "--fast"}},
	-- formatting.sylua,
	-- formatting.google_java_format,
	-- diagnostics.flake8
})
