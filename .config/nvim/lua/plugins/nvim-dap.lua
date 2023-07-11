-- debugger
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local function opts(desc)
			return { desc = "dap: " .. desc, noremap = true, silent = true }
		end
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, opts("toggle breakpoint"))
		vim.keymap.set("n", "<F5>", dap.continue, opts("continue"))
		vim.keymap.set("n", "<F10>", dap.step_over, opts("step over"))
		vim.keymap.set("n", "<F11>", dap.step_into, opts("step into"))
		-- vim.keymap.set("n", "<Leader>tdr", dap.repl.open, { noremap = true, silent = true })
		dap.adapters.chrome = {
			type = "executable",
			command = "node",
			args = {
				os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js",
			},
		}
		dap.adapters.python = {
			type = "executable",
			-- command = "path/to/virtualenvs/debugpy/bin/python",
			-- command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python3",
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.javascript = { -- change this to javascript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}

		dap.configurations.typescriptreact = { -- change to typescript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = "launch",
				name = "Launch file",

				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}", -- This configuration will launch the current file if used.
				-- pythonPath = function()
				-- 	-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- 	-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- 	-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				-- 	local cwd = vim.fn.getcwd()
				-- 	if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				-- 		return cwd .. "/venv/bin/python"
				-- 	elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				-- 		return cwd .. "/.venv/bin/python"
				-- 	else
				-- 		return "/usr/bin/python"
				-- 	end
				-- end,
			},
		}
	end,
}
