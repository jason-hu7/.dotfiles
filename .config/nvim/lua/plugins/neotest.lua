-- test plugin
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")
		local function opts(desc)
			return { desc = "neotest: " .. desc, noremap = true, silent = true }
		end
		vim.keymap.set("n", "<Leader>trn", function()
			neotest.run.run()
		end, opts("run given or nearest position"))
		vim.keymap.set("n", "<Leader>tra", function()
			neotest.run.attach()
		end, opts("run attach"))
		vim.keymap.set("n", "<Leader>tro", function()
			neotest.output.open()
		end, opts("open the output of a test"))
		vim.keymap.set("n", "<Leader>tdn", function()
			neotest.run.run({ strategy = "dap" })
		end, opts("debug given or nearest position"))
		vim.keymap.set("n", "<Leader>trf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, opts("run current file"))
		vim.keymap.set("n", "<Leader>tdf", function()
			neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
		end, opts("debug current file with dap"))
		vim.keymap.set("n", "<Leader>trl", function()
			neotest.run.run_last()
		end, opts("rerun last position "))
		vim.keymap.set("n", "<Leader>tdl", function()
			neotest.run.run_last({ strategy = "dap" })
		end, opts("debug last position with dap"))
		neotest.setup({
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					dap = { justMyCode = false },
					-- Command line arguments for runner
					-- Can also be a function to return dynamic values
					args = { "--log-level", "DEBUG" },
					-- Runner to use. Will use pytest if available by default.
					-- Can be a function to return dynamic value.
					runner = "pytest",
					-- Custom python path for the runner.
					-- Can be a string or a list of strings.
					-- Can also be a function to return dynamic value.
					-- If not provided, the path will be inferred by checking for
					-- virtual envs in the local directory and for Pipenev/Poetry configs
					python = tostring(os.getenv("HOME")) .. "/.pyenv/versions/plus-api/bin/python",
				}),
			},
			quickfix = {
				enabled = false,
				open = false,
			},
		})
	end,
}
