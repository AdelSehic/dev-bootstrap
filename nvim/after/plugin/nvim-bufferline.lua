local bufferline = require('bufferline')

bufferline.setup({
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true,
            }
        },
        color_icons = true,
        separator_style = "slant"
    },
})

vim.keymap.set("n", "<leader>bs", ':BufferLinePick<CR>')
vim.keymap.set("n", ',', ':BufferLineCyclePrev<CR>')
vim.keymap.set("n", '.', ':BufferLineCycleNext<CR>')
vim.keymap.set("n", "<leader>bc", ":q<CR>")
vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true })

