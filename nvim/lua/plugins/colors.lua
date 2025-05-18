return {
	{
		"lmantw/themify.nvim",

		lazy = false,
		priority = 999,
		config = function()
			require("themify").setup({
				"folke/tokyonight.nvim",
				"rose-pine/neovim",
				"sho-87/kanagawa-paper.nvim",
				{
					"comfysage/evergarden",
					branch = "mega",
				},

				-- Built-in colorschemes are also supported.
				-- (Also works with any colorschemes that are installed via other plugin manager, just make sure the colorscheme is loaded before Themify is loaded.)
				"default",
			})
		end,
	},
}
