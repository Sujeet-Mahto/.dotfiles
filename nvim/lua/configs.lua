
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd [[set cursorline]]
vim.opt.cmdheight = 2

-- remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]
vim.opt.termguicolors = true-- enable 24-bit RGB colors


-----------------------------------------------
-- Tabs, indent
-----------------------------------------------
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 4        -- shift 4 spaces when tab
vim.opt.tabstop = 4           -- 1 tab == 4 spaces
vim.opt.smartindent = true    -- autoindent new lines

-- 2 spaces for selected filetypes
vim.cmd [[autocmd FileType xml,html,htmldjango,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2]]

