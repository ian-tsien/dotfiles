return {
  -- add tools to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatter
        "clang-format",
        -- lsp
        "clangd",
        "marksman",
      },
    },
  },

  -- specify which formatters to use for each filetype
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
