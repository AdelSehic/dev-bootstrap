-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
            { 'debugloop/telescope-undo.nvim' }
        }
    }

    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

    use({
        "jacoborus/tender.vim",
        as = "tender",
        config = function()
            vim.cmd('colorscheme tender')
        end
    })

    use('Shatur/neovim-ayu')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use('nvim-lualine/lualine.nvim')
    use('sindrets/diffview.nvim')
    use('lewis6991/gitsigns.nvim')
    use('lukas-reineke/indent-blankline.nvim')
    use('folke/trouble.nvim')
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons')
    use('jose-elias-alvarez/null-ls.nvim')
    use('lukas-reineke/lsp-format.nvim')
    use('terrortylor/nvim-comment')
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use('famiu/bufdelete.nvim')
    use('mrjones2014/smart-splits.nvim')
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    use {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6', --recomended as each new version will have breaking changes
        config = function() require('ultimate-autopair').setup({}) end,
    }

    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>',  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = true,            -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' }         -- if a completion plugin is using tabs load it before
    }

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use({
        'windwp/nvim-ts-autotag',
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use('machakann/vim-sandwich')
    use('lvimuser/lsp-inlayhints.nvim')
    use('lambdalisue/suda.vim')
    use('arturgoms/moonbow.nvim')
end)
