
require("packer").startup(function()
  use "wbthomason/packer.nvim"



  -- Nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })



  -- LSP server config
  use 'neovim/nvim-lspconfig'
  use {
    'kabouzeid/nvim-lspinstall',
  }
  -- Setup lspconfig.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true -- For HTML

  -- For loop to add servers in lsp
  local servers = { 'pyright', 'html', 'cssls', 'tailwindcss'}
  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      capabilities = capabilities,
    }
  end



  -- Indent Line
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }]]
  }



  -- Bottom lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require('lualine').setup{}]]
  }



  -- Github theme
  use {
    'projekt0n/github-nvim-theme',
    config = [[require("github-theme").setup{
      theme_style = "dark_default"
    }]]
  }



  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',


    config = [[require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained",
      sync_install = false,

      -- List of parsers to ignore installing
      ignore_install = { },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { },
      },
    }]]
  }



  -- Vim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }



  -- Auto comment
  use {
    "terrortylor/nvim-comment",
    require('nvim_comment').setup()
  }



  -- Color Highlight
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require 'colorizer'.setup {
      css = {
        RGB      = true; -- #RGB hex codes
        RRGGBB   = true; -- #RRGGBB hex codes
        names    = true; -- "Name" codes like Blue
        RRGGBBAA = true;
        rgb_fn   = true; -- rgb(_, _, _)
      }
    }
  end
}



end
)


