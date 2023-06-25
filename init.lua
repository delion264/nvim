for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

-- vim.cmd ':highlight Normal guibg=NONE'
-- vim.cmd ':highlight NormalFloat guibg=NONE'
-- vim.cmd ':set nocursorline'
vim.cmd ':highlight Normal guibg=#0f0018'
vim.cmd ':highlight NormalNC guibg=#0f0018'
vim.cmd ':highlight NormalFloat guibg=#0f0018'
vim.cmd ':highlight Float guibg=#0f0018'
vim.cmd ':highlight FloatBorder guibg=#0f0018'
vim.cmd ':highlight StatusLine guibg=#1f0032'
vim.cmd ':highlight StatusLineNC guibg=#1f0032'
vim.cmd ':highlight CursorLine guibg=#0f0128'
vim.cmd ':highlight NeoTreeNormal guibg=#0f0018'
vim.cmd ':highlight NeoTreeNormalNC guibg=#0f0018'
vim.cmd ':highlight NeoTreeTabInactive guibg=#0f0018'
vim.cmd ':highlight NeoTreeTabSeparatorInactive guifg=#0f0018 guibg=#0f0018'
vim.cmd ':highlight NeoTreeTabSeparatorActive guifg=#0f0018 guibg=#0f0018'
vim.cmd ':highlight NeoTreeCursorLine guibg=#0f0132'
vim.cmd ':highlight TelescopePromptNormal guibg=#0f0018'
vim.cmd ':highlight TelescopeResultsNormal guibg=#0f0018'
vim.cmd ':highlight TelescopeSelection guibg=#1f0032'
vim.cmd ':highlight TelescopePreviewLine guibg=#1f0032'
vim.cmd ':highlight TabLine guibg=#0f0018'
vim.cmd ':highlight TabLineFill guibg=#0f0018'
vim.cmd ':highlight WinBar guibg=#0f0018'
vim.cmd ':highlight WinBarNC guibg=#0f0018'
vim.cmd ':highlight stlabb2bf_NONE_bolditalic gui=bold'
vim.cmd ':highlight TelescopeNormal guibg=#0f0018'
vim.cmd ':highlight TelescopeBorder guibg=#0f0018'
vim.cmd ':highlight TelescopeSelection guibg=#0f0018'
vim.cmd ':highlight TelescopePreviewNormal guibg=#0f0018'
vim.api.nvim_command("hi! def link NvimTree Normal")

-- transparent backgrounds
vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    local groups = {
      "SignColumn",
      "GitSignsAdd",
      "GitSignsChange",
      "GitSignsDelete",
      "Pmenu",
      "PmenuSel",
      "PmenuSbar",
      "TabLine",
      "TabLineFill",
      "WhichKeyFloat",
      "WinSeparator",
    }

    for _, group in ipairs(groups) do
      vim.cmd("hi " .. group .. " guibg=#0f0018")
    end

    return true
  end,
  desc = "Transparent backgrounds",
})
