return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		dashboard.section.top_buttons.val = {
			dashboard.button(
				"l",
				"  LoM DB",
				":cd ~/git_web/lomdb.github.io | enew | pwd | echo 'Opened LoM DB'<CR>"
			),
			dashboard.button(
				"n",
				"  NeoVim Config",
				":cd ~/.config/nvim | enew | pwd | echo 'Opened Neovim Config'<CR>"
			),
			dashboard.button(
				"p",
				"  Portfolio",
				":cd ~/git_web/jmiguelrivas.github.io | enew | pwd | echo 'Opened Portfolio'<CR>"
			),
			dashboard.button("m", "  Morfosis", ":cd ~/git_app/morfosis | enew | pwd | echo 'Opened Morfosis'<CR>"),
			dashboard.button("j", "  JS Scripts", ":cd ~/git_proj/js | enew | pwd | echo 'Opened JS Scripts'<CR>"),
			-- dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		-- Remove MRU/recent files section if you don’t want it
		dashboard.section.mru.val = {}

		-- Setup Alpha with your custom layout
		alpha.setup(dashboard.opts)
	end,
}
