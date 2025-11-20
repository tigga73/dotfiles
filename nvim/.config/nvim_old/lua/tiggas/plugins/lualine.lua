return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local colors = {
      blue = "#7dcfff",
      green = "#9ece6a",
      violet = "#bb9af7",
      yellow = "#e0af68",
      red = "#f7768e",
      fg = "#a9b1d6",
      bg = "#24283b",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        component_separators = "|",
      },
      sections = {
        lualine_a = {
          { "mode", separator = { right = "" }, left_padding = 2 },
        },
        lualine_b = {
          { "branch" },
          { "diff" },
          { "filename", path = 1 },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_z = {
          { "location", separator = { left = "" }, right_padding = 2 },
        },
      },
    })
  end,
}
