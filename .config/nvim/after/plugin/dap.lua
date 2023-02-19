vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc =  'Start/continue debug session' })
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>", { desc =  'Step over' })
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>", { desc =  'Step into' })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc =  'Step out' })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc =  'Toggle Breakpoint' })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc =  'Conditional breakpoint' })
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { desc =  'Set log point message' })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc =  'Start debug REPL' })
vim.keymap.set("n", "<leader>dt", ":lua require'dap-python'.debug_test()<CR>", { desc =  'Start debug test' })

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
