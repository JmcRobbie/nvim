return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  dependencies = { "3rd/image.nvim" },
  ft = { "python", "markdown" },
  init = function()
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = true
    vim.g.molten_virt_text_output = false
    vim.g.molten_show_mimetype_debug = false
  end,
  keys = {
    {
      "<leader>rc",
      ":MoltenEvaluateOperator<CR>",
      desc = "Evaluate operator (molten)",
      mode = "n",
    },
    {
      "<leader>rc",
      ":<C-u>MoltenEvaluateVisual<CR>",
      desc = "Evaluate visual (molten)",
      mode = "v",
    },
    {
      "<leader>re",
      ":MoltenReevaluateCell<CR>",
      desc = "Reevaluate cell (molten)",
    },
    {
      "<leader>rr",
      ":MoltenReevaluate<CR>",
      desc = "Reevaluate all cells (molten)",
    },
    {
      "<leader>ro",
      ":MoltenDelete<CR>",
      desc = "Delete output (molten)",
    },
    {
      "<leader>ri",
      ":MoltenInfo<CR>",
      desc = "Kernel info (molten)",
    },
    {
      "<leader>rl",
      ":MoltenShowOutput<CR>",
      desc = "Show output (molten)",
    },
  },
}
