vim.pack.add({
  { src = "https://github.com/seblyng/roslyn.nvim" },
  { src = "https://github.com/khoido2003/roslyn-filewatch.nvim" },
})

local roslyn = require("roslyn")
local roslyn_filewatch = require("roslyn_filewatch")

roslyn.setup({
  -- Turn off normal file watcher and use the custom plugin
  filewatching = "off",
  -- Turn off notifications
  silent = true,
})
roslyn_filewatch.setup({})

vim.lsp.config("roslyn", {
  settings = {
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = false,
      dotnet_enable_tests_code_lens = false,
    },
    ["csharp|completion"] = {
      dotnet_provide_regex_completions = true,
      dotnet_show_completion_items_from_unimported_namespaces = true,
      dotnet_show_name_completion_suggestions = true,
    },
    ["csharp|inlay_hints"] = {
      --  Parameter hints
      dotnet_enable_inlay_hints_for_parameters = true,
      dotnet_enable_inlay_hints_for_literal_parameters = true,
      dotnet_enable_inlay_hints_for_indexer_parameters = false,
      dotnet_enable_inlay_hints_for_object_creation_parameters = true,
      dotnet_enable_inlay_hints_for_other_parameters = true,
      dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
      dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
      dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
      -- Type Hints
      csharp_enable_inlay_hints_for_types = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_lambda_parameter_types = false,
      csharp_enable_inlay_hints_for_implicit_object_creation = false,
      csharp_enable_inlay_hints_for_collection_expressions = false,
    },
    ["csharp|symbol_search"] = {
      dotnet_search_reference_assemblies = true,
    },
    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
    ["csharp|background_analysis"] = {
      -- Possible values "openFiles", "fullSolution", "none"
      dotnet_compiler_diagnostics_scope = "openFiles",
      dotnet_analyzer_diagnostics_scope = "openFiles",
    },
  },
})

-- Roslyn doesnt load in time to enable certain features correctly
vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynInitialized",
  callback = function()
    vim.lsp.inlay_hint.enable(true)
    vim.lsp.codelens.enable(true)
  end,
})
