-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local nvt = require("nvim-tree")
local api = require("nvim-tree.api")

vim.keymap.set("n", "<C-t>", function()
    if api.tree.is_tree_buf() then
        api.tree.close_in_all_tabs()
    else
        api.tree.open()
    end
end)

-- local function my_on_attach(bufnr)
--     local api = require("nvim-tree.api")
--     local function opts(desc)
--         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--     end
--     api.config.mappings.default_on_attach(bufnr)
--     vim.keymap.set("n", "<C-e>", api.tree.open())
--     vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
-- end
--
-- -- pass to setup along with your other options
-- require("nvim-tree").setup({
--     ---
--     on_attach = my_on_attach,
--     ---
-- })

-- OR setup with some options
nvt.setup({
    hijack_cursor = true,
    sync_root_with_cwd = true,
    view = {
        adaptive_size = false,
    },
    renderer = {
        full_name = true,
        group_empty = true,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = false,
                folder_arrow = false,
                git = true,
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    filters = {
        custom = {
            "^.git$",
        },
    },
    actions = {
        change_dir = {
            enable = false,
            restrict_above_cwd = true,
        },
        open_file = {
            resize_window = true,
            window_picker = {
                chars = "aoeui",
            },
        },
        remove_file = {
            close_window = false,
        },
    },
    log = {
        enable = false,
        truncate = true,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})

-- auto close
local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})
