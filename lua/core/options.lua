vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.breakindent = true -- wrapped lines will indent as per parent
-- opt.wrap = false -- disable line wrapping

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- convenience
opt.mouse = "a" -- enable mouse mode for panel resizing etc

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- appearance
vim.diagnostic.config({
	float = { border = "rounded" },
})

-- command line
opt.cmdheight = 0 -- don't need the command line just put on status line
opt.showcmdloc = "statusline"

-- cursor line, col line, sign col
opt.cursorline = true -- highlight the current cursor line
opt.colorcolumn = "80"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.scrolloff = 10

-- turn on termguicolors
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.undofile = true -- keep undo history

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
