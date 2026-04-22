vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
  { src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
})

local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")
local dap_ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

dap_ui.setup()
dap_virtual_text.setup({})

if not dap.adapters["netcoredbg"] then
  dap.adapters["netcoredbg"] = {
    type = "executable",
    command = vim.fn.exepath("netcoredbg"),
    args = { "--interpreter=vscode" },
    options = {
      detached = false,
    },
  }
end

if not dap.configurations["cs"] then
  dap.configurations["cs"] = {
    {
      type = "netcoredbg",
      name = "Launch file",
      request = "launch",
      program = function()
        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
    },
  }
end

--
-- Keymaps
--

local map = vim.keymap.set

map("n", "<leader>dB", function()
  local condition = vim.fn.input("Breakpoint condition: ")

  dap.set_breakpoint(condition)
end, { desc = "Breakpoint Condition" })

map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map("n", "<leader>dc", function()
  dap.continue()
end, { desc = "Run/Continue" })

map("n", "<leader>da", function()
  dap.continue({ before = get_args })
end, { desc = "Run with Args" })

map("n", "<leader>dC", function()
  dap.run_to_cursor()
end, { desc = "Run to Cursor" })

map("n", "<leader>dg", function()
  dap.goto_()
end, { desc = "Go to Line (No Execute)" })

map("n", "<leader>di", function()
  dap.step_into()
end, { desc = "Step Into" })

map("n", "<leader>dj", function()
  dap.down()
end, { desc = "Down" })

map("n", "<leader>dk", function()
  dap.up()
end, { desc = "Up" })

map("n", "<leader>dl", function()
  dap.run_last()
end, { desc = "Run Last" })

map("n", "<leader>do", function()
  dap.step_out()
end, { desc = "Step Out" })

map("n", "<leader>dO", function()
  dap.step_over()
end, { desc = "Step Over" })

map("n", "<leader>dP", function()
  dap.pause()
end, { desc = "Pause" })

map("n", "<leader>dr", function()
  dap.repl.toggle()
end, { desc = "Toggle REPL" })

map("n", "<leader>ds", function()
  dap.session()
end, { desc = "Session" })

map("n", "<leader>dt", function()
  dap.terminate()
end, { desc = "Terminate" })

map("n", "<leader>dw", function()
  dap_widgets.hover()
end, { desc = "Widgets" })

--
-- Dap UI
--

map("n", "<leader>du", function()
  dap_ui.toggle({})
end, { desc = "Dap UI" })

map({ "n", "x" }, "<leader>de", function()
  dap_ui.eval()
end, { desc = "Eval" })
