return {
	"kdheepak/lazygit.nvim",
	cmd = "LazyGit",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
	},
	config = function()
		vim.g.lazygit_floating_window_use_plenary = 0 -- if you want native floating window
	end,
}
