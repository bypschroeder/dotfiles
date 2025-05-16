return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			-- optional settings
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			win = {
				padding = { 1, 2, 1, 2 },
			},
		})
	end,
}
