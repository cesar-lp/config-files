local M = {}

local status, dap = pcall(require, "dap")
if not status then
  vim.notify("Error requiring dap")
  return
end

M.setup = function()
  dap.adapters.lldb = {
    type = 'executable',
    -- El de abajo no lo encuentra
    --[[ command = '/usr/bin/lldb-vscode', ]]
    -- El de abajo lo ejecuta pero rompe por algo de la arq
    --[[ command = '/home/cp/.vscode/extensions/llvm-org.lldb-vscode-0.1.0/bin/lldb-vscode', ]] 
    command = '/usr/bin/lldb-vscode-14',
    name = 'lldb'
  }
end

return M
