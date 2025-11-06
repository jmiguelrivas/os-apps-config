return {
	"echasnovski/mini.indentscope",
	version = false,  -- use latest
	event = "BufReadPre",
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			draw = {
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(), -- or .quad for smooth effect
			},
			options = { try_as_border = true },
		})
		-- Disable in certain filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "help", "lazy", "mason", "NvimTree", "Trouble" },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
