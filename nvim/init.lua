local home_dir = "/home/hattori"

local node_bin =  "/.nvm/versions/node/v20.10.0/bin"

-- vim.g.node_host_prog = home_dir .. node_bin .. "/node"
-- vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

-- Packer
require('plugins')
require('settings')
require('settings.completion')
--require('settings.dap')
-- Keymap
require('settings.keymap')
