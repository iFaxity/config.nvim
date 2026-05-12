vim.pack.add({
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

local render_markdown = require("render-markdown")

render_markdown.setup({})

-- Set markdown specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("MarkdownSettings", {
    clear = true,
  }),
  pattern = "markdown",
  callback = function()
    local opt = vim.opt_local

    opt.wrap = true
    opt.linebreak = true
    opt.spell = true
  end,
})
