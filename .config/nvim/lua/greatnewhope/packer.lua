-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-lualine/lualine.nvim',
    } -- Fancier statusline
    use {'kyazdani42/nvim-web-devicons'}

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    } -- "gc" to comment visual regions/lines


    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- or                            , tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make', cond = vim.fn.executable 'make' == 1 }

    use 'navarasu/onedark.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use { 'theprimeagen/harpoon' }

    use { 'mbbill/undotree' }

    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' } --Github things
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
        }
    }

    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup {}
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'ThePrimeagen/vim-be-good'


    -- Debuggig
    use {'mfussenegger/nvim-dap'}
    use { 'theHamsta/nvim-dap-virtual-text',
        config = function ()
            require("nvim-dap-virtual-text").setup()
        end
    }
    use {
        'mfussenegger/nvim-dap-python',
        config = function()
            require("dap-python").setup('/usr/bin/python')
        end
    }
    use {'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup()
        end
    }
    use 'nvim-telescope/telescope-dap.nvim'
    --   Installed in Mason
    -- ◍ bash-language-server
    -- ◍ lua-language-server
    -- ◍ pylint
    -- ◍ pyright
    -- ◍ shellcheck
end)
