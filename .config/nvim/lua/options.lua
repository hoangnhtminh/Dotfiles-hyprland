local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.sidescroll = 1
opt.laststatus = 3
opt.showmode = false
opt.winborder = "rounded"
opt.termguicolors = true
opt.pumblend = 10
opt.pumheight = 10

-- Indent
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.clipboard = "unnamedplus"
opt.updatetime = 250

-- Split
opt.splitbelow = true
opt.splitright = true
