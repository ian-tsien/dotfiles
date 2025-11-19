return {
  -- change the sytle to night
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },

  -- specify parsers that need to be installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "markdown",
        "markdown_inline",
      })
    end,
  },

  -- add tools to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatter
        "clang-format",
        "prettier",
        -- linter
        "markdownlint-cli2",
        "markdown-toc",
        -- lsp
        "clangd",
        "marksman",
        -- dap
        "codelldb",
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
