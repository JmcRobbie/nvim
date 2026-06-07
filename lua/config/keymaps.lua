-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- set tab to go to next buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
--set shift tab to go to next window (split)
vim.api.nvim_set_keymap("n", "<S-Tab>", ":wincmd w<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("OpenInPreview", function()
  vim.cmd("silent !open -a Preview.app " .. vim.fn.shellescape(vim.fn.expand("%:p")))
end, {})
vim.api.nvim_set_keymap("n", "<leader>P", ":silent !open -a Preview.app %<CR>", { noremap = true, silent = true })

-- Notebook/Molten keybindings (VS Code-like)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>cc", "<cmd>MoltenEvaluateOperator<CR>", { desc = "Run cell", noremap = true })
vim.keymap.set("v", "<leader>cc", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Run selection", noremap = true })
vim.keymap.set("n", "<leader>c<CR>", "<cmd>MoltenEvaluateOperator<CR>", { desc = "Run cell", noremap = true })
vim.keymap.set("n", "<leader>ca", "<cmd>MoltenEvaluate<CR>", { desc = "Run all cells", noremap = true })
vim.keymap.set("n", "<leader>co", "<cmd>MoltenDelete<CR>", { desc = "Clear cell output", noremap = true })
vim.keymap.set("n", "<leader>ci", "<cmd>MoltenInfo<CR>", { desc = "Kernel info", noremap = true })
vim.keymap.set("n", "<leader>cs", "<cmd>MoltenShowOutput<CR>", { desc = "Show output", noremap = true })
