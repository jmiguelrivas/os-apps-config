return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {},
					never_show = {},
				},
			},
		})

		vim.keymap.set("n", "<C-n>", function()
			local manager = require("neo-tree.sources.manager")
			local fs_open = manager.get_state("filesystem")

			if fs_open and fs_open.winid and vim.api.nvim_win_is_valid(fs_open.winid) then
				require("neo-tree.command").execute({ action = "close" })
			else
				require("neo-tree.command").execute({
					source = "filesystem",
					position = "left",
					reveal = true,
				})
			end
		end, { noremap = true, silent = true })

		-----------------------------------------------------------
		-- Auto-close Neo-tree on quit
		-----------------------------------------------------------

		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local tree_wins = {}

				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
					if bufname:match("neo%-tree") then
						table.insert(tree_wins, win)
					end
				end

				-- If Neo-tree is the only remaining window, close Neovim
				if #tree_wins == #vim.api.nvim_list_wins() then
					vim.cmd("quitall")
				else
					-- Otherwise, just close Neo-tree windows
					for _, win in ipairs(tree_wins) do
						vim.api.nvim_win_close(win, true)
					end
				end
			end,
		})
	end,
}
