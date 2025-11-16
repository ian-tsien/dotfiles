-- ============================================================================
--  Neovim Init File (Modern Setup with lazy.nvim)
-- ============================================================================

-- 1. Improve require() performance (Neovim 0.9+)
if vim.loader then
	vim.loader.enable()
end

-- 2. Set <leader> *before* plugins are loaded (very important!)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 3. Bootstrap lazy.nvim ------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- 4. Setup lazy.nvim ----------------------------------------------------------
require("lazy").setup({
	spec = {
		{ import = "plugins" }, -- Loads all plugins under lua/plugins/
	},

	defaults = {
		lazy = true,
		version = false,
	},

	install = { colorscheme = { "tokyonight", "habamax" } },

	checker = {
		enabled = true,
		notify = false,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- 5. Load your core config ----------------------------------------------------
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- ============================================================================
--  End of init.lua
-- ============================================================================
