vim.g.mapleader = " "

-- GLOBAL KEYMAPS ------------------------------------------------------------
------------------------------------------------------------------------------
-- Now you can exit insert mode with <C-c>
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Same as <Esc>' })

-- Lets you move blocks of highlighted code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move block up' })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = 'Move bock down' })

-- Overwrites halfpage jump so that cursor stays in the middle of the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- This one keeps search terms in the middle while you are searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- GREATEST REMAPS OF ALL TIME
-- When you yank a word and paste it over a section, keeps the original
-- yanked text instead of the removed one
vim.keymap.set("x", "<leader>p", "\"_dP",
    { desc = 'Paste without yanking' })

-- Similar to the previous one, deletes something but don't yank its deletion
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]],
    { desc = 'Delete without yanking' })

-- Amazing remaps for yanking to the clipboard. Remember Y is synomym to yy
vim.keymap.set("n", "<leader>y", "\"+y", { desc = 'Yank to clipboard' })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = 'Yank to clipboard' })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = 'Yank to clipboard' })

-- Opens a menu of file scope replacement for the word currently under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Replace word under cursor in file' })
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- NvimTree ------------------------------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>pv", ':NvimTreeFindFileToggle<CR>',
    { desc = 'Open tree selecting current file' })
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- LSP -----------------------------------------------------------------------
------------------------------------------------------------------------------
-- REFER TO lsp.lua IF YOU NEED KEYMAPS
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Sneak ---------------------------------------------------------------------
------------------------------------------------------------------------------
-- Sneak into different windows
vim.keymap.set('n', "s", function ()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage }
end, {desc = 'Move cursor by giving two characters on-screen'})
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- telescope -----------------------------------------------------------------
------------------------------------------------------------------------------
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
    { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
    { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,
    { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
    { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
    { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,
    { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
    { desc = '[S]earch [D]iagnostics' })
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- DAP -----------------------------------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>",
    { desc =  'Start/continue debug session' })
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>",
    { desc =  'Step over' })
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>",
    { desc =  'Step into' })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>",
    { desc =  'Step out' })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>",
    { desc =  'Toggle Breakpoint' })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc =  'Conditional breakpoint' })
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    { desc =  'Set log point message' })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>",
    { desc =  'Start debug REPL' })
vim.keymap.set("n", "<leader>dt", ":lua require'dap-python'.debug_test()<CR>",
    { desc =  'Start debug test' })
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Fugitive -----------------------------------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Harpoon -----------------------------------------------------------------------
------------------------------------------------------------------------------
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Undotree ------------------------------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ToggleTerm ----------------------------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>t", vim.cmd.ToggleTerm,
    {desc='Toggle terminal'})
vim.keymap.set("v", "<leader>t", vim.cmd.ToggleTermSendVisualSelection,
    {desc='Execute selected code'})
------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
