return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- Register a window style for lazyjira (mirrors the lazygit style)
    Snacks.config.style("lazyjira", {})
  end,
  keys = {
    {
      "<leader>jj",
      function()
        if vim.fn.executable("lazyjira") == 1 then
          Snacks.terminal({ "lazyjira" }, {
            win = { style = "lazyjira" },
          })
        else
          vim.notify("lazyjira is not installed or not in PATH", vim.log.levels.ERROR)
        end
      end,
      desc = "Lazyjira",
    },
  },
}
