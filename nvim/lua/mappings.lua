function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mappings
map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "nn", ":tabnext<CR>")
map("n", "<F9>", ":w !python<CR>")
map("n", "tt", ":NvimTreeToggle<CR>")
map("i", "jk", "<ESC>")
map("i", "JK", "<ESC>")
map("i", "jK", "<ESC>")
map("i", "Jk", "<ESC>")
map("n", "<C-S>", ":w<CR>")
map("i", "<C-S>", "<ESC>:w<CR>")

