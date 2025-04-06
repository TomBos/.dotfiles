vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.o.termguicolors = true
vim.o.mouse = ""

-- Nvim package manager
require("config.lazy")

-- Color Scheme
require('onedark').load()

-- Telescope (File Search)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

-- Telescope (Live Grep)
vim.keymap.set("n", "<C-e>", builtin.live_grep, {})

-- Neotree (File Explorer)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal<CR>", {}) 



