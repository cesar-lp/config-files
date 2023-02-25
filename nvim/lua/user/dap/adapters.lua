local M = {}

local status, dap = pcall(require, "dap")
if not status then
  vim.notify("Error requiring dap")
  return
end

local status_ok, dapgo = pcall(require, "dap-go")
if not status_ok then
	vim.notify("Error requiring dap-go")
	return
end

M.setup = function()
  dapgo.setup()

  dap.adapters.lldb = {
    type = 'executable',
    -- El de abajo no lo encuentra
    --[[ command = '/usr/bin/lldb-vscode', ]]
    -- El de abajo lo ejecuta pero rompe por algo de la arq
    --[[ command = '/home/cp/.vscode/extensions/llvm-org.lldb-vscode-0.1.0/bin/lldb-vscode', ]] 
    command = '/usr/bin/lldb-vscode-14',
    name = 'lldb'
  }

  -- C++
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},

      -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
      --
      --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      --
      -- Otherwise you might get the following error:
      --
      --    Error on launch: Failed to attach to the target process
      --
      -- But you should be aware of the implications:
      -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
      runInTerminal = false,
    },
  }

  -- C
  dap.configurations.c = dap.configurations.cpp

  -- Rust
  dap.configurations.rust = dap.configurations.cpp

  -- Golang
  dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = { nil, stdout },
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }

    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print("dlv exited with code", code)
      end
    end)

    assert(handle, "Error running dlv: " .. tostring(pid_or_err))

    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require("dap.repl").append(chunk)
        end)
      end
    end)

    vim.defer_fn(function()
      callback({ type = "server", host = "127.0.0.1", port = port })
    end, 100)
  end

  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  }
end

return M
