return {
	"akinsho/toggleterm.nvim",
    event = "BufReadPre",
	version = "*",
	config = function()
		local cl = vim.o.columns
		local ln = vim.o.lines
		local width = 0.8
		local height = 0.8
		require("toggleterm").setup({
			open_mapping = [[<F12>]],
			insert_mappings = true,
			start_in_insert = true,
			shade_terminals = true,
			shading_factor = "1",
			persist_size = true,
			direction = "float",
			highlights = {
				NormalFloat = {
					link = "Normal",
				},
				FloatBorder = {
					link = "FloatBorder",
				},
			},
			float_opts = {
				border = "curved",
				width = math.ceil(cl * width),
				height = math.ceil(ln * height - 4),
				winblend = 3,
			},
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				-- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = term.bufnr, noremap = true, silent = true })
			end,
			-- function to run on closing the terminal
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		vim.keymap.set("n", "<leader>G", function()
			lazygit:toggle()
		end, { desc = "Lazygit", noremap = true, silent = true })
	end,
}
