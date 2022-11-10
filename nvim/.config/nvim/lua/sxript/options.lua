vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines

vim.opt.errorbells = false                      -- no bell sound

vim.opt.showmode = false

vim.opt.tabstop = 4                             -- tab = 4 spaces
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4                          -- 4 spaces for indentation
vim.opt.expandtab = true                        -- convert tab to spaces

vim.opt.smartindent = true                      -- autoindent but smart 
vim.opt.smarttab = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.wrap = true

vim.opt.swapfile = false                        -- don't create swapfile
vim.opt.backup = false                          -- don't create backup file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1                           -- more space for displaying messages
vim.opt.numberwidth = 2

vim.opt.updatetime = 50                        -- default updatetime is 4000ms 

vim.opt.completeopt='menuone,noinsert,noselect'
vim.opt.shortmess:append('c')
