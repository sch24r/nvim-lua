return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")
    substitute.setup()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "s", substitute.operator, { desc = "Substitute with Motion" })
    keymap.set("n", "ss", substitute.line, { desc = "Substitute Line" })
    keymap.set("n", "S", substitute.eol, { desc = "Substitute to End of Line" })
    keymap.set("x", "s", substitute.visual, { desc = "Substitute in Visual Mode" })
  end,
}
