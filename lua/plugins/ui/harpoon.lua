vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

-- harpoon:setup({
--   menu = {
--     width = vim.api.nvim_win_get_width(0) - 4,
--   },
--   settings = {
--     save_on_toggle = true,
--   },
-- })

--
-- Keymaps
--

local map = vim.keymap.set

map("n", "<leader>H", function()
  harpoon:list():add()
end, { desc = "Harpoon file" })

vim.keymap.set("n", "<leader>fh", function()
  Snacks.picker({
    confirm = "jump",
    finder = function()
      return vim
        .iter(harpoon:list().items)
        :filter(function(item)
          return item and item.value:match("%S")
        end)
        :map(function(item)
          return {
            text = item.value,
            file = item.value,
            pos = { item.context.row, item.context.col },
          }
        end)
        :totable()
    end,
    filter = {
      transform = function()
        return true
      end,
    },
    format = function(item)
      return { { item.text } }
    end,
    preview = function(ctx)
      if Snacks.picker.util.path(ctx.item) then
        return Snacks.picker.preview.file(ctx)
      end

      return Snacks.picker.preview.none(ctx)
    end,
    win = {
      input = {
        keys = {
          ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
        },
      },
      list = {
        keys = {
          ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
        },
      },
    },
    actions = {
      harpoon_delete = function(picker, item)
        local to_remove = item or picker:selected()

        harpoon:list():remove_at(to_remove.idx)

        --picker:find({ refresh = true })
        picker:refresh()
      end,
    },
  })
end, { desc = "Harpoons" })
