return {
	{
		"folke/snacks.nvim",
		priority = 1000, -- Recommended for snacks to load early
		lazy = false,
		---@type snacks.Config
		opts = {
			-- 1. Enable and configure Input
			input = {
				enabled = true, -- MUST be true to replace vim.ui.input
			},
			-- 2. Configure GitHub module
			gh = {
				wo = {
					relativenumber = true
				},
				picker = {
					sources = {
						gh_issue = {},
						gh_pr = {}
					}
				},
			},

			terminal = {
				-- your terminal configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		},
		-- 3. Move keys inside the main plugin table
		keys = {
			{ "<leader>p",  function() Snacks.picker.smart() end,                                         desc = "Smart Picker" },
			{ "<leader>pf", function() Snacks.picker.files() end,                                         desc = "Find Files" },
			{ "<leader>pr", function() Snacks.picker.recent() end,                                        desc = "Recent Files" },
			{ "<leader>ps", function() Snacks.picker.grep() end,                                          desc = "Grep Search" },
			{ "<leader>gi", function() Snacks.picker.gh_issue() end,                                      desc = "GitHub Issues (open)" },
			{ "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end,                     desc = "GitHub Issues (all)" },
			{ "<leader>gp", function() Snacks.picker.gh_pr() end,                                         desc = "GitHub Pull Requests (open)" },
			{ "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,                        desc = "GitHub Pull Requests (all)" },
			{ "<leader>t",  function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, desc = "Terminal (Floating CWD)" },
		},
	},
}
