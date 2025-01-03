return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show all items, including hidden ones
        show_hidden_count = true, -- Display the count of hidden items
        hide_dotfiles = false, -- Do not hide dotfiles
        hide_gitignored = true, -- Hide gitignored files
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
        },
        never_show = {},
      },
    },
  },
}
