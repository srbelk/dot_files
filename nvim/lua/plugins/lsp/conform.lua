return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			fish = { "fish_indent" },
			solidity = { "solc" },
			zig = { "zigfmt" },
		},
		-- Auto-format on save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
