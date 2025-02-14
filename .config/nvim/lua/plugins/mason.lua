return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "shellcheck",
        "shfmt",
        "php-debug-adapter",
        "intelephense",
      },
    },
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:icefed/mason-registry",
        },
      })
    end,
  },
}
