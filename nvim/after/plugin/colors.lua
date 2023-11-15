function colorCat(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function colorTender(color)
    color = color or "tender"
    vim.cmd.colorscheme(color)
end

require('ayu').setup({
    mirage = false,
    overrides = {},
})

-- ColorMyPencils()
-- colorTender()
vim.cmd(":colorscheme ayu")
