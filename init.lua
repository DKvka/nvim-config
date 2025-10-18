vim.g.mapleader = " "

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Load plugins
require("lazy").setup({
  -- Add your plugins here
    require('plugins.treesitter'),
    require('plugins.autopairs'),
    require('plugins.theme'),
    require('plugins.surround'),
    require('plugins.lsp'),
})


vim.cmd("colorscheme tokyonight")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Open :Ex file explorer' })


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "netrw" then
      vim.cmd("silent! lcd %:p:h")
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    -- Different symbols for each severity
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return "❌ "  -- Error symbol
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return "⚠️ "  -- Warning symbol
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return "ℹ️ "  -- Info symbol
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return "💡 "  -- Hint symbol
      else
        return "● "   -- Default fallback
      end
    end,
    spacing = 2,  -- Space between code and text
  },
  signs = false,          -- Show signs in the gutter
  underline = true,      -- Underline problematic text
  update_in_insert = false, -- Avoid updating while typing
})

