---- telescope & extensions
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "nvim-telescope/telescope-symbols.nvim",
            },
            {
                "nvim-telescope/telescope-github.nvim",
            },
            {
                "LinArcX/telescope-env.nvim",
            },
        },
        config = function()
            require("plugins.telescope.settings")
            local builtin = require("telescope.builtin")
            vim.keymap.set(
                "n",
                "<leader>pf",
                builtin.find_files,
                { noremap = true, silent = true, desc = "grep all files" }
            )
            vim.keymap.set("n", "<leader>pl", builtin.live_grep, { noremap = true, silent = true, desc = "live grep" })
            vim.keymap.set("n", "<leader>pm", builtin.marks, { noremap = true, silent = true, desc = "grep marks" })
            vim.keymap.set(
                "n",
                "<leader>pb",
                builtin.buffers,
                { noremap = true, silent = true, desc = "grep all buffers" }
            )
            vim.keymap.set("n", "<leader>pw", function()
                builtin.grep_string({ search = vim.fn.expand("<cword>") })
            end, { noremap = true, silent = true, desc = "grep current word" })
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep For > ") })
            end, { noremap = true, silent = true, desc = "grep entered word" })
            -- Git
            vim.keymap.set(
                "n",
                "<leader>gstt",
                builtin.git_status,
                { noremap = true, silent = true, desc = "grep git status" }
            )
            vim.keymap.set(
                "n",
                "<leader>gsb",
                builtin.git_branches,
                { noremap = true, silent = true, desc = "grep git branches" }
            )
            vim.keymap.set(
                "n",
                "<leader>gsth",
                builtin.git_stash,
                { noremap = true, silent = true, desc = "grep git stashes" }
            )
            vim.keymap.set(
                "n",
                "<leader>gc",
                builtin.git_commits,
                { noremap = true, silent = true, desc = "grep git commits" }
            )
            vim.keymap.set("n", "<leader>prc", function()
                builtin.find_files({
                    prompt_title = "< VimRC >",
                    cwd = tostring(os.getenv("HOME")) .. "/Code/development/dotfiles/",
                })
            end, { noremap = true, silent = true, desc = "grep dot files" })
        end,
    },
}
