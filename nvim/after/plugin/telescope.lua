local builtin = require('telescope.builtin')
local telescope = require('telescope')
local lgaa = require("telescope-live-grep-args.actions")
local lgas = require("telescope-live-grep-args.shortcuts")

telescope.setup({
    selection_caret = 'x',
    color_devicons = true,
    selection = {
        gui = "bold",
        fg = "#ff0000",
        bg = "#00ff00",
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-l>"] = lgaa.quote_prompt({ postfix = ' -i' }),
                }
            }
        }
    }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>f/', telescope.extenstions.live_grep_args.live_grep_args,  {noremap = true})
vim.keymap.set("n", "<leader>f/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set('n', '<leader>fw', lgas.grep_word_under_cursor)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>frr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fqf', builtin.quickfix, {})
