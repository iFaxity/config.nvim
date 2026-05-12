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
    "kitty",

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
    "angular",
    "graphql",

    -- Data
    "sql",
    "xml",
    "csv",
    "json",
    "json5",
    "yaml",
    "toml",
    "kdl",
    "hyprlang",

    -- Text
    "editorconfig",
    "markdown",
    "markdown_inline",

    -- Git
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",

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

-- Autocmd for loading treesitter when a filetype is matched
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterAutoStart", { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    -- Try to find the "official" parser name for this filetype
    -- This handles the internal mapping (like 'javascriptreact' -> 'javascript')
    local lang = vim.treesitter.language.get_lang(ft) or ft

    -- Check if a parser is installed and functional for that language
    local has_parser, parser = pcall(vim.treesitter.get_parser, args.buf, lang)

    if has_parser and parser then
      -- Start the engine
      vim.treesitter.start(args.buf, lang)
    end
  end,
})
