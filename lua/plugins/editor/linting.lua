vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "oxlint", "eslint" },
  typescript = { "oxlint", "eslint" },
  javascriptreact = { "oxlint", "eslint" },
  typescriptreact = { "oxlint", "eslint" },
}

-- Run linting after saving, reading, or leaving insert mode
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function(args)
    -- Only lint normal buffers
    if vim.bo[args.buf].buftype ~= "" then
      return
    end

    -- Try to run every linter available
    lint.try_lint(nil, {
      filter = function(linter)
        local cmd = linter.cmd

        -- If cmd is a function, call it to get the actual string command
        if type(cmd) == "function" then
          cmd = cmd()
        end

        -- Now check if that string is executable
        return vim.fn.executable(cmd) == 1
      end,
    })
  end,
})
