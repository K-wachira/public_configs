vim.o.relativenumber=true

vim.o.scrolloff = 8  -- scroll offwidth so it's not the very bottom

vim.o.signcolumn = "yes" -- always set the far left bar/column

vim.o.tabstop = 4  -- Tabs are 4 spaces: Reference - https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces

vim.o.ignorecase = true  -- ignore case when searching
vim.o.smartcase = true  -- Unless we explicitly use cases in search
vim.o.splitbelow = true  -- automagically h split going down
vim.o.splitright = true -- automagically v split going right

vim.opt.listchars = {  -- see hidden chars and their colors
    tab = "| ",
    eol = '¬',
    trail = '·'
}
