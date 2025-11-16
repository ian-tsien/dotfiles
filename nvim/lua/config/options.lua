-- ============================================================================
--  Modern Neovim Options (for >= NVIM 0.10)
-- ============================================================================

local opt = vim.opt

-- UI -------------------------------------------------------------------------
opt.number = true               -- Line numbers
opt.relativenumber = true       -- Relative numbers
opt.cursorline = true           -- Highlight current line
opt.wrap = false                -- No line wrap
opt.signcolumn = "yes"          -- Always show sign column
opt.termguicolors = true        -- True color support
opt.splitright = true           -- Vertical split to the right
opt.splitbelow = true           -- Horizontal split to the bottom
opt.showmode = false            -- Hide default mode text (Lualine handles it)

-- Indentation ---------------------------------------------------------------
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 2              -- Indent size
opt.tabstop = 2                 -- Tab width
opt.smartindent = true          -- Smart indentation

-- Search ---------------------------------------------------------------------
opt.ignorecase = true           -- Case insensitive
opt.smartcase = true            -- unless capital letters used
opt.incsearch = true            -- Incremental search
opt.hlsearch = true             -- Highlight search results

-- Files ----------------------------------------------------------------------
opt.undofile = true             -- Persistent undo
opt.swapfile = false            -- Disable swapfile
opt.backup = false              -- Disable backup files
opt.writebackup = false

-- Clipboard ------------------------------------------------------------------
opt.clipboard = "unnamedplus"   -- Use system clipboard

-- Performance ----------------------------------------------------------------
opt.updatetime = 250            -- Faster completion & CursorHold
opt.timeoutlen = 500            -- Mapped sequence wait time
opt.lazyredraw = true           -- Faster scrolling
opt.scrolloff = 8               -- Keep lines above/below cursor

-- Editing --------------------------------------------------------------------
opt.autoindent = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.virtualedit = "block"       -- Visual block cursor beyond text

-- Behaviour ------------------------------------------------------------------
opt.confirm = true              -- Confirm before leaving unsaved buffer
opt.mouse = "a"                 -- Mouse support
opt.hidden = true               -- Allow switching buffer without saving
opt.shortmess:append("sI")      -- Disable intro message

-- Diagnostics ---------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,         -- Turn off inline error text
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Fold (simple & modern) ----------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false          -- Don't fold by default

-- Encoding -------------------------------------------------------------------
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- ============================================================================
-- End of Options
-- ============================================================================

