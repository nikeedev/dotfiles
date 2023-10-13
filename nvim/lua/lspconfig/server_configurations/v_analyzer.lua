local util = require 'lspconfig.util'

return {
  default_config = {
    cmd = { '/home/nikee/apps/v-analyzer/bin/v-analyzer' },
    filetypes = { 'v', 'vlang' },
    root_dir = util.root_pattern('v.mod', '.git'),
  },
}
