return {
  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
    opts = {
      model = "qwen3:14b", -- change to a model shown by `ollama list`
      host = "127.0.0.1",
      port = "11434",
      display_mode = "float",
      show_prompt = true,
      show_model = true,
    },
    keys = {
      { "<leader>aa", "<cmd>Gen<CR>", desc = "AI: prompt" },
      { "<leader>ae", "<cmd>Gen<CR>", mode = { "n", "v" }, desc = "AI: prompt on selection" },
    },
  },
}
