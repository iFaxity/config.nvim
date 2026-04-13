--
-- Plugin for rendering colors in text/code
--

vim.pack.add({
  { src = "https://github.com/catgoose/nvim-colorizer.lua" },
})

require("colorizer").setup()
