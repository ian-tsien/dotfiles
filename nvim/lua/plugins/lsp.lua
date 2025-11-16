return {
  -- LSP plugin setup
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Setting up Mason (if you're using mason-lspconfig)
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "marksman" },
      })

      -- Define on_attach (you can define this function anywhere)
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        -- LSP keymaps for clangd
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
      end

      -- Setup LSP servers using the new vim.lsp.config API
      vim.lsp.config('clangd', {
        on_attach = on_attach,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- Lua LSP (lua_ls)
      vim.lsp.config('lua_ls', {
        on_attach = on_attach,
      })

      -- Markdown LSP (marksman)
      vim.lsp.config('marksman', {
        on_attach = on_attach,
      })
    end,
  },
}

