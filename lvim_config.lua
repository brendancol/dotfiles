-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny




-- Show line numbers, ruler, and cursor line
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Terminal: hide line numbers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")

-- Backspace behavior
vim.opt.backspace = { "indent", "eol", "start" }

-- Escape insert mode with jk / kj
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- Escape terminal mode with jk / kj
vim.keymap.set("t", "jk", [[<C-\><C-n>]])
vim.keymap.set("t", "kj", [[<C-\><C-n>]])


-- Syntax highlighting
vim.cmd("syntax enable")
vim.cmd("syntax on")

-- Colors and terminal settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.encoding = "utf-8"

-- Custom commands to open terminal in split
vim.api.nvim_create_user_command("Vspt", function()
  vim.cmd("vsp term://zsh")
end, {})

vim.api.nvim_create_user_command("Spt", function()
  vim.cmd("sp term://zsh")
end, {})

lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope find_files<CR>"
vim.keymap.set("i", "<C-p>", "<Esc><cmd>Telescope find_files<CR>")
