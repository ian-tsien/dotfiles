return {
	{
		"mhartington/formatter.nvim",
		keys = {
			{ "<leader>f", ":Format<CR>", desc = "Format file" },
			{ "<leader>F", ":FormatWrite<CR>", desc = "Format & save file" },
		},
		config = function()
			local util = require("formatter.util")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					-- Lua
					lua = {
						function()
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end,
					},
					-- C++
					cpp = {
						function()
							return {
								exe = "clang-format",
								args = {
									"--assume-filename",
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
							}
						end,
					},
					-- C
					c = {
						function()
							return {
								exe = "clang-format",
								args = {
									"--assume-filename",
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
							}
						end,
					},
					-- Markdown
					markdown = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
							}
						end,
					},
				},
			})

			vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = "FormatOnSave",
				pattern = { "*.lua", "*.c", "*.cpp", "*.h", "*.hpp", "*.md" },
				callback = function()
					vim.cmd("FormatWrite")
				end,
			})
		end,
	},
}
