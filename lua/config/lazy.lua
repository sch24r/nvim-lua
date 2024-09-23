local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap -- for conciseness
keymap.set('n','y','"+y')
keymap.set('n','yy','"+yy')
keymap.set('n','Y','"+Y')
keymap.set('x','y','"+y')
keymap.set('x','Y','"+Y')
keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights" })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" }) -- decrement
-- window management
keymap.set("n", "<leader>en", "<cmd>vnew<CR>", { desc = "Write a New File" }) -- write a new file
keymap.set("n", "<leader>esn", "<cmd>vnew<CR>139<C-w>|", { desc = "Write a New File in Special Size" }) -- write a new file in special size
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Vertically" }) -- split window vertically
keymap.set("n", "<leader>ssv", "139<C-w>|", { desc = "Special Vertical Resize" }) -- resize window vertically in special size
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontally" }) -- split window horizontally
keymap.set("n", "<leader>ssh", "<cmd>resize 12<CR>", { desc = "Special Horizontal Resize" }) -- resize window horizontally in special size
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split" }) -- close current split window
keymap.set("n", "<leader>st", "<C-w>s<cmd>resize 12 | terminal<CR>", { desc = "Open Terminal in Split" }) -- open terminal in split window
keymap.set("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Open Terminal" }) -- open terminal
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to Next Tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to Previous Tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open Current Buffer in New Tab" }) --  move current buffer to new tab
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})
vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
opt.relativenumber = true
opt.number = true
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true
-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
-- turn off swapfile
opt.swapfile = false
