-- ~/.config/nvim/lua/options.lua

require "nvchad.options"

local opt = vim.opt
local cmd = vim.cmd

-- Encoding & compatibility
opt.compatible = false
opt.encoding = "utf-8"
cmd("syntax on")

-- UI
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.wrap = false
opt.scrolloff = 5
opt.laststatus = 2

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Tabs and indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true

-- Ignore global clipboard override
vim.opt.clipboard = ""
