return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next To Do Comment" })
    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous To Do Comment" })
    todo_comments.setup()
  end,
}
