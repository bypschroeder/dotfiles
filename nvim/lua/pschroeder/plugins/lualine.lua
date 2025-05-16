return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			base = "#191724",
			surface = "#1f1d2e",
			overlay = "#26233a",
			muted = "#6e6a86",
			subtle = "#908caa",
			text = "#e0def4",
			love = "#eb6f92",
			rose = "#ebbcba",
			gold = "#f6c177",
			pine = "#31748f",
			foam = "#9ccfd8",
			iris = "#c4a7e7",
			highlight_low = "#21202e",
			highlight_med = "#403d52",
			highlight_high = "#524f67",
		}
		local my_lualine_theme = {
			normal = {
				a = { fg = colors.base, bg = colors.iris, gui = "bold" },
				b = { fg = colors.text, bg = colors.overlay },
				c = { fg = colors.text, bg = colors.surface },
			},
			insert = {
				a = { fg = colors.base, bg = colors.foam, gui = "bold" },
				b = { fg = colors.text, bg = colors.overlay },
			},
			visual = {
				a = { fg = colors.base, bg = colors.gold, gui = "bold" },
				b = { fg = colors.text, bg = colors.overlay },
			},
			replace = {
				a = { fg = colors.base, bg = colors.love, gui = "bold" },
				b = { fg = colors.text, bg = colors.overlay },
			},
			inactive = {
				a = { fg = colors.muted, bg = colors.surface, gui = "bold" },
				b = { fg = colors.muted, bg = colors.surface },
				c = { fg = colors.muted, bg = colors.surface },
			},
		}
		local mode = {
			"mode",
			fmt = function(str)
				-- return ' '
				-- displays only the first character of the mode
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local branch = { "branch", icon = { "", color = { fg = colors.foam } }, "|" }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = my_lualine_theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding",},
					-- { "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
