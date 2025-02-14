return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = {
          {
            cmd = function()
              local pint_path = "./vendor/bin/pint"
              local php_cs_fixer_path = "./vendor/bin/php-cs-fixer"

              -- Check if Pint exists
              ---@diagnostic disable-next-line: undefined-field
              if vim.loop.fs_stat(pint_path) then
                return pint_path
              end

              -- Fallback to PHP CS Fixer if Pint doesn't exist
              ---@diagnostic disable-next-line: undefined-field
              if vim.loop.fs_stat(php_cs_fixer_path) then
                return php_cs_fixer_path
              end

              -- No formatter found
              return nil
            end,
            stdin = true,
          },
        },
      },
    },
  },
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" }, -- optional, improves startup time
  },
  {
    -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php_only",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      ---@diagnostic disable-next-line
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
}
