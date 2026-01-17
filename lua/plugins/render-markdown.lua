-- Markdown rendering in Neovim
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "Avante" },
  opts = {
    file_types = { "markdown", "Avante" },
    -- Render markdown automatically when opening .md files
    render_modes = { "n", "c" }, -- normal and command mode
    -- Enable various markdown features
    code = {
      enabled = true,
      sign = true,
      style = "full",
      position = "left",
      width = "block",
    },
    heading = {
      enabled = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰱒 " },
    },
  },
}
