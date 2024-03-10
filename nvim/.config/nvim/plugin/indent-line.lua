vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#42434f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#42434f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#42434f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#42434f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#42434f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#42434f gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:_"
vim.opt.listchars:append "eol:↴"

require("ibl").setup()