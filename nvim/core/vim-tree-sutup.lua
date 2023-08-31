vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "U", action = "cd" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 400,
  },
  filters = {
    custom = { }
  },
})
