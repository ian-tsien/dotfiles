return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- disable netrw
    init = function ()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,

    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
      { "<leader>fe", ":NvimTreeFindFile<CR>", desc = "Reveal current file" },
    },

    opts = {
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    },
  },
}

