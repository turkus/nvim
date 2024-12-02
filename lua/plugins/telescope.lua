local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-w>"] = actions.select_horizontal,
          },
          n = {
            ["<C-w>"] = actions.select_horizontal,
          },
        },
      }
    })
  end
}
