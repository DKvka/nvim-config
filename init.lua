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
    require('plugins.treesitter'),
    require('plugins.autopairs'),
    require('plugins.theme'),
    require('plugins.surround'),
    require('plugins.lsp'),
    require('plugins.hardtime'),
    require('plugins.precognition'),
})


-- Custom appearance
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


-- Editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Keybindings
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Open :Ex file explorer' })
vim.keymap.set('n', '<leader>h', '^', { desc = 'Move to beginning of line' })
vim.keymap.set('n', '<leader>l', '$', { desc = 'Move to end of line' })
vim.keymap.set('n', '<leader>j', '10j', { desc = 'Move down 10 lines' })
vim.keymap.set('n', '<leader>k', '10k', { desc = 'Move up 10 lines' })


-- Highlight text when yanked
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight text when yanked (copied)',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- Change working dir when moving in explorer
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft == "netrw" then
      vim.cmd("silent! lcd %:p:h")
    elseif vim.fn.expand("%:p:h") ~= "" then
      vim.cmd("silent! lcd " .. vim.fn.expand("%:p:h"))
    end
  end,
})


-- Setup errors and warnings when working on code files
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
    spacing = 4,  -- Space between code and text
  },
  signs = false,          -- Show signs in the gutter
  underline = true,      -- Underline problematic text
  update_in_insert = false, -- Avoid updating while typing
})

