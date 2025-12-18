return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",  -- Optional: git status icons
			"nvim-tree/nvim-web-devicons", -- File icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			icons = {
				buffer_index = true,
				buffer_number = false,
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
					[vim.diagnostic.severity.WARN]  = { enabled = true, icon = " " },
					[vim.diagnostic.severity.INFO]  = { enabled = true, icon = " " },
					[vim.diagnostic.severity.HINT]  = { enabled = true, icon = "󰌶 " },
				},
				separator = { left = "▎", right = "" },
				modified = { button = "●" },
				pinned = { button = "", filename = true },
			},
		},
		config = function(_, opts)
			require("barbar").setup(opts)
			-- Keymaps for buffer navigation
			vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Prev buffer" })
			vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
			vim.keymap.set("n", "<A-p>", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
		end,
	},
}
