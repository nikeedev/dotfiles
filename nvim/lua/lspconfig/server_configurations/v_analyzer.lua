local util = require 'lspconfig.util'

return {
  default_config = {
    cmd = { 'C:/dev/apps/v-analyzer/bin/v-analyzer' },
    filetypes = { 'v', 'vlang' },
    root_dir = util.root_pattern('v.mod', '.git'),
  },
}