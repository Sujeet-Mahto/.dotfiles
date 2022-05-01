-- List of Lsp servers, html is setup separately down somewhere
-- Add "tailwindcss" when needed
local servers = { 'pyright', 'cssls', 'tsserver', 'clangd' }

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
    },
    {
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

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end


  -- For loop to add servers in lsp
  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end

  require("lspconfig")["html"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "htmldjango" },
  }



  -- Indent Line
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    } end
  }






  -- Github theme
  -- use {
    --   'projekt0n/github-nvim-theme',
    --   config = function() require("github-theme").setup{
      --     theme_style = "dark_default"
      --   } end
      -- }



      -- Treesitter
      use {
        'nvim-treesitter/nvim-treesitter',


        config = function() require'nvim-treesitter.configs'.setup {
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
        } end
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
        config = function() require('nvim_comment').setup{} end
      }



      -- Telescope
      use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
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
        } end
      }


      -- Github copilot
      use {
        "github/copilot.vim",
      }

      -- theme
      use {
        'Mofiqul/dracula.nvim',
      }



      -- Grovebox theme
      use {
        "morhetz/gruvbox",
      }



    end
    )

