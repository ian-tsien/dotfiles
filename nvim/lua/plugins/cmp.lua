return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-y: accept item
      -- C-e: Hide menu
      completion = { documentation = { auto_show = true } }
    },
  },
}
