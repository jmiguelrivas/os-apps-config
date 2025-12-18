return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			filetypes = { "*" }, -- Apply to all files
			user_default_options = {
				RGB = true,      -- #RGB hex codes
				RRGGBB = true,   -- #RRGGBB hex codes
				names = true,    -- "Blue", "Red", etc.
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB format
				css = true,      -- Enable all CSS color features
				css_fn = true,   -- rgb(), rgba(), hsl(), etc.
				mode = "background", -- Display mode: foreground | background | virtualtext
			},
		})
	end,
}
