local colorscheme = "catppuccin"

require("catppuccin").setup({
	transparent_background = true,
});

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

