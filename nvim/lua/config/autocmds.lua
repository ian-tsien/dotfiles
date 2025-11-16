-- ============================================================================
--  Modern Neovim Autocommands
-- ============================================================================

local api = vim.api

-- Highlight on yank -----------------------------------------------------------
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove trailing whitespace on save ------------------------------------------
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[ %s/\s\+$//e ]])
    vim.fn.winrestview(save)
  end,
})

-- Filetype-specific settings --------------------------------------------------
api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp", "lua", "python", "java" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- Disable comment continuation ------------------------------------------------
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Auto-create parent directories on save --------------------------------------
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(event)
    local dir = vim.fn.fnamemodify(event.match, ":p:h")
    if dir ~= "" and vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Terminal tweaks -------------------------------------------------------------
api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Restore cursor position when reopening file ---------------------------------
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local line_count = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ============================================================================
--  End of Autocommands
-- ============================================================================
