
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
vim.cmd [[autocmd FileType xml,html,htmldjango,xhtml,javascript,js,nodejs,lua,yaml setlocal shiftwidth=2 tabstop=2]]

-- Theme config
vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme dracula]]



-- customize dracula color palette
-- require('dracula').colors()
-- vim.g.dracula_colors = {
--   bg = "#282A36",
--   fg = "#F8F8F2",
--   selection = "#44475A",
--   comment = "#6272A4",
--   red = "#FF5555",
--   orange = "#FFB86C",
--   yellow = "#F1FA8C",
--   green = "#50fa7b",
--   purple = "#BD93F9",
--   cyan = "#8BE9FD",
--   pink = "#FF79C6",
--   bright_red = "#FF6E6E",
--   bright_green = "#69FF94",
--   bright_yellow = "#FFFFA5",
--   bright_blue = "#D6ACFF",
--   bright_magenta = "#FF92DF",
--   bright_cyan = "#A4FFFF",
--   bright_white = "#FFFFFF",
--   menu = "#21222C",
--   visual = "#3E4452",
--   gutter_fg = "#4B5263",
--   nontext = "#3B4048",
-- }
-- show the '~' characters after the end of buffers
vim.g.dracula_show_end_of_buffer = true
-- use transparent background
vim.g.dracula_transparent_bg = true
-- set custom lualine background color
vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
vim.g.dracula_italic_comment = true
