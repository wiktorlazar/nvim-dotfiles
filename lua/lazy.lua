-- lazy.lua
return require("lazy").setup({
	-- Przykładowe pluginy:
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-chat.nvim",
		branch = "main", -- używaj main, nie canary
		config = function()
			require("copilot-chat").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
})
