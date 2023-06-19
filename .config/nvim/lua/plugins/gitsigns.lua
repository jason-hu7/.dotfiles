-- for showing git sign: inserted, modified, deleted vs..
-- also git blamer
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	keys = {
		-- { "gn", "<cmd>Gitsigns next_hunk<CR>" },
		-- { "gN", "<cmd>Gitsigns prev_hunk<CR>" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>" },
		{ "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
		-- { "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>" },
		-- { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>" },
	},
	opts = {
		signs = {
			add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
	},
}

