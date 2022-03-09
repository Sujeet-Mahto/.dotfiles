function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap=true, silent=true }

-- Mappings
map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<tab>", ":tabnext<CR>")
map("n", "<S-<tab>>", ":tabprevious")
map("n", "<F9>", ":w !python<CR>")
map("n", "tt", ":NvimTreeToggle<CR>")
map("i", "jf", "<ESC>")
map("i", "fj", "<ESC>")
map("n", "<C-S>", ":w<CR>")
map("i", "<C-S>", "<ESC>:w<CR>")
map("n", "<C-Q>", ":q!<CR>")


vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

