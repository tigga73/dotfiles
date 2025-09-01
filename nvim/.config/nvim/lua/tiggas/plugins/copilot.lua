return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    event = { "BufReadPre", "BufNewFile" },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { "<leader>ac", ":CopilotChat<CR>", mode = "n", desc = "Open chat with optional input" },
      { "<leader>ae", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
      { "<leader>ao", ":CopilotChatOpen<CR>", mode = "n", desc = "Open chat window" },
      { "<leader>ax", ":CopilotChatClose<CR>", mode = "n", desc = "Close chat window" },
      { "<leader>at", ":CopilotChatToggle<CR>", mode = "n", desc = "Toggle chat window" },
      { "<leader>as", ":CopilotChatStop<CR>", mode = "n", desc = "Stop current output" },
      { "<leader>ar", ":CopilotChatReset<CR>", mode = "n", desc = "Reset chat window" },
      { "<leader>aw", ":CopilotChatSave ", mode = "n", desc = "Save chat history (name required)" },
      { "<leader>al", ":CopilotChatLoad ", mode = "n", desc = "Load chat history (name required)" },
      { "<leader>ap", ":CopilotChatPrompts<CR>", mode = "n", desc = "View/select prompt templates" },
      { "<leader>am", ":CopilotChatModels<CR>", mode = "n", desc = "View/select available models" },
      { "<leader>aa", ":CopilotChatAgents<CR>", mode = "n", desc = "View/select available agents" },
      { "<leader>au", ":CopilotChat<PromptName><CR>", mode = "n", desc = "Use specific prompt template" },
    },
  },
}
