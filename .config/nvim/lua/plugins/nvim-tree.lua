-- file browser
return {
    "kyazdani42/nvim-tree.lua",
    module = true,
    cmd = {
        "NvimTreeOpen",
        "NvimTreeToggle",
        "NvimTreeFocus",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
    },
    tag = "nightly",
    dependencies = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    keys = {
        { "<Leader>pv", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
    config = function()
        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- BEGIN_DEFAULT_ON_ATTACH
            vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
            vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
            vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
            vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
            vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
            vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
            vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
            vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
            vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
            vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
            vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
            vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
            vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
            vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "a", api.fs.create, opts("Create"))
            vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
            vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
            vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
            vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
            vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
            vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
            vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
            vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
            vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
            vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
            vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
            vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
            vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
            vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
            vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
            vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
            vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
            vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
            vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
            vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
            vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
            vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
            vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
            vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
            vim.keymap.set("n", "q", api.tree.close, opts("Close"))
            vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
            vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
            vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
            vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
            vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
            vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
            vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
            vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
            vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
            vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "O", "", { buffer = bufnr })
            vim.keymap.del("n", "O", { buffer = bufnr })
            vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
            vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
            vim.keymap.set("n", "D", "", { buffer = bufnr })
            vim.keymap.del("n", "D", { buffer = bufnr })
            vim.keymap.set("n", "E", "", { buffer = bufnr })
            vim.keymap.del("n", "E", { buffer = bufnr })

            vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
            vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
            vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "P", function()
                local node = api.tree.get_node_under_cursor()
                print(node.absolute_path)
            end, opts("Print Node Path"))

            vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
        end
        -- following options are the default
        require("nvim-tree").setup({
            on_attach = on_attach,
            auto_reload_on_write = true,
            -- disables netrw completely
            disable_netrw = true,
            -- hijack the cursor in the tree to put it at the start of the filename
            hijack_cursor = false,
            -- hijack netrw window on startup
            -- prevents netrw from automatically opening when opening directories (but
            -- lets you keep its other utilities)
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
            open_on_tab = false,
            sort_by = "name",
            -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
            update_cwd = false,
            view = {
                -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
                width = 30,
                hide_root_folder = false,
                -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
                side = "left",
                preserve_window_proportions = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
                mappings = {
                    -- custom only false will merge the list with the default mappings
                    -- if true, it will only use your list to set the mappings
                    custom_only = false,
                    -- list of mappings to set on the tree manually
                    list = {},
                },
            },
            --false by default, this option shows indent markers when folders are open
            renderer = {
                --0 by default, append a trailing slash to folder names
                add_trailing = true,
                -- 0 by default, compact folders that only contain a single folder into one node in the file tree
                group_empty = true,
                --0 by default, will enable file highlight for git attributes (can be used without the icons).
                highlight_git = true,
                --0 by default, will enable folder and file icon highlight for opened files/directories.
                highlight_opened_files = "none",
                --This is the default. See :help filename-modifiers for more options
                root_folder_modifier = ":~",
                indent_markers = {
                    enable = true,
                    icons = {
                        item = "├─",
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                --default will show icon by default if no icon is provided
                --default shows no icon by default
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
                --List of filenames that gets highlighted with NvimTreeSpecialFile
                special_files = {
                    "README.md",
                    "Makefile",
                    "MAKEFILE",
                },
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
            update_focused_file = {
                -- enables the feature
                enable = true,
                -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                -- only relevant when `update_focused_file.enable` is true
                update_cwd = true,
                -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
                ignore_list = {
                    "\\.pyc$",
                    "^__pycache__$",
                    ".git$[[dir]]",
                    ".swp",
                    "dist",
                    --'tmp',
                    "node_modules",
                    "bower_components",
                    ".pnp",
                    ".cache",
                },
            },
            -- configuration options for the system open command (`s` in the tree by default)
            system_open = {
                -- the command to run this, leaving nil should work in most cases
                cmd = nil,
                -- the command arguments as a list
                args = {},
            },
            -- show lsp diagnostics in the signcolumn
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = true,
                custom = {},
                exclude = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 400,
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                },
                open_file = {
                    quit_on_open = false,
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
            log = {
                enable = false,
                truncate = false,
                types = {
                    all = false,
                    config = false,
                    copy_paste = false,
                    git = false,
                    profile = false,
                },
            },
        })
    end,
}
