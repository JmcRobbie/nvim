-- Disable markdown linters (markdownlint/vale from LazyVim's lang.markdown extra)
local specs = {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
      return opts
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    opts = {
      file_types = { "markdown", "Avante" },
      render_modes = true, -- render in ALL modes (normal, insert, visual, command)
      anti_conceal = {
        enabled = true, -- reveal raw syntax only on the line the cursor is on
      },
      sign = {
        enabled = false, -- no sign column noise
      },
      code = {
        enabled = true,
        sign = false,
        style = "full",
        position = "left",
        width = "block",
        border = "thin",
      },
      heading = {
        enabled = true,
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        width = "full",
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
      link = {
        enabled = true,
        hyperlink = "󰌹 ",
        highlight = "RenderMarkdownLink",
      },
      table = {
        enabled = true,
        style = "full",
        cell = "padded",
      },
      dash = {
        enabled = true,
        icon = "─",
        width = "full",
      },
      quote = {
        enabled = true,
        icon = "▋",
      },
    },
  },
}

return specs
