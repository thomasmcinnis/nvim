vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.api.nvim_exec(
[[
  autocmd!
  augroup filetype_markdown_mdx
    autocmd! BufRead,BufNewFile *.md,*.mdx setlocal wrap textwidth=80
  augroup END
]], false)
