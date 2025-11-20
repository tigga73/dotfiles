local opts = vim.o

-- line numbers
opts.nu = true
opts.rnu = true

-- <Tab> size and behavior
opts.expandtab = true
opts.autoindent = true
opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2

-- line wrapping
opts.wrap = false -- able line wrapping

-- cursor line
opts.cursorline = true -- highlight the current cursor line

-- search settings
opts.ignorecase = true -- ignore case when searching
opts.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- backspace
opts.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- turn on termguicolors
opts.termguicolors = true
opts.background = "dark"
opts.signcolumn = "yes"

-- more "natural" spliting behavior
opts.splitbelow = true
opts.splitright = true

-- allow for :find <file> to search in subdirectories
opts.path = opts.path .. "**"

-- ignore node_modules
opts.wildignore = opts.wildignore .. "*/node_modules/*"

-- keep undo history in the disk so it persists between sessions
opts.undofile = true
opts.undodir = vim.fn.expand("~/.cache/undodir")
