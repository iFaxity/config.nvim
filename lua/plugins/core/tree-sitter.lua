vim.pack.add({
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
})

local tree_sitter_manager = require("tree-sitter-manager")

tree_sitter_manager.setup({
  ensure_installed = {
    -- Systems programming
    "c",
    "c_sharp",

    -- Shell scripting
    "bash",
    "fish",

    -- Scripting
    "lua",
    "luap",
    "python",
    "javascript",
    "typescript",

    -- Web dev
    "html",
    "css",
    "tsx",
    "vue",
    "svelte",
    "markdown",
    "markdown_inline",

    -- Data
    "sql",
    "xml",
    "csv",
    "json",
    "json5",
    "yaml",
    "toml",

    -- Build systems
    "dockerfile",
    "make",
    "cmake",

    -- Others
    "diff",
    "vim",
    "query",
    "regex",
    "vimdoc",
    "luadoc",
    "jsdoc",
    "printf",
  },
})
