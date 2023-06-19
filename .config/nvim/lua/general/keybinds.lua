--[[
#-------------------------------------------------------------------------#
#                                    CONFIG                               #
#-------------------------------------------------------------------------#
--]]
-- -- reload nvim configuration file
-- vim.keymap.set("n", "<Leader><CR>", ":luafile $MYVIMRC<CR>", { noremap = true, desc = "reload nvim config" })
--[[
#-------------------------------------------------------------------------#
#                                  CURSOR MOVE                            #
#-------------------------------------------------------------------------#
--]]
-- [ ctrl + h ] move cursor to left window
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", { noremap = true })
vim.keymap.set(
	"n",
	"<Leader>C",
	"<Cmd>set cursorline! cursorcolumn!<CR>",
	{ noremap = true, desc = "Highlight cursorline" }
)
--[[
#-------------------------------------------------------------------------#
#                                CUT COPY PASTE                           #
#-------------------------------------------------------------------------#
--]]
vim.keymap.set("v", "X", '"_d', { noremap = true, desc = "delete without registering" })
-- vim.keymap.set("v", "<Leader>p", '"_dP', { noremap = true, desc = "delete&paste without registering" })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, desc = "yank to global" })
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d', { noremap = true, desc = "delete to global" })
vim.keymap.set({ "n", "v" }, "<Leader>Y", 'gg"+yG', { noremap = true, desc = "yank all to global" })
vim.keymap.set("n", "Y", "yg$", { noremap = true, desc = "yank from cursor to end of line" })
--[[
#-------------------------------------------------------------------------#
#                                RESIZE WINDOW                            #
#-----------p-------------------------------------------------------------#
--]]
vim.keymap.set("n", "<Leader>+", "<Cmd>vertical resize +5<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>-", "<Cmd>vertical resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>rp", "<Cmd>resize 100<CR>", { noremap = true })
--[[
#-------------------------------------------------------------------------#
#                            JUMP LIST MUTATIONS                          #
#-------------------------------------------------------------------------#
--]]
-- vim.keymap.set("n", "j", [[(v:count > 1 ? "m'" . v:count : '') . 'j']], { expr = true, noremap = true })
-- vim.keymap.set("n", "k", [[(v:count > 1 ? "m'" . v:count : '') . 'k']], { expr = true, noremap = true })
--[[
#-------------------------------------------------------------------------#
#                                MOVE LINE                                #
#-------------------------------------------------------------------------#
--]]
-- move selected line to up/down
vim.keymap.set("v", "J", [[:m '>+1<CR>gv=gv]], { noremap = true })
vim.keymap.set("v", "K", [[:m '<-2<CR>gv=gv]], { noremap = true })
vim.keymap.set("v", "J", [[mzJ`z]], { noremap = true })

--[[
#-------------------------------------------------------------------------#
#                                SEARCH WORD                              #
#-------------------------------------------------------------------------#
--]]
-- search with next with centralized cursor
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })
--[[
#-------------------------------------------------------------------------#
#                                   UNDO                                  #
#-------------------------------------------------------------------------#
--]]
-- undo break points
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true })

--[[
#-------------------------------------------------------------------------#
#                                   OTHER                                 #
#-------------------------------------------------------------------------#
--]]
vim.keymap.set(
	"n",
	"<Leader>/",
	"<Cmd>nohlsearch<CR>",
	{ noremap = true, silent = true, desc = "remove search highlight" }
)
