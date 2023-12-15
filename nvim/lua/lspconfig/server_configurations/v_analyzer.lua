local util = require 'lspconfig.util'

local uname = vim.loop.os_uname()
local OS = uname.sysname
local analyzer = OS:find 'Windows' and "C:/dev/apps/v-analyzer/bin/v-analyzer" or "/home/nikee/apps/v-analyzer/bin/v-analyzer"

return {
  default_config = {
    cmd = { analyzer },
    filetypes = { 'v', 'vlang' },
    root_dir = util.root_pattern('v.mod', '.git'),
  },
}
