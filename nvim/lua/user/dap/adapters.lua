local M = {}

local status, dap = pcall(require, "dap")
if not status then
  vim.notify("Error requiring dap")
  return
end

M.setup = function()
  dap.adapters.lldb = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.vscode/extensions/llvm-org.lldb-vscode-0.1.0/bin/lldb-vscode',
    name = 'lldb'
  }
end

return M
