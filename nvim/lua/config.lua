require('plugins')

require("mason").setup {
    ui = {
      icons = {
        package_installed = "",
        package_pending = "",
        package_uninstalled = "",
    },
    }
}

require("mason-lspconfig").setup {
  ensure_installed = { 'clangd' }
}

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {

}

vim.cmd [[
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
    
    au BufRead,BufNewFile *.rain setfiletype rain
]]

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1   


-- error-lens

require('error-lens').setup(client, {
  enabled = true,
})

-- Telescope

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg", "ppm", "pdf" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
  defaults = {
    file_ignore_patterns = {
        "^./.git/",
        "^./target/",
        "LICENSE*"
    },
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
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

-- RUST 

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

require('crates').setup {
  src = {
    coq = {
      enabled = true,
      name = "crates.nvim",
   },
  },
}


-- LSP Diagnostics Options Setup 

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})


--- Completion framework

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
    { name = "crates" }, -- Rust crates 
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "allw
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "toml", "vim", "json", "make", "markdown", "bash", "yaml",  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
  }
}

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Harpoon 

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-Tab>", function() ui.toggle_quick_menu() end)
vim.keymap.set("n", "<C-S>", function() mark.add_file() end)
vim.keymap.set("n", "<C-d>", function() ui.nav_prev() end)
vim.keymap.set("n", "<C-f>", function() ui.nav_next() end)

-- TODO-commnets

require('todo-comments').setup {}

-- FloaTerm

require 'FTerm'.setup({
  border     = 'single',
  cmd        = os.getenv('SHELL'),
  blend      = 0,
  dimensions = {
      height = 0.9,
      width = 0.9,
  },
})

vim.keymap.set('n', 't', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.g.python3_host_prog = 'C:/Users/myftr/AppData/Local/Microsoft/WindowsApps/python3.exe'

vim.g.loaded_ruby_provider = 0

vim.g.mapleader = "."
