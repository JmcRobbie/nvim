return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        sizing_strategy = "auto",
      },
      html = {
        enabled = false,
      },
      css = {
        enabled = false,
      },
    },
    max_width = 100,
    max_height = 30,
    max_width_window_percentage = 80,
    max_height_window_percentage = 80,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "neo-tree", "undotree", "gundo" },
  },
}
