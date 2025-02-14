-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Ensure the 'autocmds' group is created to prevent duplicate definitions
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Create an autocommand for formatting PHP files with Pint on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("pint_format"),
  pattern = "*.php",
  callback = function()
    -- Execute Pint on the current file
    vim.fn.system("./vendor/bin/pint " .. vim.fn.expand("%:p"))
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "env",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
