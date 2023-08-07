--[=[
!DEPRECATED!
install vscode chrome debug
```
git clone https://github.com/Microsoft/vscode-chrome-debug ~/.DAP/vscode-chrome-debug
cd ~/.DAP/vscode-chrome-debug
npm install
npm run build
```
run chrome with argument `--remote-debugging-port=9222`
```
chrome --remote-debugging-port=9222
```

!DEPRECATED!
install vscode node debug2
```
git clone https://github.com/microsoft/vscode-node-debug2.git ~/.DAP/vscode-node-debug2
cd ~/.DAP/vscode-node-debug2
npm install
NODE_OPTIONS=--no-experimental-fetch npm run build
```
and run any node using flag `--inspect` or `--inspect-brk`, you can also debug deno using the same flag

debugging ts project using ts-node
install ts-node on local project or global
```
npm i -D ts-node
```
you can start debug with this commnad and attach or just launch
```
node -r ts-node/register --inspect <ts file>
```

install vscode js debug
```
git clone https://github.com/microsoft/vscode-js-debug ~/.DAP/vscode-js-debug --depth=1
cd ~/.DAP/vscode-js-debug
npm install --legacy-peer-deps
npm run compile && npx gulp vsDebugServerBundle
```

--]=]

local dap = require('dap')
local dapui = require('dapui')

-- # Sign
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#E51302' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', {  fg = '#98c379', bg = '#4B4B17' })
vim.api.nvim_set_hl(0, 'DapStopped2', {  bg = '#4B4B17' })


vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpoint', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped2', numhl= 'DapStopped' })


-- # DAP Virtual Text
require('nvim-dap-virtual-text').setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  filter_references_pattern = '<module',
  virt_text_pos = 'eol',
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
})

-- # DAP UI
require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7'),
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        { id = 'repl', size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'rounded', -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = { 
    max_type_length = nil,
  }
})
dap.listeners.after.event_initialized['dapui_config'] = function()
  vim.cmd('tabfirst|tabnext')
  dapui.open()
  vim.cmd[[
    :NvimTreeClose
  ]]
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dap.disconnect({ terminateDebuggee = true })
  vim.cmd[[
    :NvimTreeOpen
    :! fuser -k -n tcp 3000
    :! for pid in $(ps -ef | awk '/vsDebugServer/ {print $2}'); do kill -9 $pid; done
  ]]
  dap.close()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- # Keymap
local buf_map = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts or {
    silent = true,
  })
end

