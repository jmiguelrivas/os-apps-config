return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signs = {
				add          = { text = "│" },
				change       = { text = "│" },
				delete       = { text = "_" },
				topdelete    = { text = "‾" },
				changedelete = { text = "~" },
			},
			signcolumn = true,        -- show git icons in the gutter
			numhl = false,            -- or true to highlight line numbers
			current_line_blame = true, -- show inline blame text
			current_line_blame_opts = {
				delay = 500,
				virt_text_pos = "eol",
			},
		})
	end,
}
