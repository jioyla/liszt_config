-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"bluz71/vim-nightfly-guicolors",
	"tpope/vim-sleuth",
	"nvim-tree/nvim-web-devicons", --nvim-tree的图标，不是非必需
	"nvim-tree/nvim-tree.lua",
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- 弹出菜单
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",

	"numToStr/Comment.nvim",

	"nvim-lualine/lualine.nvim",

	-- fuzzy finding 注意：必须brew install ripgrep ,否则有两个功能无法使用
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { "nvim-lua/plenary.nvim" } },

	-- autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- snippets
	"L3MON4D3/Luasnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
})