buf_map('n', '<F9>', ':lua require(\'dap\').toggle_breakpoint()<CR>')
buf_map('n', '<F21>', ':lua require(\'dap\').set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
buf_map('n', '<F45>', ':lua require(\'dap\').set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
buf_map('n', '<c-A-d>',  ':lua require(\'dap\').continue()<CR>')
  buf_map('n', '<F41>', ':lua require(\'dap\').run_to_cursor()<CR>')
  buf_map('n', '<F17>', ':lua require(\'dap\').terminate()<CR>')
buf_map('n', '<F10>', ':lua require(\'dap\').step_over()<CR>')
buf_map('n', '<F11>', ':lua require(\'dap\').step_into()<CR>')
buf_map('n', '<F23>', ':lua require(\'dap\').step_out()<CR>')

buf_map('n', '<C-D>', ':lua require(\'dapui\').toggle()<CR>')

-- # DAP Config
local dap = require('dap')
require('dap-python').setup('/home/hattori/.pyenv/shims/python')

-- !DEPRECATED!
-- dap.adapters.chrome = {
--   type = 'executable',
--   command = 'node',
--   args = { os.getenv('HOME') .. '/.DAP/vscode-chrome-debug/out/src/chromeDebug.js' },
-- }

-- !DEPRECATED!
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = { os.getenv('HOME') .. '/.DAP/vscode-node-debug2/out/src/nodeDebug.js' },
-- }



require('dap-vscode-js').setup({
  node_path = 'node',
  debugger_path = os.getenv('HOME') .. '/.DAP/vscode-js-debug',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

local exts = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  -- using pwa-chrome
  'vue',
  'svelte',
  'python',
}

dap.adapters.node = {
  type = 'executable',
  command = 'node',
    args = { os.getenv('HOME') .. '/.DAP/vscode-node-debug2/out/src/nodeDebug.js' },
  -- args = { os.getenv('HOME') .. '/.DAP/vscode-js-debug'},
}

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'NestJS API (pwa-node)',
      skipFiles = { '<node_internals>/**' },
      runtimeExecutable = 'npm',
      runtimeArgs = { 'run', 'start:dev' },
      console = 'integratedTerminal',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      envFile = '${workspaceFolder}/.env',
    },
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch Test Current File (pwa-node with jest)',
    --   program: '${workspaceFolder}/node_modules/.bin/jest',
    --   cwd = vim.fn.getcwd(),
    --   runtimeArgs = { '${fileBasenameNoExtension}' },
    --   runtimeExecutable = 'node',
    --   args = { '${file}', '--coverage', 'false'},
    --   rootPath = '${workspaceFolder}',
    --   sourceMaps = true,
    --   console = 'integratedTerminal',
    --   internalConsoleOptions = 'neverOpen',
    --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
    -- },
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch Current File (pwa-node)',
    --   cwd = vim.fn.getcwd(),
    --   args = { '${file}' },
    --   sourceMaps = true,
    --   protocol = 'inspector',
    -- },
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch Current File (pwa-node with ts-node)',
    --   cwd = vim.fn.getcwd(),
    --   runtimeArgs = { '--loader', 'ts-node/esm' },
    --   runtimeExecutable = 'node',
    --   args = { '${file}' },
    --   sourceMaps = true,
    --   protocol = 'inspector',
    --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
    --   resolveSourceMapLocations = {
    --     "${workspaceFolder}/**",
    --     "!**/node_modules/**",
    --   },
    -- },
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch Test Current File (pwa-node with vitest)',
    --   cwd = vim.fn.getcwd(),
    --   program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
    --   args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
    --   autoAttachChildProcesses = true,
    --   smartStep = true,
    --   console = 'integratedTerminal',
    --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
    -- },
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch Test Current File (pwa-node with deno)',
    --   cwd = vim.fn.getcwd(),
    --   runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
    --   runtimeExecutable = 'deno',
    --   attachSimplePort = 9229,
    -- },
 {
        type = "pwa-chrome",
        name = "Attach - Remote Debugging",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
      {
        type = "pwa-chrome",
        name = "Launch Chrome",
        request = "launch",
        url = "http://localhost:3000",
      },    
      {
        type = 'python',
        request = 'launch',
        name = 'Python Debug',
        program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      },
    -- {
    --   type = 'node2',
    --   request = 'attach',
    --   name = 'Attach Program (Node2)',
    --   processId = require('dap.utils').pick_process,
    -- },
    -- {
    --   type = 'node2',
    --   request = 'attach',
    --   name = 'Attach Program (Node2 with ts-node)',
    --   cwd = vim.fn.getcwd(),
    --   sourceMaps = true,
    --   skipFiles = { '<node_internals>/**' },
    --   port = 9229,
    -- },
    -- {
    --   type = 'pwa-node',
    --   request = 'attach',
    --   name = 'Attach Program (pwa-node)',
    --   cwd = vim.fn.getcwd(),
    --   processId = require('dap.utils').pick_process,
    --   skipFiles = { '<node_internals>/**' },
    -- },
  }
end

local json5 = require('json5')
require('dap.ext.vscode').json_decode = json5.parse
-- ## DAP `launch.json`
require('dap.ext.vscode').load_launchjs(nil, {
  ['python'] = {
    'python',
  },
  ['pwa-node'] = {
    'javascript',
    'typescript',
  },
  ['pwa-chrome'] = {
    'javascriptreact',
    'typescriptreact',
  },
  ['chrome'] = {
    'javascriptreact',
    'typescriptreact',
  },
  ['node'] = {
    'javascript',
    'typescript',
  },
  ['cppdbg'] = {
    'c',
    'cpp',
  },
  ['dlv'] = {
    'go',
  },
})

