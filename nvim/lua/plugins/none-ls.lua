return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Prettier for all web formats + SVG (forces html parser for SVG)
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript", "typescript", "vue",
						"css", "scss", "less",
						"html", "json", "yaml", "markdown",
						"svg",
					},
					extra_args = function(params)
						if params.ft == "svg" then
							return { "--parser", "html" }
						end
						return {}
					end,
				}),
			},
		})

		-- Manual format keybinding
		vim.keymap.set("n", "<C-i>", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format file with LSP" })
	end,
}
