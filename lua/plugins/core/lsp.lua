vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

--
-- Keymaps
--

local map = vim.keymap.set

-- Helper to executing source action
local function source_action()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source" },
      diagnostics = {},
    },
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Don't want to enable these globally for now
    -- local buf = ev.buf
    -- -- Enable lsp inlay hints if the server supports it
    -- if client:supports_method("textDocument/inlayHint") then
    --   vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    -- end
    --
    -- -- Enable lsp codelens if the server supports it
    -- if client:supports_method("textDocument/codeLens") then
    --   vim.lsp.codelens.enable(true, { bufnr = buf })
    -- end
    --
    -- -- Enable lsp inline completion if the server supports it
    -- if client:supports_method("textDocument/inlineCompletion") then
    --   vim.lsp.inline_completion.enable(true, { bufnr = buf })
    -- end

    -- LSP info
    map("n", "<leader>cl", function()
      Snacks.picker.lsp_config()
    end, { desc = "Lsp Info" })

    if client:supports_method("textDocument/hover") then
      -- Set keymaps for this method

      map("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "Hover", buf = 0 })
    end

    if client:supports_method("textDocument/references") then
      -- Set keymaps for this method

      map("n", "gr", function()
        Snacks.picker.lsp_references()
      end, { desc = "References", buf = 0 })
    end

    if client:supports_method("textDocument/definition") then
      -- Set keymaps for this method

      map("n", "gd", function()
        Snacks.picker.lsp_definitions()
      end, { desc = "Goto Definition", buf = 0 })
    end

    if client:supports_method("textDocument/declaration") then
      -- Set keymaps for this method

      map("n", "gD", function()
        Snacks.picker.lsp_declarations()
      end, { desc = "Goto Declaration", buf = 0 })
    end

    if client:supports_method("textDocument/implementation") then
      -- Set keymaps for this method

      map("n", "gI", function()
        Snacks.picker.lsp_implementations()
      end, { desc = "Goto Implementation", buf = 0 })
    end

    if client:supports_method("textDocument/typeDefinition") then
      -- Set keymaps for this method

      map("n", "gy", function()
        Snacks.picker.lsp_type_definitions()
      end, { desc = "Goto Type Definition", buf = 0 })
    end

    if client:supports_method("textDocument/prepareCallHierarchy") then
      -- Set keymaps for this method

      map("n", "gai", function()
        Snacks.picker.lsp_incoming_calls()
      end, { desc = "Calls incoming", buf = 0 })

      map("n", "gao", function()
        Snacks.picker.lsp_outgoing_calls()
      end, { desc = "Calls outgoing", buf = 0 })
    end

    if client:supports_method("workspace/didRenameFiles") or client:supports_method("workspace/willRenameFiles") then
      -- Set keymaps for this method

      map("n", "<leader>cR", function()
        Snacks.rename.rename_file()
      end, { desc = "Rename File", buf = 0 })
    end

    if client:supports_method("textDocument/signatureHelp") then
      -- Set keymaps for this method

      map("n", "gK", function()
        vim.lsp.buf.signature_help()
      end, { desc = "Signature Help", buf = 0 })

      map("i", "<c-k>", function()
        vim.lsp.buf.signature_help()
      end, { desc = "Signature Help", buf = 0 })
    end

    if client:supports_method("textDocument/codeLens") then
      -- Set keymaps for this method

      map({ "n", "x" }, "<leader>cc", function()
        vim.lsp.codelens.run()
      end, { desc = "Run Codelens", buf = 0 })

      map("n", "<leader>cC", function()
        vim.lsp.codelens.enable(true)
      end, { desc = "Refresh & Display Codelens", buf = 0 })
    end

    if client:supports_method("textDocument/rename") then
      -- Set keymaps for this method

      map("n", "<leader>cr", function()
        vim.lsp.buf.rename()
      end, { desc = "Rename", buf = 0 })
    end

    if client:supports_method("textDocument/documentHighlight") then
      -- Set keymaps for this method

      if Snacks.words.is_enabled() then
        map("n", "]]", function()
          Snacks.words.jump(vim.v.count1)
        end, { desc = "Next Reference", buf = 0 })

        map("n", "[[", function()
          Snacks.words.jump(-vim.v.count1)
        end, { desc = "Prev Reference", buf = 0 })

        map("n", "<A-n>", function()
          Snacks.words.jump(vim.v.count1, true)
        end, { desc = "Next Reference", buf = 0 })

        map("n", "<A-p>", function()
          Snacks.words.jump(-vim.v.count1, true)
        end, { desc = "Prev Reference", buf = 0 })
      end
    end

    if client:supports_method("textDocument/codeAction") then
      -- Set keymaps for this method

      map({ "n", "x" }, "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "Code Action", buf = 0 })

      map("n", "<leader>cA", function()
        source_action()
      end, { desc = "Source Action", buf = 0 })
    end
  end,
})
