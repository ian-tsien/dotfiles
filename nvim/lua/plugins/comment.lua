return {
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle line comment" },
			{ "gbc", "<Plug>(comment_toggle_blockwise_current)", desc = "Toggle block comment" },
			{ "gc", "<Plug>(comment_toggle_linewise)", desc = "Toggle line comment (motion)" },
			{ "gb", "<Plug>(comment_toggle_blockwise)", desc = "Toggle block comment (motion)" },
		},
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = "^%s*$",
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
				-- You can add hooks if needed
				-- pre_hook = function(ctx) … end,
				-- post_hook = function(ctx) … end,
			})
		end,
	},
}
