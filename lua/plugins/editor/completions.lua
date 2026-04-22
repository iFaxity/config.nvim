vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

local blink_cmp = require("blink.cmp")

blink_cmp.setup({
  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    preset = "super-tab",
  },
  snippets = {
    preset = "default",
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  -- (Default) Only show the documentation popup when manually triggered
  completion = {
    documentation = {
      auto_show = false,
    },
  },
  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})
