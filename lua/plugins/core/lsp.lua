vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

--
-- Keymaps (change to only enable on attach)
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
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- LSP info
    map("n", "<leader>cl", function()
      Snacks.picker.lsp_config()
    end, { desc = "Lsp Info" })

    if client:supports_method("textDocument/hover") then
      -- Set keymaps for this method

      map("n", "K", function()
        vim.lsp.buf.hover()
      end, { desc = "Hover" })
    end

    if client:supports_method("textDocument/references") then
      -- Set keymaps for this method

      map("n", "gr", function()
        vim.lsp.buf.references()
      end, { desc = "References", nowait = true })
    end

    if client:supports_method("textDocument/definition") then
      -- Set keymaps for this method

      map("n", "gd", function()
        vim.lsp.buf.definition()
      end, { desc = "Goto Definition" })
    end

    if client:supports_method("textDocument/declaration") then
      -- Set keymaps for this method

      map("n", "gD", function()
        vim.lsp.buf.declaration()
      end, { desc = "Goto Declaration" })
    end

    if client:supports_method("textDocument/implementation") then
      -- Set keymaps for this method

      map("n", "gI", function()
        vim.lsp.buf.implementation()
      end, { desc = "Goto Implementation" })
    end

    if client:supports_method("textDocument/typeDefinition") then
      -- Set keymaps for this method

      map("n", "gy", function()
        vim.lsp.buf.type_definition()
      end, { desc = "Goto Type Definition" })
    end

    if client:supports_method("workspace/didRenameFiles") or client:supports_method("workspace/willRenameFiles") then
      -- Set keymaps for this method

      map("n", "<leader>cR", function()
        Snacks.rename.rename_file()
      end, { desc = "Rename File" })
    end

    if client:supports_method("textDocument/signatureHelp") then
      -- Set keymaps for this method

      map("n", "gK", function()
        vim.lsp.buf.signature_help()
      end, { desc = "Signature Help" })

      map("i", "<c-k>", function()
        vim.lsp.buf.signature_help()
      end, { desc = "Signature Help" })
    end

    if client:supports_method("textDocument/codeLens") then
      -- Set keymaps for this method

      map({ "n", "x" }, "<leader>cc", function()
        vim.lsp.codelens.run()
      end, { desc = "Run Codelens" })

      map("n", "<leader>cC", function()
        vim.lsp.codelens.enable(true)
      end, { desc = "Refresh & Display Codelens" })
    end

    if client:supports_method("textDocument/rename") then
      -- Set keymaps for this method

      map("n", "<leader>cr", function()
        vim.lsp.buf.rename()
      end, { desc = "Rename" })
    end

    if client:supports_method("textDocument/documentHighlight") then
      -- Set keymaps for this method

      if Snacks.words.is_enabled() then
        map("n", "]]", function()
          Snacks.words.jump(vim.v.count1)
        end, { desc = "Next Reference" })

        map("n", "[[", function()
          Snacks.words.jump(-vim.v.count1)
        end, { desc = "Prev Reference" })

        map("n", "<A-n>", function()
          Snacks.words.jump(vim.v.count1, true)
        end, { desc = "Next Reference" })

        map("n", "<A-p>", function()
          Snacks.words.jump(-vim.v.count1, true)
        end, { desc = "Prev Reference" })
      end
    end

    if client:supports_method("textDocument/codeAction") then
      -- Set keymaps for this method

      map({ "n", "x" }, "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, { desc = "LSP: Code Action" })

      map("n", "<leader>cA", function()
        source_action()
      end, { desc = "LSP: Source Action" })
    end
  end,
})
