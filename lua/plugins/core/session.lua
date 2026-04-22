vim.pack.add({
  { src = "https://github.com/folke/persistence.nvim" },
})

local persistence = require("persistence")

persistence.setup()
