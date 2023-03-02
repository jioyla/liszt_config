-- import dashboard plugin safely
local setup, dashboard = pcall(require, "dashboard")
if not setup then
	return
end

dashboard.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " 好好学习，天天向上",
				group = "DiagnosticHint",
				-- action = "Telescope app",
				-- key = "a",
			},
			{
				desc = " By：Liszt",
				group = "Number",
				-- action = "Telescope dotfiles",
				-- key = "d",
			},
		},
	},
})
