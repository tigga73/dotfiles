-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-- local map = vim.api.nvim_set_keymap

local defaultOpts = { noremap = true }

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- buffers management
keymap.set("n", "<leader>bo", ":enew<CR>", { desc = "Open new buffer" }) -- open new tab
keymap.set("n", "<leader>bx", ":bp <BAR> bd #<CR>", { desc = "Close current buffer" }) -- close current tab
keymap.set("n", "]b", ":bnext<CR>", { desc = "Go to next buffer" }) --  go to next tab
keymap.set("n", "[b", ":bprev<CR>", { desc = "Go to previous buffer" }) --  go to previous tab
keymap.set("n", "<leader><leader>", ":bprevious<CR>", { desc = "Go to previous buffer", noremap = true, silent = true })

-- pressing <Esc> inside term will enter normal mode, pressing <C-[> will send
-- <Esc> to the terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>", defaultOpts)
keymap.set("t", "<C-[>", "<Esc>", defaultOpts)

-- passing yankee to ctrl+c
keymap.set("v", "y", '"+y<CR>', defaultOpts)

-- Increase width of vertically split buffer
keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { silent = true })

-- Decrease width of vertically split buffer
keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { silent = true })

-- Increase height of horizontally split buffer
keymap.set("n", "<C-Up>", ":resize -5<CR>", { silent = true })

-- Decrease height of horizontally split buffer
keymap.set("n", "<C-Down>", ":resize +5<CR>", { silent = true })

-- Copy relative path
keymap.set("n", "<F3>", ':let @+ = expand("%")<CR>', {})

-- macros
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_augroup("JSLogMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "JSLogMacro",
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.fn.setreg("l", "yOconsole.log('" .. esc .. "pa:'," .. esc .. "pa)" .. esc .. "")
  end,
})
