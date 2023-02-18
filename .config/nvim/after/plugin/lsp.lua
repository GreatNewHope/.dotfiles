local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'python-lsp-server', 'lua-language-server'})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc =  '[R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc =  '[C]ode [A]ction' })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc =  '[G]oto [D]efinition' })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc =  '[G]oto [R]eferences' })
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc =  '[G]oto [I]mplementation' })
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc =  'Type [D]efinition' })
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc =  '[D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc =  '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc =  'Hover Documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc =  'Signature Documentation' })

-- Lesser used LSP functionality
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc =  '[G]oto [D]eclaration' })
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc =  '[W]orkspace [A]dd Folder' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc =  '[W]orkspace [R]emove Folder' })
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })

lsp.setup()
