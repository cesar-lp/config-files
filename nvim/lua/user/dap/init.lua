local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify("Error requiring dap")
	return
end

local status_ok, neodev = pcall(require, "neodev")
if not status_ok then
	vim.notify("Error requiring neodev")
	return
end

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	vim.notify("Error requiring dapui")
	return
end

local status_ok, nvimdapvirtualtext = pcall(require, "nvim-dap-virtual-text")
if not status_ok then
	vim.notify("Error requiring nvim-dap-virtual-text")
	return
end

nvimdapvirtualtext.setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.keymap.set("n", "@", ":lua require 'dap'.step_over()<cr>")
  vim.keymap.set("n", "#", ":lua require 'dap'.step_into()<cr>")
  vim.keymap.set("n", "$", ":lua require 'dap'.step_out()<cr>")
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

neodev.setup({
  library = {
    plugins = {
      "nvim-dap-ui"
    },
    types = true
  }
})

--[[ vim.keymap.set("n", "<F5>", ":lua require 'dap'.continue()<cr>") ]]
--[[ vim.keymap.set("n", "<F10>", ":lua require 'dap'.step_over()<cr>") ]]
--[[ vim.keymap.set("n", "<F11>", ":lua require 'dap'.step_into()<cr>") ]]
--[[ vim.keymap.set("n", "<F12>", ":lua require 'dap'.step_out()<cr>") ]]
--[[ vim.keymap.set("n", "<leader>b", ":lua require 'dap'.toggle_breakpoint()<cr>") ]]
--[[ vim.keymap.set("n", "<leader>B", ":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint conidition: '))<cr>") ]]
--[[ vim.keymap.set("n", "<leader>lp", ":lua require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>") ]]
--[[ vim.keymap.set("n", "<leader>dr", ":lua require 'dap'.repl.open()<cr>") ]]

vim.fn.sign_define("DapBreakpoint", { text = "❌", texthl = "Yellow", linehl = "", numhl = "Yellow" })
vim.fn.sign_define("DapStopped", { text = "☕", texthl = "Green", linehl = "ColorColumn", numhl = "Green" })

require("user.dap.adapters").setup()
