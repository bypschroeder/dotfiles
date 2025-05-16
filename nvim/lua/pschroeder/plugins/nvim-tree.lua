return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 35,
				side = "left",
			},
			renderer = {
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set(
			"n",
			"<leader>ee",
			":NvimTreeToggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle File Explorer" }
		)
	end,
}
