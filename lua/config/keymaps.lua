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
