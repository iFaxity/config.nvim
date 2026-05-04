-- Load core configs
require("config.options")
require("config.keymaps")
require("config.terminal")
require("config.commands")
require("config.autocmds")

-- Load plugin configs

-- Core plugins
require("plugins.core.lsp")
require("plugins.core.dap")
require("plugins.core.mason")
require("plugins.core.tree-sitter")
require("plugins.core.lazydev")
require("plugins.core.session")
require("plugins.core.icons")

-- UI plugins
require("plugins.ui.colorscheme")
require("plugins.ui.bufferline")
require("plugins.ui.noice")
require("plugins.ui.lualine")
require("plugins.ui.snacks")
require("plugins.ui.mini")
require("plugins.ui.which-key")
require("plugins.ui.harpoon")
require("plugins.ui.grug")

-- Editor plugins
require("plugins.editor.colorizer")
require("plugins.editor.formatting")
require("plugins.editor.linting")
require("plugins.editor.completions")
require("plugins.editor.git")
require("plugins.editor.todo")
require("plugins.editor.comments")

-- Languages
require("plugins.lang.dotnet")
require("plugins.lang.markdown")
