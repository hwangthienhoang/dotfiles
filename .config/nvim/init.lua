-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.vscode then
  -- Running VSCode extension, skip loading DAP config as VSCode had it's own debugging facilities
  -- and things break otherwise.
else
  -- ref: https://github.com/LazyVim/LazyVim/discussions/645
  -- the following settins assume you've installed the vscode-debug-php adapter using mason.nvim
  local dap = require("dap")
  dap.adapters.php = {
    type = "executable",
    command = "node",
    args = {
      vim.loop.os_homedir() .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
    },
  }
  -- Config for a VVV (Vagrant) WordPress site
  dap.configurations.php = {
    {
      type = "php",
      request = "launch",
      name = "Listen for VVV Xdebug",
      port = 9003,
      localSourceRoot = "/home/user/sites/vvv/www/",
      -- localSourceRoot = vim.fn.expand("%:p:h").."/",
      serverSourceRoot = "/srv/www/",
    },
  }
  dap.defaults.php.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }

  --  vim.api.nvim_set_keymap("n", "<leader><S-F5>", ":DapRestartFrame<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader><F5>", ":DapContinue<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<leader>da", function()
    require("dap").set_exception_breakpoints({ "Warning", "Error", "Exception" })
  end, { desc = "Stop on exceptions" }) -- TODO this one doesn't show on which-key

  vim.keymap.set("n", "<leader>dA", function()
    require("dap").set_exception_breakpoints({ "Notice", "Warning", "Error", "Exception" })
  end, { desc = "Stop on all" })

  vim.keymap.set("n", "<leader>d0", function()
    require("dap").set_exception_breakpoints({})
  end, { desc = "Stop on nothing" })

  --  vim.api.nvim_set_keymap("n", "<leader><C-S-F5>", ":DapTerminate<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<F10>", ":DapStepOver<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<F11>", ":DapStepInto<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<s-F11>", ":DapStepOut<CR>", { noremap = true, silent = true })
  --  vim.api.nvim_set_keymap("n", "<leader><F5>", ":DapContinue<CR>", { noremap = true })
  --  vim.api.nvim_set_keymap("n", "<F10>", ":DapUiToggle<CR>", { noremap = true })
  --require("dap.ext.vscode").load_launchjs(vim.fn.getcwd() .. "/.vscode/launch.json", {})  -- ???

  -- TODO Disable Autoformat ?
  -- https://github.com/LazyVim/LazyVim/issues/17#issuecomment-1554440802
  --
  -- For the default config, along with instructions on how to customize the settings
end
