return {
	"numToStr/Comment.nvim",
	opts = {},
	config = function(_, opts)
		local comment = require("Comment")
		comment.setup(opts)

		local api = require("Comment.api")

		-- Toggle comment in normal mode
		vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, { desc = "Toggle comment line" })

		-- Toggle comment in visual mode
		vim.keymap.set("v", "<leader>/", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.linewise(vim.fn.visualmode())
		end, { desc = "Toggle comment selection" })
	end,
}
