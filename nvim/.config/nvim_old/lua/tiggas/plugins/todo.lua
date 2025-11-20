return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function()
    require("todo-comments").setup({})
    local keymap = vim.keymap

    keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { desc = "Search for TODOs" })
  end,
}
