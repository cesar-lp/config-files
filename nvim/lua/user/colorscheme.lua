vim.cmd "colorscheme default"

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("Error setting " .. colorscheme .. " theme")
  return
end
