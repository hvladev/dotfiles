local opt = vim.opt

-- [[ UI ]]
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = "menuone,preview,noselect"
opt.cursorline = true
opt.number = true
opt.pumheight = 10
opt.scrolloff = 8
opt.showmode = false
opt.showtabline = 1
opt.sidescrolloff = 4
opt.signcolumn = "yes"
opt.termguicolors = true

-- [[ Line Wrap ]]
opt.breakindent = true
opt.linebreak = true

-- [[ Search ]]
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

-- [[ Splits ]]
opt.splitbelow = true
opt.splitright = true

-- [[ Undo ]]
opt.undofile = true
opt.undolevels = 3000
opt.undoreload = 10000

-- [[ Misc ]]
opt.mouse = "a"
opt.smartindent = true
opt.spelllang = "en_us"
opt.timeoutlen = 1000
opt.updatetime = 250
