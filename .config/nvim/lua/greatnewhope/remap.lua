vim.g.mapleader = " "

-- Now you can exit insert mode with <C-c>
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Same as <Esc>' })

-- Open current folder
-- Toggle tree
vim.keymap.set("n", "<leader>pv", ':NvimTreeFindFileToggle<CR>', { desc = 'Open tree here' })

-- Lets you move blocks of highlighted code
-- up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move block up' })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = 'Move bock down' })

-- Overwrites halfpage jump so that cursor
-- stays in the middle of the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- This one keeps search terms in the middle
-- while you are searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever. For real
-- When you yank a word and paste it over a
-- section, keeps the original yanked text
-- instead of the removed one
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = 'Paste without yanking' })

-- Similar to the previous one, deletes
-- something but don't yank its deletion
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = 'Delete without yanking' })

-- Good remaps for yanking to the clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = 'Yank to clipboard' })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = 'Yank to clipboard' })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = 'Yank to clipboard' })

-- Opens a menu of file scope replacement
-- for the word currently under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor in file' })

-- Sneak into different windows
vim.keymap.set('n', "s", function ()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)
