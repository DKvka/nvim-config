return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "lua", "python", "javascript", "html", "css", "go", "c", -- add languages you use
      },
      highlight = {
        enable = true,            -- Enable syntax highlighting
      },
      indent = {
        enable = true,            -- Enable Tree-sitter-based indentation
      },
    }
  end,
}

