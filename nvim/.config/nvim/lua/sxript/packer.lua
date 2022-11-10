local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  
  -- Themes
  use('folke/tokyonight.nvim')
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  -- LSP
  use("neovim/nvim-lspconfig")

  -- CMP
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')
  use('onsails/lspkind-nvim')
  use('hrsh7th/nvim-cmp')

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Which key
  -- use('folke/which-key.nvim')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)