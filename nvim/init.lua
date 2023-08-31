
local api = vim.api
local utils = require("utils")


-- check if we have the latest stable version of nvim
local expected_ver = "0.8.0"
local nvim_ver = utils.get_nvim_version()

if nvim_ver ~= expected_ver then
  local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, nvim_ver)
  api.nvim_err_writeln(msg)
  return
end

local core_conf_files = {
  "plug.vim",
  "globals.lua",
  "settings.lua",
  "plugins.lua",
  "typescript_setup.lua",
  "solidity_setup.lua",
  "autocomplite_setup.lua",
  "lspsaga_setup.lua",
  "base-setup.vim",
  "vim-tree-sutup.lua",
  -- "eslint_setup.lua"

}

-- source all the core config files
for _, name in ipairs(core_conf_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

-- vim.cmd('autocmd VimEnter * NvimTreeOpen')

vim.cmd("colorscheme kanagawa")