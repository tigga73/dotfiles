return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Open/close trouble list" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Open trouble workspace diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
}
