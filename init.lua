vim.g.mapleader = " "
vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.relativenumber=true

-- stdpath("config"): /home/[userID]/.config 
local config_path = vim.fn.stdpath("config")
-- [string1] .. [string2] 
-- Concat the following path with /lua folder
-- [[v:val =~ '\.lua']] 
-- evaluate each files .lua in the lua folder
for _, file in ipairs(vim.fn.readdir(config_path .. "/lua", [[v:val =~ '\.lua$']])) do
  require(file:gsub("%.lua",""))
end
