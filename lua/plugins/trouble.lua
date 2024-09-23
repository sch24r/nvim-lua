return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble List" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble Document Diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble Quick Fix List" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble Location List",
    },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Trouble To Do's" },
  },
}
