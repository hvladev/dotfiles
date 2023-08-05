local opt = vim.opt

-- [[ UI ]]
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = "menuone,noselect"
opt.cursorline = true
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 4
opt.showmode = false
opt.showtabline = 0
opt.signcolumn = "yes"
opt.syntax = "ON"
opt.termguicolors = true

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
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.linebreak = true
opt.mouse = "a"
opt.smartindent = true
opt.spelllang = "en_us"
opt.timeoutlen = 300


-- TODO: double-check and sort
opt.autoread = true
opt.pumheight = 10
opt.laststatus = 3
opt.updatetime = 200

vim.opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

-- TODO: maybe put in dedicated dir (e.g. ftdetect)
vim.filetype.add({
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
	},
})
