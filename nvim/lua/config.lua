require('plugins')

require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}

require("mason-lspconfig").setup {
    ensure_installed = { 'clangd' }
}

require("lspconfig").clangd.setup {

}

--vim.tbl_deep_extend('keep', lsp, {
--	lsp_name = {
--		cmd = { 'command' },
--		filetypes = 'filetype',
--		name = 'lsp_name',
--	}
--})

local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        -- if util.get_current_buffer_file_name() == "special.lua" then
        --  return nil
        -- end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.cmd [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end

    colorscheme gruvbox
    syntax on


    set hidden
    set cursorline
    set expandtab
    set autoindent
    set smartindent
    set shiftwidth=4
    set tabstop=4

    set history=5000
    set clipboard=unnamedplus
    set number relativenumber
    set encoding=utf-8
    set mouse=a
    set visualbell
    set ruler
    set wildmode=longest,list,full
    set wildmenu
    set autoindent
    set wrap
    set laststatus=2
    
    au BufNewFile,BufRead *.v set filetype=vlang
 
    inoremap <expr> <TAB> pumvisible() ? "<TAB>" : "<C-d>"
]]

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1   

require('error-lens').setup(client, {})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {        
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell
    },
})

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:

require("telescope").load_extension "file_browser"


vim.api.nvim_set_keymap(
  "n",
  "<space>d",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "allw
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-d>", function() ui.nav_prev() end)

vim.keymap.set("n", "<C-f>", function() ui.nav_next() end)


