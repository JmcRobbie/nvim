local M = {}

function M.hex_to_ascii(hex)
  local ascii = ""
  for hex_byte in hex:gmatch("%x%x") do
    ascii = ascii .. string.char(tonumber(hex_byte, 16))
  end
  return ascii
end
function M.ascii_to_hex(ascii)
  local hex = ""
  for i = 1, #ascii do
    hex = hex .. string.format("%02x", ascii:byte(i))
  end
  return hex
end

function M.get_word_under_cursor()
  -- Get the current cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Get the line at the current cursor position
  local line = vim.api.nvim_get_current_line()
  -- Find the boundaries of the word under the cursor
  local start_col = col
  while start_col > 0 and line:sub(start_col, start_col):match("%w") do
    start_col = start_col - 1
  end
  local end_col = col
  while end_col <= #line and line:sub(end_col + 1, end_col + 1):match("%w") do
    end_col = end_col + 1
  end
  -- Extract the word under the cursor
  local word = line:sub(start_col + 1, end_col)
  return word, start_col, end_col
end

-- Function to replace the currently selected text with the ASCII conversion
function M.replace_visual_selection()
  local selected_text, _, _ = M.get_word_under_cursor()
  local converted_text = M.hex_to_ascii(selected_text)
  print(selected_text .. "->" .. converted_text)
  vim.cmd('normal! gv"_d')
  vim.fn.setreg('"', converted_text)
  vim.cmd("normal! P")
end
function M.printVisualText()
  local selected_text, _, _ = M.get_word_under_cursor()
  print(M.hex_to_ascii(selected_text))
end
function M.testSayHello()
  print("Hello from hex2ascii, this is a test")
end
function M.replaceHex2Ascii()
  local selected_text = M.get_word_under_cursor()
  local converted_text = M.hex_to_ascii(selected_text)
  print(selected_text .. "->" .. converted_text)
  -- check if converted text is not empty
  if converted_text == "" then
    print("No conversion")
    return
  end
  M.replaceWord(selected_text, converted_text)
end

function M.replaceAscii2Hex()
  local selected_text = M.get_word_under_cursor()
  local converted_text = M.ascii_to_hex(selected_text)
  print(selected_text .. "->" .. converted_text)
  -- check if converted text is not empty
  if converted_text == "" then
    print("No conversion")
    return
  end
  M.replaceWord(selected_text, converted_text)
end
function M.replaceWord(selectedText, replaceText)
  local bfnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()
  local newline = line:gsub(selectedText, replaceText)
  vim.api.nvim_buf_set_lines(bfnr, cursor[1] - 1, cursor[1], false, { newline })
end

function M.setup(opts)
  opts = opts or {}
  -- Show the visual text
  vim.keymap.set("n", "<Leader>hs", function()
    M.printVisualText()
  end, { desc = "Show the visual text" })
  -- test command
  vim.keymap.set("n", "<Leader>ht", function()
    M.testSayHello()
  end, { desc = "Test command" })
  -- Replace the selected text with the ASCII conversion
  vim.keymap.set("n", "<Leader>ha", function()
    M.replaceHex2Ascii()
  end, { desc = "Replace text with Ascii" })
  -- Replace the selected text with the ASCII conversion
  vim.keymap.set("n", "<Leader>hh", function()
    M.replaceAscii2Hex()
  end, { desc = "Replace text with Hex" })
end

return M
