vim.g.mapleader = " "

vim.o.nu = true
vim.o.rnu = true
vim.o.cul = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.tgc = true
vim.o.winborder = "single"
vim.o.clipboard = "unnamedplus"

vim.o.et = true
vim.o.ai = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.sb = true
vim.o.sr = true

vim.o.path = vim.o.path .. "**"
vim.o.wildignore = vim.o.wildignore .. "*/node_modules/*"

vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.cache/undodir")

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.o.ai = true

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>Yazi<CR>")
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>pf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>pg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>pb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>db", function() vim.diagnostic.open_float({ scope = "buffer" }) end)
vim.keymap.set("n", "<leader>yr", ':let @+ = expand("%")<CR>', {})

-- macros
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_augroup("JSLogMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "JSLogMacro",
  callback = function()
    vim.fn.setreg("l", "yoconsole.log('" .. esc .. "pa:'," .. esc .. "pa)" .. esc .. "")
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },

  { src = "https://github.com/vague-theme/vague.nvim" },
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },

  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/prettier/vim-prettier" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },

  { src = "https://github.com/mikavilpas/yazi.nvim" },
  { src = "https://github.com/leath-dub/snipe.nvim" },
  { src = "https://github.com/nvim-mini/mini.pick" },
})

require "vague".setup()
vim.cmd("colorscheme vague")

require "yazi".setup({})
require "mason".setup()
require "smear_cursor".setup()
require("luasnip.loaders.from_vscode").lazy_load()

require "blink.cmp".setup({
  fuzzy = {
    implementation = 'lua'
  },
  keymap = {
    preset = 'none',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide', 'fallback' },

    ['<CR>'] = { 'select_and_accept', 'fallback' },

    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
  }
})

require "mini.pick".setup({
  options = {
    content_from_bottom = true,
    use_cache = true,
  },
  mappings = {
    move_up   = '<C-k>',
    move_down = '<C-j>',
  }
})

require "snipe".setup({
  ui = {
    position = "center",
    text_align = "file-first",
    preselect_current = true,
  },
  sort = "last"
})
vim.keymap.set("n", "<leader>os", require("snipe").open_buffer_menu)

require 'nvim-treesitter.configs'.setup({
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "query",
    "vimdoc",
    "c",
    "elixir",
  },
  ignore_install = {},
  sync_install = true,
  auto_install = true,
  modules = {}
})

-- lsp
vim.lsp.enable({ "lua_ls", "ts_ls" })
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})

-- format js files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  command = "silent! Prettier",
})
