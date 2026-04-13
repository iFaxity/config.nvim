-- Load core configs
require("config.options")
require("config.keymaps")
require("config.terminal")
require("config.autocmds")

-- Load plugin configs
require("plugins.colorscheme")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.colorizer")
require("plugins.icons")
require("plugins.snacks")
require("plugins.mini")
require("plugins.noice")
require("plugins.trouble")
require("plugins.which-key")
require("plugins.formatting")
require("plugins.mason")
--require("plugins.tree-sitter")
require("plugins.lsp")
require("plugins.lazydev")
require("plugins.completions")
require("plugins.snippets")
require("plugins.session")
require("plugins.git")
require("plugins.todo")

-- TODO move packaes into each plugins module
-- Then move loading to here to control the priority manually
-- Maybe do a hybrid, list of files to prioritize, rest

-- Setup packages
--vim.pack.add({
--{ src = "https://github.com/matze/vim-move" },
--{ src = "https://github.com/christoomey/vim-tmux-navigator" },

-- mini.icons is used instead
--{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

--{ src = "https://github.com/stevearc/oil.nvim" },
--{ src = "https://github.com/iamcco/markdown-preview.nvim" },
--{ src = "https://github.com/MeanderingProgrammer/markdown.nvim" },

--{ src = "https://github.com/onsails/lspkind.nvim" },
--
--{ src = "https://github.com/antosha417/nvim-lsp-file-operations" },
--{ src = "https://github.com/mfussenegger/nvim-lint" },
--{ src = "https://github.com/ThePrimeagen/harpoon" },
--{ src = "https://github.com/tpope/vim-fugitive" },

-- Snippets stuff
--{ src = "https://github.com/L3MON4D3/LuaSnip" },
--{ src = "https://github.com/rafamadriz/friendly-snippets" },

-- AI / LLM stuff
--{ src = "https://github.com/NickvanDyke/opencode.nvim" },
--{ src = "https://github.com/github/copilot.vim" },

-- Load plugin configs
--local function load_plugins()
--  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
--
--  for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
--
--    if file:match("%.lua$") then
--      local module = file:gsub("%.lua$", "")
--
--      require("plugins." .. module)
--    end
--  end
--end
--
--load_plugins()
